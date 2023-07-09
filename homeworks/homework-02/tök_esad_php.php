<?php
  // Question 1: PHP has a primitive type boolean but it can represent bool values by conversion of data types
  var_dump(true);
  var_dump(false);
  var_dump((bool) 0);
  var_dump((bool) 1);
  var_dump((bool) "");
  var_dump((bool) "0");
  var_dump((bool) "27");
  var_dump((bool) "Test");
  var_dump((bool) array());
  var_dump((bool) array(5));


  // Question 2: PHP has short-circuited operators
  if (true || sayHello()) {} // Does not call the function
  if (false && sayHello()) {} // Does not call the function
  if (true or sayHello()) {} // Does not call the function
  if (false and sayHello()) {} // Does not call the function
  if (true | sayHello()) {} // Evaluates both expressions
  if (false & sayHello()) {} // Evaluates both expressions

  // Question 3: Evaluation of short-circuit
  // Evaluation example for the OR operator
  $x = (false || printMsgReturnFalse() || printMsgReturnFalse() || false || printMsgReturnTrue() || printMsgReturnTrue());
  var_dump($x);

  // Evaluation example for the AND operator
  $y = (true && printMsgReturnTrue() && printMsgReturnTrue() && false && printMsgReturnTrue() && printMsgReturnFalse());
  var_dump($y);

  // Question 4: Advantages of short-circuit Evaluation
  $list = array("Esat", "Merve", "Hasan", "Sena");
  $length = 4;
  $count = 0;

  while ($count < $length && $list[$count] != 20) {
    $count = $count + 1;
  }

  // Question 5: Disadvantages of short-circuit Evaluation
  $importantVariable = 126;
  if (12 > 20 || incrementValue($importantVariable)) {}
  echo "The value of the important variable is: ", $importantVariable, "\n"; // Not changed



  function sayHello() {
    echo "Hello\n";
  }

  function printMsgReturnTrue() {
    echo  "This is a test message and true is returned\n";
    return true;
  }
  function printMsgReturnFalse() {
    echo  "This is a test message and false is returned\n";
    return false;
  }

  function incrementValue($val) {
    $val = $val + 1;
    return true;
  }

?>
