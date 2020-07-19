import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

CategoryItemList fooditemList = CategoryItemList(foodItems: [
  CategoryItem(
    categoryIcon: Icons.bug_report,
    categoryName: "Burgers",
    availability: 12,
    selected: true,
  ),
  CategoryItem(
    categoryIcon: Icons.bug_report,
    categoryName: "Pizza",
    availability: 12,
    selected: false,
  ),
  CategoryItem(
    categoryIcon: Icons.bug_report,
    categoryName: "Rolls",
    availability: 12,
    selected: false,
  ),
  CategoryItem(
    categoryIcon: Icons.bug_report,
    categoryName: "Burgers",
    availability: 12,
    selected: true,
  ),
  CategoryItem(
    categoryIcon: Icons.bug_report,
    categoryName: "Burgers",
    availability: 12,
    selected: true,
  ),
  CategoryItem(
    categoryIcon: Icons.bug_report,
    categoryName: "Burgers",
    availability: 12,
    selected: true,
  ),
  CategoryItem(
    categoryIcon: Icons.bug_report,
    categoryName: "Burgers",
    availability: 12,
    selected: true,
  ),
]);

class CategoryItemList {
  List<CategoryItem> foodItems;

  CategoryItemList({@required this.foodItems});
}

class CategoryItem {
  IconData categoryIcon;
  String categoryName;
  int availability;
  bool selected;

  CategoryItem(
      {@required this.categoryIcon,
      @required this.categoryName,
      @required this.availability,
      this.selected = false});
}
