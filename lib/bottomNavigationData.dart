import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation{
  final int id;
  final String title;
  final  IconData iconFile;
  final bool isActive;

  Navigation({
    required this.id,
    required this.title,
    required this.iconFile,
    required this.isActive,
  }
      );

}

class AppDataBase3{
  static List <Navigation> get navigation{
    return [
      Navigation(
        id: 1,
        title: 'Home',
        iconFile: Icons.home,
        isActive: false,
      ),
      Navigation(
        id: 2,
        title: 'Books',
        iconFile: Icons.bookmark_added_outlined,
        isActive: false,
      ),
      Navigation(
        id: 3,
        title: 'Orders',
        iconFile: Icons.emoji_food_beverage_sharp,
        isActive: false,
      ),
      Navigation(
        id: 4,
        title: 'Profile',
        iconFile: Icons.person,
        isActive: false,
      )
    ];
  }
}