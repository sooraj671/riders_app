class Delivery {

  late final String id;
  late final String serviceId;
  late final String orderStatus;
  late final String date;
  late final String customer;
  late final String tailor;
  late final String pickUpLocation;
  late final String dropUpLocation;
  late final String price;
  late final String measurementType;
  late final String description;

  Delivery({
    required this.id,
    required this.serviceId,
    required this.orderStatus,
    required this.date,
    required this.customer,
    required this.tailor,
    required this.pickUpLocation,
    required this.dropUpLocation,
    required this.price,
    required this.measurementType,
    required this.description,
  });

  Delivery.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    serviceId = json['serviceId'];
    orderStatus = json['orderStatus'];
    date = json['date'];
    customer = json['customer'];
    tailor = json['tailor'];
    pickUpLocation = json['pickUpLocation'];
    dropUpLocation = json['dropUpLocation'];
    price = json['price'];
    measurementType = json['measurementType'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['serviceId'] = serviceId;
    _data['orderStatus'] = orderStatus;
    _data['date'] = date;
    _data['customer'] = customer;
    _data['tailor'] = tailor;
    _data['pickUpLocation'] = pickUpLocation;
    _data['dropUpLocation'] = dropUpLocation;
    _data['price'] = price;
    _data['measurementType'] = measurementType;
    _data['description'] = description;
    return _data;
  }
}