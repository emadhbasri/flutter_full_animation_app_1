import 'package:flutter/material.dart';
import 'package:flutter_full_animation_app_1/restaurant_hero_state.dart';
import '../classes/functions.dart';
import '../Tabs/main_tab.dart';
import '../models.dart';

class SerachItemImage extends StatelessWidget {
  final RestaurantHeroState state;
  final AnimationController controller;
  final Food food;
  final Alignment alignmentBegin;
  final Alignment alignmentEnd;
  const SerachItemImage(this.state, this.controller, this.food,
      this.alignmentBegin, this.alignmentEnd,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.setSelectedFood(food);
        Go.replaceHero(context, MainTab());
      },
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(controller),
        child: AlignTransition(
          alignment: AlignmentTween(begin: alignmentBegin, end: alignmentEnd)
              .animate(controller),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: const Offset(0, 20)),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: const Offset(5, 15)),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: SizedBox(
                height: doubleWidth(70,
                    width: doubleWidth(40, width: doubleWidth(80))),
                width: doubleWidth(70,
                    width: doubleWidth(40, width: doubleWidth(80))),
                child: Image.asset(
                  food.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchItemText extends StatelessWidget {
  final RestaurantHeroState state;
  final AnimationController controller;
  final Food food;
  final Alignment alignment;
  const SearchItemText(this.state, this.controller, this.food, this.alignment,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.setSelectedFood(food);
        Go.replaceHero(context, MainTab());
      },
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: controller, curve: const Interval(0.8, 1))),
        child: Align(
          alignment: alignment,
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: doubleWidth(80),
              height: doubleHeight(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: double.maxFinite,
                    width: doubleWidth(60, width: doubleWidth(80)),
                    padding: EdgeInsets.symmetric(vertical: doubleHeight(1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: doubleWidth(4.5)),
                        ),
                        SizedBox(height: doubleHeight(1)),
                        Text(
                          '${food.price}\$',
                          style: TextStyle(
                              color: const Color.fromRGBO(168, 168, 170, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: doubleWidth(3.5)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
