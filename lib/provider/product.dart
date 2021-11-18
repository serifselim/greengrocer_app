class Product {
  String name;
  String weight;
  String imageFilePath;
  double price;
  int total = 1;
  bool isDeletable = false;

  Product({
    required this.name,
    required this.weight,
    required this.imageFilePath,
    required this.price,
  });

  void changeIsDeletable(){
    isDeletable = !isDeletable;
  }
}
