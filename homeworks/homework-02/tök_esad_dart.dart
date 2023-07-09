void main() {
  // Question 1: Dart only allows true and false keywords to represent booleans
  var val1 = true;
  var val2 = false;
  var wrongVal1 = 1;
  var wrongVal2 = 0;

  print(val1);
  print(val1);

  // Below is a comparison between unrelated types since one is boolean and the other is integer
  print(val1 == wrongVal1); // Result is false
  // print(val1 && wrongVal2); // Gives error since 0 is not considered as boolean

  // Question 2: && and || operators are short circuited
  var firstCounter = 0;
  var secondCounter = 0;

  // Short circuit of the || operator
  while(firstCounter++ < 10 || secondCounter++ < 10) {}

  print("First counter is: $firstCounter");
  print("Second counter is: $secondCounter");

  firstCounter = 0;
  secondCounter = 0;

  // Short circuit of the && operator
  if(firstCounter++ > 0 && secondCounter++ > 0) {}

  print("First counter is: $firstCounter");
  print("Second counter is: $secondCounter");

  // Question 3: The boolean expressions are calculated starting from the left
  // OR (||) operator needs a true value in order to return a true, so it executes starting from the left until it finds a true value and does not calculate the rest
  if (10 < 20 || sayHelloTrue()) {}
  if (sayHelloFalse() || 10 < 20 || sayHelloTrue()) {}

  if (10 > 20 || false || sayHelloFalse()) {} // Calculated all

  // AND (&&) operator needs a false value in order to return false, so it executes starting from the left until it finds a false value and does not calculate the rest
  if (10 > 20 && sayHelloFalse()) {}
  if (sayHelloTrue() && 10 > 20 && sayHelloFalse()) {}

  if (10 < 20 && true && sayHelloTrue()) {} // Calculated all

  // Question 4: Advantages of short-circuit evaluation
  var list = [1, 2, 3, 4, 5, 6];
  var length = 6;
  var i = 0;
  while (i < length && list[i] != 20) {
    i++;
  }

 // Question 5: Potential problems of short-circuit evaluation
  var a = 5;
  var b = 10;
  var c = 0;

  if (a < b || c++ > 0) {} // c is never incremented
  print("The value of c in the rest of the program: $c"); // c = 0

}


bool sayHelloFalse() {
  print("Hello To You and Return False");
  return false;
}

bool sayHelloTrue() {
  print("Hello To You and Return True");
  return true;
}
