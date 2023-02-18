import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riders_app/components/custom_surfix_icon.dart';
import 'package:riders_app/components/default_button.dart';
import 'package:riders_app/components/form_error.dart';
import 'package:riders_app/screens/login_success/login_success_screen.dart';
import '../../../api/api_methods.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';
import '../../../size_config.dart';

class CompleteServiceForm extends StatefulWidget {
  @override
  _CompleteServiceFormState createState() => _CompleteServiceFormState();
}

class _CompleteServiceFormState extends State<CompleteServiceForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? title;
  String? city;
  String? price;
  String? description;


  List serviceType = ["Ladies", "Gents"];
  String? select;
  String? path;

  late File imageFile;

  bool picked = false;

  late File _image;
  final picker = ImagePicker();


  _getFromGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File file = File(result?.files.single.path ?? " ");

    // PickedFile? pickedFile = await ImagePicker().getImage(
    //   source: ImageSource.gallery,
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );

    if (file != null) {
      imageFile = File(file.path);
      setState(() {
        picked = true;
      });
      showPopUp(imageFile.path);
      path = file.path;
    }
  }
  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: serviceType[btnValue],
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 115,
            width: 115,
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
                        : AssetImage("assets/icons/addition.png"),
                  ),
                  onTap: () {
                    _getFromGallery();
                  },
                ),
                Positioned(
                  right: -16,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                  ),
                )
              ],
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
              "Service Type:",
              style: TextStyle(fontSize: 15),
            ),
            addRadioButton(0, 'Ladies'),
            addRadioButton(1, 'Gents'),
          ]),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Create",
            press: () async {
              KeyboardUtil.hideKeyboard(context);

              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                // if (await createService(title!, city!, price!,  description!,select!,
                //      path!)) {
                //   Navigator.pop(context);
                //
                //
                // } else {
                //   showPopUp("profile not registered");
                // }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => city = newValue,
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
      onSaved: (newValue) => price = newValue,
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
        labelText: "Price",
        hintText: "Set price of your service",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => description = newValue,
      decoration: InputDecoration(
        labelText: "Description",
        hintText: "Describe your service",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => title = newValue,
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
        labelText: "Service Title",
        hintText: "Enter your service title",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
