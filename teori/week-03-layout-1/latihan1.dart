void main() {
  List<Map<String, dynamic>> products = [
    {
      "id_product": "001",
      "name": "Meja lipat",
      "stock": "40",
      "pic": "Xavier",
      "status": "Ready",
      "created_at": "pwt",
      "updated_at": "pwt",
    },
    {
      "id_product": "002",
      "name": "Meja Makan",
      "stock": "20",
      "pic": "Xavier",
      "status": "Ready",
      "created_at": "pwt",
      "updated_at": "pwt",
    },
    {
      "id_product": "003",
      "name": "Piring",
      "stock": "100",
      "pic": "Valko",
      "status": "Ready",
      "created_at": "pwt",
      "updated_at": "pwt",
    },
    {
      "id_product": "004",
      "name": "Kursi",
      "stock": "40",
      "pic": "Rafayel",
      "status": "Ready",
      "created_at": "pwt",
      "updated_at": "pwt",
    },
    {
      "id_product": "005",
      "name": "Kursi lipat",
      "stock": "10",
      "pic": "Rafayel",
      "status": "Ready",
      "created_at": "pwt",
      "updated_at": "pwt",
    },
  ];
  for (var i = 0; i < products.length; i++) {
    print(products[i]["name"]);
  }
}
