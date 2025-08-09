class ProductModel {
  String name;
  dynamic id;
  dynamic price;
  ProductModel({
    required this.name,
    required this.id,
    required this.price,
  });
  // product model to map ..
  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Id': id,
      'Price': price,
    };
  }

  // map to product model ..
  factory ProductModel.toModel(Map<String, dynamic> map) {
    return ProductModel(name: map['Name'], id: map['Id'], price: map['Price']);
  }
}
