import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riders_app/models/Product.dart';
import 'package:riders_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(95),
        child: GestureDetector(
          onTap: () {},
          /*
          * => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          )*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: Image.asset(product.images[0]),
                  ),
                ),
              ),
          Padding(
            padding: EdgeInsets.fromLTRB(10,0,0,0), child: Text(
                product.title,
                style: TextStyle(color: Colors.black, fontSize: 13),
                maxLines: 2,

              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10,0,0,0), child: Text(
                    "\Rs. ${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,

                    ),

                  ),
                  ),


                ],
              )
              , SizedBox(height: 20),],
          ),
        ),
      ),
    );
  }
}
