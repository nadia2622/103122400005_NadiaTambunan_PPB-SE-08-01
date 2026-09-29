import 'kendaraan.dart';
import 'bisa_diservis.dart';
import 'gps.dart';
import 'format_kecepatan.dart';

class Mobil extends Kendaraan with GPS implements BisaDiservis {
  String _nomorPolisi;
  String? _namaPemilik;
  int? _tahunProduksi;
  late String _nomorMesin;

  Mobil(
    super._nama,
    super._kecepatan, {
    required String nama,
    required int nomorPolisi,
    String? namaPemilik,
    int? tahunProduksi,
  }) : _nomorPolisi = nomorPolisi.toString(),
       _namaPemilik = namaPemilik,
       _tahunProduksi = tahunProduksi;

  @override
  void servis() {
    print('$nama sedang diservis...');
  }

  void tampilkanInformasi() {
    print('Nama: $nama');
    print('Nomor Polisi: $_nomorPolisi');
    print('Pemilik: ${_namaPemilik ?? "Tidak diketahui"}');
    print('Tahun Produksi: ${_tahunProduksi ?? "Tidak ada pemilik"}');
    print('Nomor Mesin: $_nomorMesin');
    print(
      'Pemilik (huruf besar): ${_namaPemilik?.toUpperCase() ?? "Tidak diketahui"}',
    );
    print('Kecepatan: ${kecepatan.kmPerJam}');
  }

  void registrasiMesin(String nomorMesin) {
    _nomorMesin = nomorMesin;
  }

  void daftarKendaraan({
    required String nama,
    required String nomorPolisi,
    String? pemilik,
    String warna = 'Hitam',
    int kecepatan = 0,
  }) {
    print(
      'Terdaftar: $nama, $nomorPolisi, ${pemilik ?? '-'}, $warna, $kecepatan',
    );
  }
}
