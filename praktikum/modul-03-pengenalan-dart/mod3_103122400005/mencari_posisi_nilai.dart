// Nadia Tambunan - 103122400005

void cariPosisiNilai(int dicari) {
  List<List<int>> data = [
    [5, 10, 15],
    [2, 4, 6, 8],
    [1, 4, 9, 16, 25],
    [3, 4, 5, 6, 7, 8],
  ];

  print('Isi List:');
  for (var baris in data) {
    print(baris.join(' '));
  }
  print('');

  print('Bilangan yang dicari: $dicari');

  // Proses pencarian
  bool ditemukan = false;
  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < data[i].length; j++) {
      if (data[i][j] == dicari) {
        print('$dicari berada di:');
        print('baris ${i + 1} kolom ${j + 1}');
        ditemukan = true;
        break;
      }
    }
    if (ditemukan) break;
  }

  if (!ditemukan) {
    print('$dicari tidak ditemukan di dalam List.');
  }
}

void main() {
  // Contoh 1
  cariPosisiNilai(2);
  print('\n--------------\n');
  // Contoh 2
  cariPosisiNilai(11);
}
