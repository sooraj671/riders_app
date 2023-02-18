import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchChatField extends StatelessWidget {
  const SearchChatField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.9,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search chat",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
