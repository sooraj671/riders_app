import 'dart:developer';

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
import 'api_services.dart';
import 'package:http_parser/http_parser.dart';

Dio dio = Dio();

Future<bool> sign_up(String email, String password) async {
  var signUpBody = {"name": "Sooraj", "email": email, "password": password};

  final Uri cusSignUpURL = Uri.parse(baseURL + rider + signup);

  var response = await http.post(cusSignUpURL,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(signUpBody));

  if (response.body.isNotEmpty) {


    cus_email = email;
    cus_password = password;

    return true;
  } else {
    return false;
  }
}

Future<bool> purchaseService() async {
  // "serviceId":"63d0c509749181e86637e9d4",
  // "measurementType":"standard size",
  // "price": "900",
  // "pickUpLocation":"hostel1",
  // "description": "this is description"

  var serviceBody = {
    "serviceId": "$service_id",
    "measurementType": "$ser_measure_type",
    "price": "$service_price",
    "pickUpLocation": "Change with google Map",
    "description": "$ser_order_desc"
  };
  showPopUp(service_id);

  final Uri postServiceOrder = Uri.parse(baseURL + rider + order_tailor);
  log(postServiceOrder.toString());
  showPopUp(my_token);

  var response = await http.post(postServiceOrder,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $my_token',
      },
      body: jsonEncode(serviceBody));

  log(response.body);

  if (response.body.isNotEmpty) {
    showPopUp(response.body.toString());
    addPendingOrder(jsonDecode(response.body));

    return true;
  } else {
    log(response.statusCode.toString());
    showPopUp("Error");
    return false;
  }
}


void addPendingOrder(jsonDecode) {
  showPopUp(pendingOrders.length.toString());
  pendingOrders.add(Order(
      orderStatus: jsonDecode["orderStatus"],
      customerid: jsonDecode["customer"],
      pickUpLocation: jsonDecode["pickUpLocation"],
      dropUpLocation: jsonDecode["dropUpLocation"],
      price: jsonDecode["price"],
      measurementType: jsonDecode["measurementType"],
      description: jsonDecode["description"]));

  showPopUp(pendingOrders.length.toString());
}

// Future<bool> sign_up(String email, String password, String first_name,
//     String last_name, String contact) async {
//   String username = first_name + " " + last_name;
//
//   var signUpBody = {
//     "name": username,
//     "email": email,
//     "password": password,
//     "contactNumber": contact
//   };
//
//   final Uri cusSignUpURL = Uri.parse(baseURL + rider + signup);
//
//   var response = await http.post(cusSignUpURL,
//       headers: {
//         HttpHeaders.contentTypeHeader: 'application/json',
//       },
//       body: jsonEncode(signUpBody));
//
//   if (response.body.isNotEmpty) {
//     return true;
//   } else {
//     return false;
//   }
// }

Future<bool> profileExist() async {
  final Uri cusLoginURL = Uri.parse(baseURL + rider + profile);

  var response = await http.get(cusLoginURL, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $my_token',
  });

  log(response.body.toString());
  log(jsonDecode(response.body)['result'].toString());

  if (jsonDecode(response.body)["result"].toString() == "null") {
    return false;
  }

  return true;
}

Future<bool> sign_in(String email, String password) async {
  var loginBody = {"email": email, "password": password};
  final Uri cusLoginURL = Uri.parse(baseURL + rider + login);

  var response = await http.post(cusLoginURL,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(loginBody));

  if (response.statusCode == 200) {
    my_token = jsonDecode(response.body)['token'];
    // await profileExist();

    return true;
  } else {
    // showPopUp("User not registered");
    return false;
  }
}

void showPopUp(String s) {
  Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color.fromARGB(255, 54, 117, 244),
      textColor: Color.fromARGB(255, 253, 253, 253));
}

