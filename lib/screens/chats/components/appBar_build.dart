import 'package:flutter/material.dart';
import 'package:riders_app/constants.dart';

import '../../chats/components/search_chat_field.dart';

AppBar buildAppBar(title) {
  return AppBar(
      automaticallyImplyLeading: true,
      title:  Text(title,
          style: TextStyle(fontSize: 28)),

      foregroundColor: Color(0xFF22A45D));
}
