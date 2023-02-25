import 'dart:developer';

import 'package:riders_app/api/CompletedDelivery.dart';
import 'package:riders_app/api/api_services.dart';

import 'package:riders_app/api/NearByTailors.dart';
import 'package:riders_app/api/NearbyTailorServices.dart';
import 'package:riders_app/api/OrdersService.dart';
import 'package:riders_app/api/customer_profile.dart';
import 'package:riders_app/api/order.dart';
import 'package:riders_app/api/service_order_util.dart';
import 'package:riders_app/api/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'Earnings.dart';
import 'api_services.dart';

Future<bool> getEarning() async {
  final Uri cusLoginURL = Uri.parse(baseURL + rider + earning);

  var response = await http.get(cusLoginURL, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $my_token',
  });

  if (response.statusCode == 200) {
    totalEarning = jsonDecode(response.body)['result']['totalEarnings'];
    amountWithdraw = jsonDecode(response.body)['result']['totalWithdrawn'];
    log(response.body.toString());

    return true;
  } else {
    return false;
  }
}

Future<bool> getCompletedDeliveryInfo() async {
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

  double totalE = 0;
  int totalO = 0;

  data.forEach((entry) {
    totalO++;
  });

  log(totalE.toString());
  log(totalO.toString());

  completedOrdersNum = totalO;

  availableWithdraw =  totalEarning - amountWithdraw ;

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}


Future<bool> withDrawRequest() async {
  var signUpBody = {"amount": availableWithdraw};

  final Uri cusSignUpURL = Uri.parse(baseURL + rider + withdraw);

  var response = await http.post(cusSignUpURL,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'Authorization': 'Bearer $my_token',
      },
      body: jsonEncode(signUpBody));


  log(response.body);
  if (response.body.isNotEmpty) {


    return true;
  } else {
    return false;
  }
}
