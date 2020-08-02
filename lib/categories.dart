import 'package:flutter/material.dart';

class CategoryItem {
  IconData categoryIcon;
  String categoryName;
  int counter;
  bool selected;

  CategoryItem(
      {@required this.categoryIcon,
      @required this.categoryName,
      @required this.counter,
      this.selected = false});
}

class CategoryItemList {
  List<CategoryItem> categoryItems;

  CategoryItemList({@required this.categoryItems});
}

// Crear la lista
CategoryItemList categoryList = CategoryItemList(categoryItems: [
  CategoryItem(
      categoryIcon: Icons.movie, 
      categoryName: "Películas", 
      counter: 12,
      selected: true
    ),
  CategoryItem(
      categoryIcon: Icons.school, 
      categoryName: "Cursos", 
      counter: 20
    ),
  CategoryItem(
      categoryIcon: Icons.fitness_center, 
      categoryName: "Fitness", 
      counter: 26
    ),
  CategoryItem(
      categoryIcon: Icons.fastfood, 
      categoryName: "Comida", 
      counter: 50
    ),
  CategoryItem(
      categoryIcon: Icons.audiotrack, 
      categoryName: "Musica", 
      counter: 584
    ),
  CategoryItem(
      categoryIcon: Icons.camera_alt, 
      categoryName: "Fotografía", 
      counter: 60
    ),
  CategoryItem(
      categoryIcon: Icons.casino, 
      categoryName: "Juegos", 
      counter: 30
    ),
]);
