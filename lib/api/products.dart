class Product {
  String? name;
  int? price;
  String? description;
  String? category;
  String? imgUrl;

  Product(
      {required this.name, required this.price,required  this.description, required this.category, required  this.imgUrl});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}