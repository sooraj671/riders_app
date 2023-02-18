import 'package:riders_app/api/ProductList.dart';
import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/grid.dart';
import 'package:riders_app/screens/products/all_products.dart';
import 'package:riders_app/screens/products/balochi.dart';
import 'package:riders_app/screens/products/pakhton.dart';
import 'package:riders_app/screens/products/punjabi.dart';
import 'package:riders_app/screens/products/sindhi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

bool all = true;
bool sindhi = false;
bool punjabi = false;
bool balochi = false;
bool pakhtoon = false;
class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/sindhi.svg", "text": "Sindhi"},
      {"icon": "assets/icons/punjab.svg", "text": "Punjabi"},
      {"icon": "assets/icons/baloch.svg", "text": "Balochi"},
      {"icon": "assets/icons/pakhton.svg", "text": "Pakhton"},
      {"icon": "assets/icons/gilgit.svg", "text": "All"},
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              categories.length,
              (index) => CategoryCard(
                icon: categories[index]["icon"],
                text: categories[index]["text"],
                press: () {
                  String name = categories[index]["text"].toString().toLowerCase();
                  setState(() {
                    setTrue(name);
                  });
                  },
              ),
            ),
          ),
        ),

        all ?  AllProducts() : sindhi ? SindhiProducts() : balochi ? BalochiProducts()
            : pakhtoon ? PakhtonProducts() : PunjabiProducts()
      ],
    );
  }

  void setTrue(String name) {

    if(name == "sindhi"){
        sindhi = true;
        all = false;
        punjabi = false;
        balochi = false;
        pakhtoon = false;

    }
    else if(name == "punjabi"){
      sindhi = false;
      all = false;
      punjabi = true;
      balochi = false;
      pakhtoon = false;

    }
    else if(name == "pakhton"){


      sindhi = false;
      all = false;
      punjabi = false;
      balochi = false;
      pakhtoon = true;
      showPopUp("2");
    }
    else if(name == "balochi"){
      sindhi = false;
      all = false;
      punjabi = false;
      balochi = true;
      pakhtoon = false;

    }else{
      sindhi = false;
      all = true;
      punjabi = false;
      balochi = false;
      pakhtoon = false;

    }

  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFCDF5C9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
