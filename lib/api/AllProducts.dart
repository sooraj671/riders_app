import 'dart:developer';

import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/api/products.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'api_services.dart';

List<Product> allProducts = [];



String imgUri = "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getProducts() async {

  final Uri products = Uri.parse(baseURL + admin + get_all_products);


  var response = await http.get(
    products,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );


  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["result"];

  data.forEach((entry) {
    String name = entry["name"];
    int price = entry["price"];
    String desc = entry["description"];
    String category = entry["category"];
    String img = entry["imgUrl"];
    // String complete = imgUri+img;

    allProducts.add(Product(
        name: name,
        price: price,
        description: desc,
        category: category,
        imgUrl: img));

  });


  if(response.statusCode == 200){

    return true;
  }else{
    showPopUp(response.body);
    return false;
  }


}


