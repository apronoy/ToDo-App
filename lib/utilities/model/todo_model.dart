class TodoModel {
  String name;
  dynamic id;
  dynamic price;
  TodoModel({
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
  factory TodoModel.toModel(Map<String, dynamic> map) {
    return TodoModel(name: map['Name'], id: map['Id'], price: map['Price']);
  }
}
