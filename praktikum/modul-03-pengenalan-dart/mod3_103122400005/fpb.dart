void hitungFPB(int bil1, int bil2) {
  print('Bilangan 1: $bil1');
  print('Bilangan 2: $bil2');

  int a = bil1;
  int b = bil2;

  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }

  print('FPB $bil1 dan $bil2 = $a');
}

void main() {
  print('Nadia Tambunan - 103122400005');
  hitungFPB(48, 18);
  print('');
  hitungFPB(27, 18);
}
