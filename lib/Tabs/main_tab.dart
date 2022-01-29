import 'package:flutter/material.dart';
import 'package:flutter_full_animation_app_1/classes/functions.dart';
import 'package:provider/provider.dart';
import '../Items/main_page_food.dart';
import '../Items/tab_bar.dart';
import '../Items/the_food.dart';
import '../restaurant_hero.dart';
import '../restaurant_hero_state.dart';
import '../models.dart';
import 'first_header.dart';

class MainTab extends StatelessWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RestaurantHeroProvider(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              Go.replaceHero(context, const RestaurantHero());
              return false;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Consumer<RestaurantHeroState>(
                  builder: (context, state, child) {
                return SizedBox.expand(
                  child: Stack(
                    children: [
                      const FirstHeader(false),
                      TabBarItem(
                        FoodPageType.main,
                        show: true,
                        state: state,
                      ),
                      const MainPageFoodLeft(show: false),
                      const MainPageFoodRight(show: false),
                      TheFood(FoodPageType.main, state)
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
