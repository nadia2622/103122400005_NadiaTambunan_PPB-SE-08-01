class Animal {
  String nama;
  int umur;

  Animal(this.nama, this.umur);

  void info() {
    print("Nama hewan adalah $nama dan umur $umur tahun");
  }
}

void main() {
  Animal animal = Animal("Kucing", 2);
  animal.info();

  // Flutter itu null safety, jadi kita harus mendeklarasikan variable yang nullable dan non nullable. Non nullable itu gaboleh null, sedangkan nullable itu boleh null. Contohnya seperti berikut:
  String name, nim, kelas; // non nullable variable / variable yang gaboleh null
  int id;

  String? hobi, nomorHp;
  String? asalSekolah = null;
  // ditambah ? di akhir, artinya boleh bernilai null

  print(asalSekolah ?? "Belum diisi");
}
