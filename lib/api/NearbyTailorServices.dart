/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class TailorServices {
  String? id;
  String? name;
  String? description;
  String? price;
  String? imgUrl;
  String? ratings;

  TailorServices({this.id, this.name, this.description, this.price, this.imgUrl, this.ratings});

  TailorServices.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imgUrl = json['imgUrl'];
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['imgUrl'] = imgUrl;
    data['ratings'] = ratings;
    return data;
  }
}

