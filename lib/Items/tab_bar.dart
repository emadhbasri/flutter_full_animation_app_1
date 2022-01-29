import 'package:flutter/material.dart';
import '../classes/functions.dart';
import '../restaurant_hero_state.dart';
import '../Tabs/main_tab.dart';
import '../Tabs/search_tab.dart';
import '../data.dart';
import '../models.dart';

class TabBarItem extends StatelessWidget {
  final RestaurantHeroState state;
  final FoodPageType foodPageType;
  final bool show;

  const TabBarItem(this.foodPageType,{Key? key,required this.state,required this.show}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (foodPageType) {
      case FoodPageType.main:
        if (show) {
          return Align(
            alignment: const Alignment(-1, -1),
            child: Container(
              width: double.maxFinite,
              height: doubleHeight(10),
              padding: EdgeInsets.only(
                  left: doubleWidth(10), right: doubleWidth(10)),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'tabs',
                      child: Container(
                        width: doubleWidth(33, width: doubleWidth(80)),
                        height: doubleHeight(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.orangeAccent,
                                  blurRadius: 5,
                                  spreadRadius: -2,
                                  offset: Offset(0, 5))
                            ]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Go.replaceHero(
                            context,
                            SearchTab(
                              foods: foods,
                            ));
                      },
                      child: Hero(
                        tag: 'SearchTab',
                        child: Material(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: doubleWidth(33, width: doubleWidth(80)),
                            height: doubleHeight(5),
                            child: const Center(
                              child: Text(
                                'Search',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'MainTab',
                      child: Material(
                        color: Colors.transparent,
                        child: SizedBox(
                          width: doubleWidth(33, width: doubleWidth(80)),
                          height: doubleHeight(5),
                          child: const Center(
                            child: Text(
                              'Main',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Hero(
                        tag: 'tab3',
                        child: Material(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: doubleWidth(33, width: doubleWidth(80)),
                            height: doubleHeight(5),
                            child: const Center(
                              child: Text(
                                'Tab 3',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Align(
            alignment: const Alignment(-1, -1.5),
            child: Container(
              width: double.maxFinite,
              height: doubleHeight(10),
              padding: EdgeInsets.only(
                  left: doubleWidth(10), right: doubleWidth(10)),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'tabs',
                      child: Container(
                        width: doubleWidth(33, width: doubleWidth(80)),
                        height: doubleHeight(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.orangeAccent,
                                  blurRadius: 5,
                                  spreadRadius: -2,
                                  offset: Offset(0, 5))
                            ]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Go.replaceHero(
                            context,
                            SearchTab(
                              foods: foods,
                            ));
                      },
                      child: Hero(
                        tag: 'SearchTab',
                        child: Material(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: doubleWidth(33, width: doubleWidth(80)),
                            height: doubleHeight(5),
                            child: const Center(
                              child: Text(
                                'Search',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'MainTab',
                      child: Material(
                        color: Colors.transparent,
                        child: SizedBox(
                          width: doubleWidth(33, width: doubleWidth(80)),
                          height: doubleHeight(5),
                          child: const Center(
                            child: Text(
                              'Main',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Hero(
                        tag: 'tab3',
                        child: Material(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: doubleWidth(33, width: doubleWidth(80)),
                            height: doubleHeight(5),
                            child: const Center(
                              child: Text(
                                'Tab 3',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      case FoodPageType.search:
        return Container(
          width: double.maxFinite,
          height: doubleHeight(10),
          padding:
              EdgeInsets.only(left: doubleWidth(10), right: doubleWidth(10)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Hero(
                  tag: 'tabs',
                  child: Container(
                    width: doubleWidth(33, width: doubleWidth(80)),
                    height: doubleHeight(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.orangeAccent,
                              blurRadius: 5,
                              spreadRadius: -2,
                              offset: Offset(0, 5))
                        ]),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Hero(
                  tag: 'SearchTab',
                  child: Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: doubleWidth(33, width: doubleWidth(80)),
                      height: doubleHeight(5),
                      child: const Center(
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Go.replaceHero(context, MainTab());
                  },
                  child: Hero(
                    tag: 'MainTab',
                    child: Material(
                      color: Colors.transparent,
                      child: SizedBox(
                        width: doubleWidth(33, width: doubleWidth(80)),
                        height: doubleHeight(5),
                        child: const Center(
                          child: Text(
                            'Main',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Hero(
                    tag: 'tab3',
                    child: Material(
                      color: Colors.transparent,
                      child: SizedBox(
                        width: doubleWidth(33, width: doubleWidth(80)),
                        height: doubleHeight(5),
                        child: const Center(
                          child: Text(
                            'Tab 3',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case FoodPageType.slide:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }
}
