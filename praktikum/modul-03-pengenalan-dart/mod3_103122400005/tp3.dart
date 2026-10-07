import 'dart:math';

void buatDanTransposeMatriks(int a, int b) {
  var random = Random();

  List<List<int>> matriks = List.generate(
    a,
    (_) => List.generate(b, (_) => random.nextInt(9) + 1),
  );

  print('Matriks A x B');
  print('A: $a');
  print('B: $b');
  print('Isi matriks:');
  for (var baris in matriks) {
    print(baris.join(' '));
  }

  print('\nHasil transpose: ');

  for (int col = 0; col < b; col++) {
    List<int> barisTranspose = [];
    for (int row = 0; row < a; row++) {
      barisTranspose.add(matriks[row][col]);
    }
    print(barisTranspose.join(' '));
  }
}

void main() {
  buatDanTransposeMatriks(3, 2);
}
