import 'package:catalog/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import '../locator.dart';

class NavigationViewModel extends ChangeNotifier {
  final service = locator<NavigationService>();

  String get route => service.lastGoToRoute;

  GlobalKey<NavigatorState> get navigatorKey => service.navigatorKey;

  Future<dynamic> goto(String routeName) {
    final res = service.navigateTo(routeName);
    notifyListeners();
    return res;
  }

  void goBack() {
    service.goBack();
  }
}

NavigationViewModel navViewModelInstance(){
  return locator<NavigationViewModel>();
}