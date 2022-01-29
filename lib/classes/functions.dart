import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late Size screenSize;
double doubleHeight(double value, {double height: 0}) {
  if (height == 0) height = screenSize.height;
  return (height * value) / 100;
}

double doubleWidth(double value, {double width: 0}) {
  if (width == 0) width = screenSize.width;
  return (width * value) / 100;
}

statusSet({Color? statusBar,bool? statusBarIconIsWhite,Color? navigationBar,bool? navigationBarLineIsWhite}) async {
  try {
      WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: statusBar,
    statusBarBrightness: (statusBarIconIsWhite!=null)?(statusBarIconIsWhite?Brightness.light:Brightness.dark):null,
    statusBarIconBrightness: (statusBarIconIsWhite!=null)?(statusBarIconIsWhite?Brightness.light:Brightness.dark):null,
    systemNavigationBarColor: navigationBar,
    systemNavigationBarIconBrightness: (navigationBarLineIsWhite!=null)?(navigationBarLineIsWhite?Brightness.light:Brightness.dark):null,
  ));
  } on PlatformException catch (e) {
    debugPrint(e.toString());
  }
}


//for navigate between screens
abstract class Go {
  static void replaceHero(BuildContext context, Widget newPage,
      {bool full: false,dur=const Duration(seconds: 1)}) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: dur,
            pageBuilder: (_, __, ___) => newPage,
            fullscreenDialog: full));
  }
  static Future<void> push(BuildContext context, Widget page,
      {bool isModal = false,Duration duration = const Duration(
          milliseconds: 300
      )}) async {
    Route _route;
    if (isModal)
      _route = PageRouteBuilder(
          transitionDuration: duration,
          opaque: false, pageBuilder: (BuildContext context, _, __) => page);
    else
      _route = MaterialPageRoute(builder: (context) => page);
    await Navigator.push(context, _route)
        .catchError((e) => print('Error push $e'));
  }
  static Future<void> replace(BuildContext context, Widget page,
      {bool isModal = false,Duration duration = const Duration(
        milliseconds: 300
      )}) async {
    Route _route;
    if (isModal)
      _route = PageRouteBuilder(
        barrierColor: Colors.transparent,
          transitionDuration: duration,
          opaque: false, pageBuilder: (BuildContext context, _, __) => page);
    else
      _route = MaterialPageRoute(builder: (context) => page);
    await Navigator.pushReplacement(context, _route)
        .catchError((e) => print('Error push $e'));
  }
  static void replaceSlideAnim(BuildContext context, Widget page,
      {bool full: false, var first, var second}) {
    if (first == null) first = Cubic(0.175, 0.885, 0.32, 1.1);
    if (second == null) second = Curves.easeOutCirc;
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            fullscreenDialog: full,
            pageBuilder: (context, Animation<double> animation,
                Animation<double> secendAnimation) {
              return page;
            },
            transitionsBuilder: (context, Animation<double> animation,
                Animation<double> secendAnimation, Widget widget) {
              return SlideTransition(
                position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
                    .animate(CurvedAnimation(
                    curve: first, //Curves.easeOutBack
                    parent: animation,
                    reverseCurve: second)),
                child: widget,
              );
            })).catchError((e) => print('Error 1 $e'));
  }
  static void pop(BuildContext context, dynamic data) {
    Navigator.pop(context, data);
  }
  static Future<dynamic> pushSlideRightAnim(BuildContext context, Widget page,
      {bool isModal = false, var first, var second}) async{
    if (first == null) first = Cubic(0.175, 0.885, 0.32, 1.1);
    if (second == null) second = Curves.easeOutCirc;
    return await Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            opaque: !isModal,
            pageBuilder: (context, Animation<double> animation,
                Animation<double> secendAnimation) =>page,
            transitionsBuilder: (context, Animation<double> animation,
                Animation<double> secendAnimation, Widget widget) {
              return SlideTransition(
                position: Tween(begin: Offset(1,0), end: Offset(0, 0))
                    .animate(CurvedAnimation(
                    curve: first, //Curves.easeOutBack
                    parent: animation,
                    reverseCurve: second)),
                child: widget,
              );
            })).catchError((e) => print('Error 1 $e'));
  }
}
