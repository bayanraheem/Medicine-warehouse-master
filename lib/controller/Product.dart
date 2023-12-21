import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class Product{
  final String image,title;
  final String description;
  final int Price,id;

  Product( { required this.id,required this.image, required this.title, required this.description, required this.Price,
  });
}
List<Product> products = [
  Product(
    id:1,
    image: "assets/image/1 (1).png",
    title:"  لأنك الله  ",
    description:(",," ),
    Price: 234,
  ),
  Product(
    id:2,
    image: "assets/image/1 (2).png",
    title:"           نبض ",
    description:(",," ),
    Price: 234,
  ),
  Product(
    id:3,
    image: "assets/image/1 (3).png",
    title:"  أحبّبتُكَ_أكثر ",
    description:(",," ),
    Price: 985,
  ),
  Product(
    id:4,
    image: "assets/image/1 (4).png",
    title:"   فلتغفري ",
    description:(",," ),
    Price: 234,
  ),
  Product(
    id:5,
    image:"assets/image/photo1700768808-removebg-preview.png",
    title:"      فن الامبالاة",
    description:(",," ),
    Price: 234,
  ),

];