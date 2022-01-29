import 'package:flutter/material.dart';
import '../classes/functions.dart';

class MainPageFoodRight extends StatelessWidget {
  final bool show;
  const MainPageFoodRight({Key? key,required this.show}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: show ? const Alignment(1, -0.6) : const Alignment(5, -0.6),
      child: Hero(
        tag: 'rt1hero2',
        child: SizedBox(
            width: doubleWidth(60),
            height: doubleHeight(60),
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, 1),
                  child: Material(
                    color: Colors.transparent, //Colors.transparent
                    child: Container(
                      height: doubleHeight(22),
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: doubleWidth(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Restaurant Hero',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  wordSpacing: 2,
                                  color: Colors.black,
                                  fontSize: doubleWidth(6))),
                          SizedBox(height: doubleHeight(1)),
                          Text('description descr descr descr descr descr',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  wordSpacing: 2,
                                  color: Colors.grey, //Colors.grey
                                  fontSize: doubleWidth(4))),
                          SizedBox(height: doubleHeight(1)),
                          Text('150\$',
                              style: TextStyle(
                                  wordSpacing: 2,
                                  color: Colors.grey,
                                  fontSize: doubleWidth(8))),
                          SizedBox(height: doubleHeight(1)),
                          SizedBox(
                            width: doubleWidth(40),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(const StadiumBorder()),
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
                              ),
                              child: const Text('buy'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: doubleWidth(7),
                  top: doubleHeight(5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 20,
                              spreadRadius: 5,
                              offset: Offset(15, 15))
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        width: doubleHeight(30),
                        height: doubleHeight(30),
                        color: Colors.white,
                        child: Image.asset(
                          'assets/images/food1.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class MainPageFoodLeft extends StatelessWidget {
  final bool show;
  const MainPageFoodLeft({Key? key,required this.show}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: show ? const Alignment(-1, -0.6) : const Alignment(-3, -0.6),
      child: Hero(
        tag: 'rt1hero1',
        child: SizedBox(
          width: doubleWidth(40),
          height: doubleHeight(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      spreadRadius: -2,
                      offset: Offset(0, 5))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: doubleWidth(30),
                      height: doubleWidth(30),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/restaurant1.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      spreadRadius: -2,
                      offset: Offset(0, 5))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: doubleWidth(30),
                      height: doubleWidth(30),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/restaurant3.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      spreadRadius: -2,
                      offset: Offset(0, 5))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: doubleWidth(30),
                      height: doubleWidth(30),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/restaurant2.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
