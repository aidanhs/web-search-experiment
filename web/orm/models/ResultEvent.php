<?php
/**
 * "Visual Paradigm: DO NOT MODIFY THIS FILE!"
 * 
 * This is an automatic generated file. It will be regenerated every time 
 * you generate persistence class.
 * 
 * Modifying its content may cause the program not work, or your work may lost.
 */

/**
 * Licensee: Mack Duan
 * License Type: Evaluation
 */

class ResultEvent extends Event {
  public function setUp() {
    parent::setUp();
    $this->hasOne('Result as result', array(
        'local' => 'ResultID', 
        'foreign' => 'ID'
      )
    );
  }
  
}

?>
