class PerhitunganModel {
  final num angka1;
  final num angka2;
  final String operasi;
  final num hasil;

  PerhitunganModel({
    required this.angka1,
    required this.angka2,
    required this.operasi,
    required this.hasil,
  });

  String get namaOperasi {
    switch (operasi) {
      case '+':
        return 'penjumlahan';
      case '-':
        return 'pengurangan';
      case '×':
      case '*':
        return 'perkalian';
      case '÷':
      case '/':
        return 'pembagian';
      default:
        return 'operasi';
    }
  }

  static String formatAngka(num n) {
    return n % 1 == 0 ? n.toInt().toString() : n.toString();
  }

  String get formatRiwayat {
    return '${formatAngka(angka1)} $operasi ${formatAngka(angka2)} = ${formatAngka(hasil)}';
  }

  String get keterangan {
    return 'Hasil $namaOperasi antara ${formatAngka(angka1)} dan ${formatAngka(angka2)} adalah ${formatAngka(hasil)}';
  }
}
