// This essentially implements the LongValueSum reducer in Hadoop's aggregate
// class, but with a few changes.

#include <cstdio>
#include <string>

void emitSumOfKeys(const char* key, int value) {
    // Only emit those docs that share quite a bit of shingles in common.
    if (value > 1) {
        printf("%s\t%d\n", key, value);
    }
}

int main() {
    char key[1000];
    int value;
    std::string prevKey;
    int inCommon = 0;

    while (scanf("LongValueSum:%s\t%d\n", key, &value) != EOF) {
        if (prevKey != key && !prevKey.empty()) {
            emitSumOfKeys(prevKey.c_str(), inCommon);
            inCommon = 0;
        }
        inCommon += value;
        prevKey = key;
    }

    emitSumOfKeys(prevKey.c_str(), inCommon);

    return 0;
}