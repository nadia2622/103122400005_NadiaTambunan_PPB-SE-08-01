void main() {
  var a = 10;
  if (a == 10) {
    print("a is equal to 10");
  } else if (a > 10) {
    print("a is greater than 10");
  } else {
    print("a is less than 10");
  }

  switch (a) {
    case 10:
      print("a is equal to 10");
      break;
    case 20:
      print("a is equal to 20");
      break;
    default:
      print("a is neither 10 nor 20");
  }

  // Looping
  for (var i = 0; i < 5; i++) {
    print("i: $i");
  }

  var fruits = ['apple', 'banana', 'orange'];
  for (var i = 0; i < fruits.length; i++) {
    print("Fruit: ${fruits[i]}");
  }
  for (var fruit in fruits) {
    print("Fruit: $fruit");
  }
}
