fn main() {

    // Question 1: Rust represents boolean values as true false values
    let mut first_bool = 1 == 3;
    let mut second_bool = 5 == 5;

    println!("{}", first_bool); // prints false
    println!("{}", second_bool); // prints true

    // Question 2: expressions || and && are short circuited in Rust
    first_bool = true || display_function_return_true(); // Does not call the function
    second_bool = false && display_function_return_true(); // Does not call the function
    first_bool = false || display_function_return_true(); // Calls the function
    second_bool = true && display_function_return_true(); // Calls the function

    // Question 3: Short-circuit evaluation in Rust
    println!("-----The OR (||) evaluation-----");
    first_bool = false || display_function_return_false() || true || display_function_return_false() || display_function_return_true();
    println!("-----The AND (&&) evaluation-----");
    first_bool = true && display_function_return_true() && display_function_return_true() && false && display_function_return_true();

    // Question 4: Advantages of short-circuit evaluation in Rust
    let list = [1, 2, 3, 4, 5, 6, 7, 8];
    let list_size = 8;
    let mut i = 0;
    while i < list_size && list[i] != 34 {
        i = i + 1;
    }
    // list[i]; // If we tried to reach the ith element in the last iteration we get exception

    // Question 5: Disadvantages of short-circuit evaluation in Rust
    let mut a = 10;
    let mut b = 20;

    if a != b || important_function() {}
    // Important function is never called



}

fn display_function_return_true() -> bool{
    println!("Displaying a test string and returns true");
    return true;
}
fn display_function_return_false() -> bool{
    println!("Displaying a test string and returns false");
    return false;
}

fn important_function() -> bool {
    println!("It is an important function call");
    return true;
}
