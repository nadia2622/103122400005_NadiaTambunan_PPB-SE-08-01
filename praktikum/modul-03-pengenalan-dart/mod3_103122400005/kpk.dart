// Nadia Tambunan - 103122400005
int cariFPB(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

// Fungsi utama untuk mencari KPK
void hitungKPK(int bil1, int bil2) {
  print('Bilangan 1: $bil1');
  print('Bilangan 2: $bil2');

  // Rumus KPK: (a * b) / FPB(a, b)
  int kpk = (bil1 * bil2) ~/ cariFPB(bil1, bil2);

  print('KPK $bil1 dan $bil2 = $kpk');
}

void main() {
  print('Nadia Tambunan - 103122400005');
  hitungKPK(12, 8);
  print('');
  hitungKPK(15, 20);
}
