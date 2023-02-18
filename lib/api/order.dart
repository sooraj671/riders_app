/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Order {
  String? orderStatus;
  String? customerid;
  String? pickUpLocation;
  String? dropUpLocation;
  String? price;
  String? measurementType;
  String? description;

  Order({this.orderStatus, this.customerid, this.pickUpLocation, this.dropUpLocation, this.price, this.measurementType, this.description});

  Order.fromJson(Map<String, dynamic> json) {
    orderStatus = json['orderStatus'];
    customerid = json['customer_id'];
    pickUpLocation = json['pickUpLocation'];
    dropUpLocation = json['dropUpLocation'];
    price = json['price'];
    measurementType = json['measurementType'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['orderStatus'] = orderStatus;
    data['customer_id'] = customerid;
    data['pickUpLocation'] = pickUpLocation;
    data['dropUpLocation'] = dropUpLocation;
    data['price'] = price;
    data['measurementType'] = measurementType;
    data['description'] = description;
    return data;
  }
}

