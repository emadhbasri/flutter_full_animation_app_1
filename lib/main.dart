import 'package:flutter/material.dart';
import 'package:flutter_full_animation_app_1/restaurant_hero.dart';
import 'package:get_it/get_it.dart';

import 'classes/functions.dart';
import 'restaurant_hero_state.dart';
final getIt = GetIt.instance;
void main() {
  GetIt.I.registerLazySingleton(() => RestaurantHeroState());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) {
          screenSize = MediaQuery.of(context).size;
          return const RestaurantHero();
        },
      ),
    );
  }
}