import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Items/the_food.dart';
import 'Items/main_page_food.dart';
import 'Items/tab_bar.dart';
import 'restaurant_hero_state.dart';
import 'Tabs/first_header.dart';
import 'models.dart';

class RestaurantHero extends StatelessWidget {
  const RestaurantHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RestaurantHeroProvider(
      child: WillPopScope(
        onWillPop: () async {
          // doDefaultStatusBar();
          return true;
        },
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Consumer<RestaurantHeroState>(
                  builder: (context, state, child) {
                return SizedBox.expand(
                  child: Stack(
                    children: [
                      TabBarItem(
                        FoodPageType.main,
                        show: false,
                        state: state,
                      ),
                      const FirstHeader(true),
                      const MainPageFoodLeft(show: true),
                      const MainPageFoodRight(show: true),
                      TheFood(FoodPageType.slide, state)
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