showLoaderDialog(BuildContext context, String message) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7), child: Text(message)),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//setProfile(firstName!,lastName!, select!, phoneNumber!, address!, path)
Future<bool> setProfile(String first_name, String last_name, String gender,
    String phone, String address, String image) async {
  final Uri tailorLoginURL = Uri.parse(baseURL + rider + profile);
  // File imageFile = File("assets/icons/addition.png");

  showPopUp(my_token);
  log(first_name);
  log(last_name);
  log(gender);
  log(phone);
  log(address);
  log(image);
  String filepath = image;

  showPopUp(filepath);
  Response response;
  try {
    String filename = image.split('/').last;
    showPopUp(filepath);
    FormData formData = new FormData.fromMap({
      // "userName": "$first_name +" "+ $last_name",
      // "gender": "$gender",
      // // "phone": "$phone",
      // "location": "$address",
      "imgUrl": await MultipartFile.fromFile(filepath)
    }); // FormData.fromMap
    response = await dio.post(tailorLoginURL.toString(),
        data: formData,
        options: Options(
          headers: {
            "accept": "/*",
            "Authorization": "Bearer $my_token",
            "Content-Type": "multipart/form-data"
          },
        ));

    showPopUp(response.toString()); // Options
  } catch (e) {
    print(e.toString());
  }
  return true;
  // if( == 200){
  //   return true;
  // }else{
  //   return false;
  // }
}

Future<bool> getProfile() async {
  final Uri cusLoginURL = Uri.parse(baseURL + rider + profile);

  var response = await http.get(cusLoginURL, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $my_token',
  });

  if (response.statusCode == 200) {
    log(response.body.toString());
    setProfileValues(response);

    return true;
  } else {

    return false;
  }
}

void setValues(http.Response response) {}
//
void setProfileValues(http.Response response) {
  userName = jsonDecode(response.body)['result']['userName'].toString();
  imgUrl = jsonDecode(response.body)['result']['imgUrl'].toString();
  location = jsonDecode(response.body)['result']['city'].toString();
  gender = jsonDecode(response.body)['result']['gender'].toString();
  join = jsonDecode(response.body)['result']['joinDate'].toString();


}

Future<bool> another(String first_name, String last_name, String gender,
    String phone, String address, String image) async {
  // String filepath = "/Users/soorajkumar/Desktop/pic.png";
  File file = File(image);
  // File imageFile = File(file.path);

  final Uri tailorLoginURL = Uri.parse(baseURL + rider + profile);

  try {
    String filename = image.split('/').last;
    // showPopUp(filename);
    String filepath = file.path;


    FormData formData = new FormData.fromMap({
      "userName": "$first_name  $last_name",
      "gender": "male",
      "city": "$address",
      "imgUrl": await MultipartFile.fromFile(filepath)
    }); // FormData.fromMap

    Response response = await dio.post(tailorLoginURL.toString(),
        data: formData,
        options: Options(
          headers: {
            "accept": "/*",
            "Authorization": "Bearer $my_token",
            "Content-Type": "multipart/form-data"
          },
        ));

    print(response);
    log(response.toString());
    if (response.data != null) {
      return true;
    } // Options
  } catch (e) {
    print(e);
    log(e.toString());
  }
  // if (response.data != null) {
  //   return true;
  // } // Options

  return false;
}

Future<bool> getNearByTailors() async {
  final Uri tailors = Uri.parse(baseURL + rider + nearByTailors);

  var response = await http.get(tailors, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $my_token',
  });

  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["result"];

  data.forEach((entry) {
    String id = entry["_id"];
    String name = entry["name"];
    String desc = entry["description"];
    int price = entry["price"];
    String img = entry["imgUrl"];

    nearByTailorList.add(TailorServices(
        id: id,
        name: name,
        price: price.toString(),
        description: desc,
        imgUrl: img));
  });

  if (nearByTailorList.isNotEmpty) {
    showPopUp("yes");
    return true;
  } else {
    showPopUp(response.body);
    return false;
  }
}
