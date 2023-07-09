<?php
  // Question 1: sinnce php arrays are ordered maps all types are allowed as subscripts
  $ordredMapArray = [
    true => 1,
    "Test" => 2,
    1 => 3,
    2.0 => 4
  ];

  echo $ordredMapArray[true], "\n";
  echo $ordredMapArray["Test"], "\n";
  echo $ordredMapArray[1], "\n";
  echo $ordredMapArray[2.0], "\n";



  // Question 2: Range check is done but does not cause a code crash
  $arr = array(1, 2, 3, 4, 5); // Regular indexes has been assigned as the keys of the ordered map
  echo $arr[0], "\n"; // Valid
  echo $arr[1], "\n"; // Valid
  echo $arr[2], "\n"; // Valid
  echo $arr[12], "\n"; // Not valid but does not give error

  // Question 3 and Question 4: In dynamic array of PHP, both subscript range binding and allocation takes place at run time
  $dyArr = array();
  var_dump($dyArr); // Array before the size growth
  $dyArr[] = 1;
  $dyArr[] = 2;
  $dyArr[] = 3;
  var_dump($dyArr); // Array after the size growth



  // Question 5: Both rectangular and jagges arrays are allowed in PHP
  $arrRectangular = [[2, 4, 6, 8], [4, 6, 8, 10], [1, 2, 3, 4]];
  var_dump($arrRectangular);

  $arrJagged = [[3], [5, 10, 15], [1, 2]];
  var_dump($arrRectangular);


  // Question 6: array objects can be initialized
  $initArr = ["Esad", "Başar", "Hasan", "Merve"];
  var_dump($initArr);


  // Question 7: Slices are supported in PHP
  $testArr = [1, 2, 3, 4, 5, 6, 7, 8];
  $slicedArr = array_slice($testArr, 1, 4); // Returns [2, 3, 4]
  $slicedArr = array_slice($testArr, 4); // Returns [5, 6, 7, 8]
  $slicedArr = array_slice($testArr, -2, 1); // Returns [7]

  // Question 8: Operators
  $arr1 = [1, 2, 3, 4, 5, 6];
  $arr2 = [7, 8, 9, 10];
  $arr3 = [1, 2, 3, 4, 5, 6];

  var_dump($arr1 + $arr2); // Union
  var_dump($arr1 == $arr2); // Equality
  var_dump($arr1 == $arr3); // Equality
  var_dump($arr1 === $arr2); // Identity
  var_dump($arr1 === $arr3); // Identity
  var_dump($arr1 != $arr2); // Inequality
  var_dump($arr1 <> $arr2); // Inequality
  var_dump($arr1 !== $arr2); // Non-Identity

?>
