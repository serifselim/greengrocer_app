class Product {
  String name;
  String weight;
  String imageFilePath;
  double price;
  int total;
  bool isDeletable;

  Product({
    required this.name,
    required this.weight,
    required this.imageFilePath,
    required this.price,
    required this.total,
    required this.isDeletable
  });

  void changeIsDeleteActive(){
    isDeletable = !isDeletable;
  }
}
