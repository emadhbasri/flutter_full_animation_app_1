import 'package:flutter/material.dart';
import 'package:flutter_full_animation_app_1/classes/functions.dart';
import 'package:provider/provider.dart';
import '../Items/search_page.dart';
import '../Items/tab_bar.dart';
import '../Items/the_food.dart';
import '../Items/main_page_food.dart';
import '../restaurant_hero.dart';
import '../restaurant_hero_state.dart';
import '../models.dart';
import 'first_header.dart';
import 'main_tab.dart';

class SearchTab extends StatefulWidget {
  final List<Food> foods;
  const SearchTab({
    Key? key,
    required this.foods,
  }) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late double ds;
  late double de;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      value: 0,
    );

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
      value: 0,
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      value: 0,
    );

    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      value: 0,
    );

    _controller.forward();
    _controller1.forward();
    _controller2.forward();
    _controller3.forward();
  }

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
            body:
                Consumer<RestaurantHeroState>(builder: (context, state, child) {
              return SingleChildScrollView(
                child: SizedBox(
                  width: doubleWidth(100),
                  height: doubleHeight(95),
                  child: Stack(
                    children: [
                      const FirstHeader(false),
                      TabBarItem(
                        FoodPageType.search,
                        show: true,
                        state: state,
                      ),
                      const MainPageFoodLeft(show: false),
                      const MainPageFoodRight(show: false),
                      Container(
                        color: Colors.transparent,
                        width: double.maxFinite,
                        height: doubleHeight(90),
                        margin: EdgeInsets.only(top: doubleHeight(10)),
                        child: Stack(
                          children: [
                            TheFood(FoodPageType.search, state),
                            Plate(false, state.selectedFood.image,
                                const Alignment(5.8, 1)),
                            Align(
                              alignment: const Alignment(0, -0.9),
                              child: FadeTransition(
                                opacity: Tween<double>(begin: 0, end: 1)
                                    .animate(CurvedAnimation(
                                        parent: _controller,
                                        curve: const Interval(0, 0.2),
                                        reverseCurve: const Interval(0, 0.1))),
                                child: Material(
                                  color: Colors.transparent,
                                  child: DecoratedBoxTransition(
                                    decoration: DecorationTween(
                                            begin: const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            end: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                      blurRadius: 10,
                                                      spreadRadius: 0,
                                                      offset: const Offset(0, 15)),
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                      blurRadius: 20,
                                                      spreadRadius: 0,
                                                      offset: const Offset(5, 15)),
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                      blurRadius: 20,
                                                      spreadRadius: 0,
                                                      offset: const Offset(-5, 15)),
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                      blurRadius: 5,
                                                      spreadRadius: -2,
                                                      offset: const Offset(0, -5)),
                                                ]))
                                        .animate(CurvedAnimation(
                                            parent: _controller,
                                            curve: const Interval(0.3, 1))),
                                    position: DecorationPosition.background,
                                    child: SizedBox(
                                      width: doubleWidth(70),
                                      height: doubleHeight(6),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Colors.orangeAccent,
                                            ),
                                            border: InputBorder.none,
                                            hintText: 'search ...'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SearchItemText(state, _controller3, widget.foods[0],
                                const Alignment(-0.2, 1)),
                            SerachItemImage(
                                state,
                                _controller3,
                                widget.foods[0],
                                const Alignment(-0.65, 1.05),
                                const Alignment(-0.65, 0.85)),
                            SearchItemText(state, _controller2, widget.foods[1],
                                const Alignment(-0.2, 0.51)),
                            SerachItemImage(
                                state,
                                _controller2,
                                widget.foods[1],
                                const Alignment(-0.65, 1.1),
                                const Alignment(-0.65, 0.39)),
                            SearchItemText(state, _controller1, widget.foods[2],
                                const Alignment(-0.2, -0.02)),
                            SerachItemImage(
                                state,
                                _controller1,
                                widget.foods[2],
                                const Alignment(-0.65, 1.15),
                                const Alignment(-0.65, -0.07)),
                            SearchItemText(state, _controller, widget.foods[3],
                                const Alignment(-0.2, -0.48)),
                            SerachItemImage(state, _controller, widget.foods[3],
                                const Alignment(-0.65, 1.2), const Alignment(-0.65, -0.55)),
                            GestureDetector(
                              onHorizontalDragUpdate: (DragUpdateDetails e) {
                                de = e.globalPosition.dx;
                              },
                              onHorizontalDragEnd: (e) {
                                if (ds > de) Go.replaceHero(context, MainTab());
                              },
                              onHorizontalDragStart: (DragStartDetails e) {
                                ds = e.globalPosition.dx;
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )),
      ),
    );
  }
}
