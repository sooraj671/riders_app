import 'dart:developer';

import 'package:riders_app/api/CompletedDelivery.dart';
import 'package:riders_app/api/Delivery.dart';
import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/api/products.dart';
import 'package:riders_app/api/token.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'api_services.dart';
import 'order.dart';




List<Order> pendingOrders = [];
List<Order> completedOrders = [];


List<Delivery> availableDeliveries = [];
List<CompletedDelivery> completedDeliveries = [];
List<Delivery> ongoingdDeliveries = [];


String imgUri = "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getAvailableDelivery() async {

  final Uri pendOrders = Uri.parse(baseURL + rider + available_orders);

  log(pendOrders.toString());

  var response = await http.get(pendOrders, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $my_token',
  });

  log(response.body.toString());
  log(jsonDecode(response.body)['result'].toString());


  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["result"];
  //




  data.forEach((entry) {

    availableDeliveries.add(Delivery.fromJson(entry));





  });

  log(availableDeliveries[0].id.toString());


  if(response.statusCode == 200){

    return true;
  }else{
    showPopUp(response.body);
    return false;
  }


}



Future<bool> getCompletedDelivery() async {

  final Uri pendOrders = Uri.parse(baseURL + rider + completed_delivery);

  log(pendOrders.toString());

  var response = await http.get(pendOrders, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $my_token',
  });

  log("printing result");

  // log(jsonDecode(response.body)['result'].toString());



  Map<String, dynamic> map = json.decode(response.body);

  List<dynamic> data = map["result"];
  //

  // log(data.toString());


  data.forEach((entry) {

      completedDeliveries.add(CompletedDelivery.fromJson(entry));




  });

  log(completedDeliveries.length.toString());



  if(response.statusCode == 200){

    return true;
  }else{
    showPopUp(response.body);
    return false;
  }


}


Future<bool> getOngoingDelivery() async {

  final Uri pendOrders = Uri.parse(baseURL + rider + progress_delivery);

  log(pendOrders.toString());

  var response = await http.get(pendOrders, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $my_token',
  });


  log(jsonDecode(response.body)['result'].toString());


  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["result"];
  //




  data.forEach((entry) {

    ongoingdDeliveries.add(Delivery.fromJson(entry));


  });

  log(ongoingdDeliveries.length.toString());

  if(response.statusCode == 200){

    return true;
  }else{
    showPopUp(response.body);
    return false;
  }


}



Future<bool> acceptDelivery(String id) async {

  final Uri pendOrders = Uri.parse(baseURL + rider + accept_delivery+ id);

  log(pendOrders.toString());

  var response = await http.put(pendOrders, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $my_token',
  });




  if(response.statusCode == 200){

    return true;
  }else{
    showPopUp(response.body);
    return false;
  }


}



Future<bool> deliverToTailor(String id) async {

  final Uri pendOrders = Uri.parse(baseURL + rider + tailor_delivery+ id);

  log(pendOrders.toString());

  var response = await http.put(pendOrders, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $my_token',
  });


  log(response.body.toString());



  if(response.statusCode == 200){

    return true;
  }else{
    showPopUp(response.body);
    return false;
  }


}
