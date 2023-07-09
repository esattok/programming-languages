void main() {
  // Question 1: Dart does not support subscript types other than integer type
  var list = [1, 2, 3, 4, 5];
  for(int i = 0; i < list.length; i++){
    print(list[i]);
    // Belove subscript types are not allowed since they are not integers
    //print(list[true]);
    //print(list[1.0]);
    //print(list["X"]);
  }
  print("-----------------------------------------");
  
  // Question 2: Dart is range checked in run time
  for(int i = 0; i < list.length; i++){
    print(list[i]);
    // Below lines give script error because the indexes are out of bounds
    //list[-2] = 14;
    //list[7] = 14;
    //list[19] = 14;
  }
  print("-----------------------------------------");
  
  // Question 3, 4: Subscript ranges are bound at run time in Dart. Moreower the allocation also takes place at run time in heap.
  var names = new List(4);
  // Even if we use new keyword in dart, the array is fixed sized and cannot grow and shrink. However it is still dynamically bound at run time.
  names[0] = "Esad";
  names[1] = "Başar";
  names[2] = "Merve";
  names[3] = "Sena";
  print(names);
  print("-----------------------------------------");
  
  
  // Question 5: Dart allows both rectangular and jagged arrays as multidimentional arrays
  var firstDim = [5,4,3,2, 1];
  var secondDim = [firstDim,firstDim,firstDim,firstDim];
  for(int i = 0; i < secondDim.length; i++){
    for(int j = 0; j < firstDim.length; j++){
      print(secondDim[i][j]);
    }
  }
  print("-----------------------------------------");
  
  var arr1 = [13, 4, 17, -5];
  var arr2 = [-1,6];
  var arr3 = [10];
  var jaggedArr = [arr1,arr2,arr3];
  for(int i = 0; i < jaggedArr.length; i++){
    for(int j = 0; j < jaggedArr[i].length; j++){
      print(jaggedArr[i][j]);
    }
  }
  print("-----------------------------------------");

  // Question 6: In Dart it is possible to initialize the objects
  var fixedSize = new List(10); // This array is fixed size and initialization is not done when we use this decleration
  var arrInit = [1,2,3,4,5]; // Here we do array initialization and the size of the array is decşded according to the initialization

  print("-----------------------------------------");

  // Question 7: Dart supports slices by the sublist function
  var baseArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var slicedArr = baseArr.sublist(1, 4);
  print(slicedArr);

  // Question 8: Dart has 4 operators
  var list1 = [1, 2, 3];
  var list2 = [4, 5, 6];
  print(list1 + list2); // Op1
  print(list1 == list2); // Op2
  print(list2[0]); // Op3
  list2[0] = 24; // Op4
  print(list2[0]);

  print("-----------------------------------------");
}