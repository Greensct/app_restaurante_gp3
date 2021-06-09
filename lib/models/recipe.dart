import 'package:flutter/cupertino.dart';

class Recipe with ChangeNotifier{
  final String id;
  final String imageUrl;
  final String name;
  final String videoUrl;
  final String time;
  final String ingredients;
  final int quantity;
  final String preparation;
  final String recipeCategoryName;
  
  final bool isFavorite;
  final bool isPopular;

  Recipe({this.id, this.imageUrl, this.name, this.videoUrl, this.time, this.ingredients,this.quantity, this.preparation, this.recipeCategoryName,this.isFavorite, this.isPopular});
}
