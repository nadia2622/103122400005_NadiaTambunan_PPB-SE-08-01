class Kendaraan {
  late String _nama;
  late int _kecepatan;

  Kendaraan(this._nama, this._kecepatan);

  String get nama => _nama;
  int get kecepatan => _kecepatan;

  void bergerak() {
    print('$_nama sedang bergerak dengan kecepatan $_kecepatan');
  }
}
