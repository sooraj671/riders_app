import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double  price;


  Product({
    required this.id,
    required this.images,
    required this.colors,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ajrak.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Printed Ajrak",
    price: 2000,
    description: description,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/chunri.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Chunri",
    price: 500,
    description: description,

  ),
  Product(
    id: 3,
    images: [
      "assets/images/wasket.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Koti and Topi",
    price: 700,
    description: description,

  ),
  Product(
    id: 4,
    images: [
      "assets/images/wasket.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Koti and Topi",
    price: 700,
    description: description,

  ),

];

const String description =
    "Sindhi cultural embroidery";
