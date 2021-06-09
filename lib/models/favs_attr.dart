import 'package:flutter/material.dart';

class FavsAttr with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String recipeCategoryName;
  final String time;

  FavsAttr({this.id, this.title, this.price, this.imageUrl, this.recipeCategoryName, this.time});
}
