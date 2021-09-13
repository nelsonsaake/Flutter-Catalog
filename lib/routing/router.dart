import 'package:flutter/material.dart';
import 'package:catalog/locator.dart';
import 'package:catalog/services/notification_service.dart';
import 'package:catalog/viewmodels/login_view_model.dart';
import 'package:catalog/routing/route_names.dart';
import 'package:catalog/views/cart_view/cart_view.dart';
import 'package:catalog/views/catalog_view/catalog_view.dart';
import 'package:catalog/views/login_view/login_view.dart';

bool isLoggedIn(RouteSettings settings) {
  if (locator<LoginViewModel>().isLoggedIn()) return true;
  return false;
}

Route<dynamic> generateRoute(RouteSettings settings) {
  if (isLoggedIn(settings)) {
    return _proceedToGenerateRout(settings);
  }
  return _logInFirst(settings);
}

Route<dynamic> _logInFirst(RouteSettings settings){
  showInSnackBar("Please login to continue.");
  return _getPageRoute(LoginView(), settings.copyWith(name: Routes.login));
}

Route<dynamic> _proceedToGenerateRout(RouteSettings settings) {
  switch (settings.name) {
    case Routes.login:
      return _getPageRoute(LoginView(), settings);
    case Routes.catalog:
      return _getPageRoute(CatalogView(), settings);
    case Routes.cart:
      return _getPageRoute(CartView(), settings);
    default:
      return _getPageRoute(LoginView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => child);
}
