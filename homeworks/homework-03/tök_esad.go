package main

import "fmt"

// Function that takes the parameters as pass by value
func showPassByValue(val int) {
  fmt.Println("The value of the parameter is ", val, " before the change in the function")
  val = 120
  fmt.Println("The value of the parameter is ", val, " after the change in the function")
}

func showPassByReference(val *int) {
  fmt.Println("The value of the parameter is ", *val, " before the change in the function")
  *val = 120
  fmt.Println("The value of the parameter is ", *val, " after the change in the function")
}

func showVariadicArgs(vals ...int) {
  for i := 0; i < len(vals); i++ {
    fmt.Println("The value of the ", (i + 1), "th parameter is ", vals[i])
  }
}

func main() {

	// Question 1: Nested Functions
  // Anonymous function that is executed within the definition phase
	func(x int, y int) {
    fmt.Println("The addition of the parameters ", x, "and ", y, " is ", x+y)
  }(5, 7)

	fmt.Println("------------------")

  // Anonymous function that is assigned to a variable and then used when it is called
  subtractFunct := func(first int, second int) {
    fmt.Println("This is a subtraction function and the result with the parameters ", first, "and ", second, " is ", first-second)
  }

  subtractFunct(17, 7)
  fmt.Println("------------------")

  // Question 2: Scope of local varibales
  var locVar int = 1;
  fmt.Println("The value of the local variable inside the main function is ", locVar)

  for i := 0; i < 3; i++ {
    fmt.Println("The value of the local variable inside the for block is ", locVar)
  }

  func(temp int) {
    fmt.Println("The value of the local variable inside a nested funtion is ", locVar)
  }(0)
  fmt.Println("------------------")


  // Question 3: Parameter passing methods
  var number int = 2;

  // Pass by value example
  fmt.Println("The value of the parameter is ", number, " in the main function before the pass by value")
  showPassByValue(number) // Pass by value does not affect the parameter
  fmt.Println("The value of the parameter is ", number, " in the main function after the pass by value")
  fmt.Println("------------------")

  // Pass by reference example
  fmt.Println("The value of the parameter is ", number, " in the main function before the pass by reference")
  showPassByReference(&number) // Pass by reference takes the address of the variable
  fmt.Println("The value of the parameter is ", number, " in the main function after the pass by reference")
  fmt.Println("------------------")

  // Question 4: Keyword and default parameters
  showVariadicArgs()
  showVariadicArgs(5)
  fmt.Println("------------------")
  showVariadicArgs(12, 23, 14, 54, 6)
  fmt.Println("------------------")
  showVariadicArgs(1, 2, 3)
  fmt.Println("------------------")

  // Question 5: Closures
  var closureVar int = 0

  incrementFunct := func() int {
    closureVar = closureVar + 1
    return closureVar
  }

   fmt.Println(incrementFunct())
   fmt.Println(incrementFunct())
   fmt.Println(incrementFunct())
   fmt.Println(incrementFunct())
   fmt.Println(incrementFunct())


}
