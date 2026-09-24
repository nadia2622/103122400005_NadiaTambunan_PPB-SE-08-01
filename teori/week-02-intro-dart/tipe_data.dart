void main() {
    // Tipe data primitif -> int, double, boolean, dynamic
    // Tipe data non primitif -> String, List, Set, Map

    String namaLengkap = "Nadia Tambunan";
    int umur = 22;
    double tinggiBadan = 163.2;
    bool isMarried = true;
    print("Nama saya adalah $namaLengkap dan umur $umur");
    print("Tinggi badan saya adalah $tinggiBadan");
    print("Saya sudah menikah" + isMarried.toString());
    
    // var dan dynamic
    var a = "Jam tangan";
    print("$a Tipe datanya adalah ${a.runtimeType}");
    // a = 24;
    // print("$a Tipe datanya adalah ${a.runtimeType}"); // error karena kita gabole mengganti tipe data var

    dynamic b = "Dompet"; // runtime mode ->
    print("$b Tipe datanya adalah ${b.runtimeType}");
    b = 24.99;
    print("$b Tipe datanya adalah ${b.runtimeType}");

    // kenapa tidak menggunakan dynamic di semua var supaya tidak boros memori dan dapat terjadi kerancuan saat ada kesalahan input
    // case pake dynamic adalah kalau datanya fleksibel saja.

    // Collection -> List dan Map
    // List -> Index 0,1,2,...n
    List<String> names = ["Agus", "Budi", "Joko"];
    print(names);

    List<num> numbers = [1, 2, 3, -10, -5, 8.8, 9.9];
    print(numbers);
    List<dynamic> random = [1, 2, false, "oke", "Agus", true];
    print(random[4]);
    random.add(100);
    print(random);

    // Collection Map -> Key and Value
    Map<String, dynamic> users = { // Map<TipedataKey, TipedataValue> users
        "name": "Nadia",
        "email": "nadiatmbunan@gmail.com",
        "kelas": "SE0801",
        "umur": 22
    };
    print(users);

    List<Map<String, dynamic>> usersList = [
        {
        "name": "Agus",
        "email": "agususu@gmail.com",
        "kelas": "SE0801",
        "umur": 22
        },
        {
        "name": "Budi",
        "email": "Budididi@gmail.com",
        "kelas": "SE0802",
        "umur": 23
        },
    ];

    print(usersList[0]["kelas"]);

    for(var item in usersList) {
        print(item["name"]);
    }
}