void learnToHello(String name) {
  print(name);
}

String hello(double a) {
  return "Hello $a";
}

double sum(double a, double b) {
  return a + b;
} // tipe data dari nilai return wajib sama dengan tipe data yang didefinisikan pada fungsi. Jika tidak sama maka akan error.

// alternatifnya jg bisa seperti berikut
int sum2(double a, double b) {
  return (a + b).toInt();
}

dynamic multiple1(int a, int b) {
  return a * b;
}

dynamic multiple2(int a, [int b = 10]) {
  //optional parameter
  return a * b;
}

dynamic minus({required int a, required int b}) {
  return a - b;
}

//Arrow funtion. sama kayak function pada umumnya, tapi dia gaada namanya
var arrowFunction = (int a, int b) => a + b;

void main() {
  print("function multiple1:");
  print(multiple1(2, 2));
  print("function multiple2:");
  print(multiple2(2));
  print("function minus:");
  print(
    minus(b: 1, a: 10),
  ); // tidak bergantung pada urutan parameter karena menggunakan named parameter
  learnToHello("Nadia Tambunan");
  print(hello(22.0));
  print("function sum:");
  print(sum(10.0, 20.0));
  print("function sum2:");
  print(sum2(10.0, 20.0));
}
