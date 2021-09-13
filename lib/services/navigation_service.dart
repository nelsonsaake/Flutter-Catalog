import 'package:flutter/cupertino.dart';

class NavigationService{
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String lastGoToRoute = "";

  Future<dynamic> navigateTo(String routeName){
    lastGoToRoute = routeName;
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack(){
    return navigatorKey.currentState!.pop();
  }
}