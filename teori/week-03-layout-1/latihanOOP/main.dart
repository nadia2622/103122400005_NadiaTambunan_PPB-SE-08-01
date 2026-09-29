import 'mobil.dart';
import 'format_kecepatan.dart';

// Function parameter (Dart tidak mendukung overloading,
// jadi nama fungsi ke-2 dibedakan)
void tampilkanMobil(String nama, int kecepatan) {
  print('$nama, $kecepatan km/jam');
}

void tampilkanMobilOpsional(String nama, [String? warna]) {
  print('$nama, warna: ${warna ?? 'tidak diketahui'}');
}

void dataMobil({required String nama, String warna = 'Hitam'}) {
  print('$nama, warna: $warna');
}

void main() {
  var mobil = Mobil(
    'Avanza',
    2022,
    namaPemilik: 'Nadia',
    tahunProduksi: 2022,
    nama: 'Avanza',
    nomorPolisi: 1234,
  );

  mobil.registrasiMesin('MSN-001'); // wajib dipanggil dulu karena late
  mobil.tampilkanInformasi();
  mobil.bergerak(); // dari Kendaraan
  mobil.servis(); // dari BisaDiservis
  mobil.tampilkanLokasi(); // dari mixin GPS
  mobil.daftarKendaraan(nama: 'Avanza', nomorPolisi: 'R 1234 AB');

  print(80.kmPerJam); // 80 km/jam

  tampilkanMobil('Avanza', 80);
  tampilkanMobilOpsional('Avanza');
  dataMobil(nama: 'Avanza');
}
