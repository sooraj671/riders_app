import 'dart:developer';
import 'dart:io';
import 'package:riders_app/api/ProductList.dart';
import 'package:file_picker/file_picker.dart';

import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/api/customer_profile.dart';
import 'package:riders_app/screens/sign_up/components/sign_up_form.dart';
import 'package:riders_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/components/custom_surfix_icon.dart';
import 'package:riders_app/components/default_button.dart';
import 'package:riders_app/components/form_error.dart';
import 'package:riders_app/screens/otp/otp_screen.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

import '../../../constants.dart';
import '../../../helper/keyboard.dart';
import '../../../size_config.dart';
import '../../home/home_screen.dart';
import '../../login_success/login_success_screen.dart';
import '../../sign_in/sign_in_screen.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  List gender = ["Male", "Female", "Other"];
  String? select;
  String? path;

  late File imageFile;

  bool picked = false;

  late File _image;
  final picker = ImagePicker();
  bool isLoading = false;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              log(value);
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  _getFromGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File file = File(result?.files.single.path ?? " ");

    if (file != null) {
      imageFile = File(file.path);
      setState(() {
        picked = true;
      });
      // showPopUp(imageFile.path);
      path = file.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 115,
            width: 115,
            child: Center(
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    child: CircleAvatar(
                      backgroundImage: picked
                          ? Image.file(
                        imageFile,
                        fit: BoxFit.cover,
                      ).image
                          : AssetImage("assets/icons/dummy1.jpeg"),
                    ),
                    onTap: () {
                      _getFromGallery();
                    },
                  ),
                  Positioned(
                    right: 10,
                    bottom: 20,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          Row(children: <Widget>[
            Text(
              "Pick Gender:",
              style: TextStyle(fontSize: 15),
            ),
            addRadioButton(0, 'Male'),
            addRadioButton(1, 'Female'),
            addRadioButton(2, 'Others'),
          ]),
          SizedBox(height: getProportionateScreenHeight(30)),
          InkWell(
            onTap: () => completeProfile(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kPrimaryColor,
              ),
              height: 50,
              width: 200,
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                  "Register",
                  style: headingStyle.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "City",
        hintText: "Enter your city",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  completeProfile() async {

      KeyboardUtil.hideKeyboard(context);
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        setState(() {
          isLoading = true;
        });
        if (await another(
            firstName!, lastName!, select!, phoneNumber!, address!, path!)) {
          if (await getProfile()) {
            showPopUp("Registration Successful");
            setState(() {
              isLoading = false;
            });
            Navigator.pushNamed(context, HomeScreen.routeName);
          }
        } else {
          showPopUp("Unable to register");
          setState(() {
            isLoading = false;
          });
        }

    }
  }
}
