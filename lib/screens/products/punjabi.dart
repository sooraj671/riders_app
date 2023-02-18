import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/ProductList.dart';



class PunjabiProducts extends StatefulWidget {
  const PunjabiProducts({Key? key}) : super(key: key);

  @override
  State<PunjabiProducts> createState() => _PunjabiProductsState();




}


class _PunjabiProductsState extends State<PunjabiProducts> {


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 230,
      ),
      itemCount: punjabiProducts.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: kPrimaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                //"https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/uploads/16561972-shawl.png"
                child: Image.network(
                  "${punjabiProducts[index].imgUrl}",
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${punjabiProducts[index].name}",
                          style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Price: ${punjabiProducts[index].price}",
                          style: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(
                      width: 8.0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.cart,

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
