// Mapper for clustering (finding disjoint sets of similar documents)
// <docId pair, # common shingles> --> weighted undirected edges of similiarity
// graph

#include <cstdio>
#include <string>
#include <cassert>
#include <cstring>

#include "constants.h"

using dedup::DOC_ID_SEP;
using dedup::DOC_SIZE_SEP;

// Emits a docId pair if the two docs are near-duplicates This is a weighted
// undirected edge in our similarity graph. Appends the Jaccard similarity of
// doc1 and doc2 as the weight, for use by the reducer to generate avg cluster
// similarity info.
void emitEdge(const std::string& key, int intersection) {
    static char doc1[1000], doc2[1000];
    static int size1, size2;
    // TODO: Don't hard-code the DOC_SIZE_SEP into the format string
    assert(strcmp(DOC_SIZE_SEP, "|") == 0);
    static std::string formatStr = std::string("%[^|]|%d") + DOC_ID_SEP + "%[^|]|%d";
    sscanf(key.c_str(), formatStr.c_str(), doc1, &size1, doc2, &size2);
    double jaccard = static_cast<double>(intersection) / (size1 + size2 - intersection);

    if (jaccard >= dedup::NEAR_DUPLICATE_THRESHOLD) {
        // We need everything to go to the same reducer
        printf("1\t%s\t%s\t%.4f\n", doc1, doc2, jaccard);
    }
}

int main() {
    char key[1000];
    int value;
    while (scanf("%s\t%d\n", key, &value) != EOF) {
        emitEdge(key, value);
    }

    return 0;
}
