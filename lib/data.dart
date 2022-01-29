import 'package:flutter/material.dart';

import 'models.dart';

List<Color> defaultColor = [
  const Color.fromRGBO(72, 140, 159, 1),
  const Color.fromRGBO(170, 206, 217, 1),
  const Color.fromRGBO(170, 206, 217, 1),
  const Color.fromRGBO(211, 230, 235, 1)
];

final List<FoodInfoOffer> page3Scrole = [
  FoodInfoOffer(
      const Color.fromRGBO(68, 138, 202, 1),
      const Color.fromRGBO(42, 102, 176, 1),
      20,
      'Save more than 1\$',
      'Cashback',
      'Pay your bill to us Pay and get 10% cashback'),
  FoodInfoOffer(
      const Color.fromRGBO(134, 112, 201, 1),
      const Color.fromRGBO(79, 47, 176, 1),
      10,
      'Save more than 1\$',
      'Cashback',
      'Pay your bill to us Pay and get 10% cashback'),
];

List<Food> foods = [
  Food(
      'Restaurant Food',
      'Food',
      'desc desc desc desc desc desc desc desc desc desc ',
      'assets/images/food1.jpg',
      35,
      150,
      defaultColor),
  Food(
      'Restaurant Food',
      'Food',
      'desc desc desc desc desc desc desc desc desc desc ',
      'assets/images/food2.jpg',
      35,
      150,
      defaultColor),
  Food(
      'Restaurant Food',
      'Food',
      'desc desc desc desc desc desc desc desc desc desc ',
      'assets/images/food3.jpg',
      35,
      150,
      defaultColor),
  Food(
      'Restaurant Food',
      'Food',
      'desc desc desc desc desc desc desc desc desc desc ',
      'assets/images/food4.jpg',
      35,
      150,
      defaultColor),
];
