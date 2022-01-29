import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'models.dart';

class RestaurantHeroState extends ChangeNotifier {
  Food selectedFood = Food(
      'Valhley Farm Eggs',
      'Eggs',
      'desc desc desc desc desc desc desc desc desc desc ',
      'assets/images/food2.jpg',
      35,
      150, [
    const Color.fromRGBO(72, 140, 159, 1),
    const Color.fromRGBO(170, 206, 217, 1),
    const Color.fromRGBO(170, 206, 217, 1),
    const Color.fromRGBO(211, 230, 235, 1)
  ]);

  setSelectedFood(Food food) {
    selectedFood = food;
    notifyListeners();
  }
}

class RestaurantHeroProvider extends StatelessWidget {
  const RestaurantHeroProvider({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<RestaurantHeroState>(
      create: (context) => getIt<RestaurantHeroState>(),
      child: child,
    );
  }
}
