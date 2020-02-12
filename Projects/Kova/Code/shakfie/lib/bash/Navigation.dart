import 'package:flutter/material.dart';
import 'package:shakfie/addcard/screen/AddCardScreen.dart';
import 'package:shakfie/cardlist/screen/CardListScreen.dart';
import 'package:shakfie/forgotpassword/screen/ForgotPasswordScreen.dart';
import 'package:shakfie/home/screen/HomeScreen.dart';
import 'package:shakfie/login/screen/LoginScreen.dart';
import 'package:shakfie/registration/screen/RegistrationScreen.dart';

import 'Screens.dart';

class Navigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Screens.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Screens.SINGUP:
        return MaterialPageRoute(builder: (_)=> RegistrationScreen());
      case Screens.FORGOTPASSWORD:
        return MaterialPageRoute(builder: (_)=> ForgotPasswordScreen());
      case Screens.ADDCARD:
        return MaterialPageRoute(builder: (_)=> AddCardScreen());
      case Screens.HOME:
        return MaterialPageRoute(builder: (_)=> HomeScreen());
      case Screens.GET_CARD_LIST:
        return MaterialPageRoute(builder: (_)=> CardListScreen(args));

      default:
        return _errorRoute(" Comming soon...");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
              title: Text('Error')),
          body: Center(child: Text(message)));
    });
  }

  static void pushReplacement(BuildContext context, String routeName,
      {Object arguments}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> push(BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, {dynamic args}) {
    Navigator.of(context).pop(args);
  }

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}