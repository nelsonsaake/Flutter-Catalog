import 'package:catalog/locator.dart';
import 'package:catalog/routing/route_names.dart';
import 'package:catalog/services/navigation_service.dart';
import 'package:catalog/viewmodels/navigation_view_model.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({Key? key}) : super(key: key);

  final padding = 16.0;
  final catalogStyle = TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);

  Widget buildHSpace() {
    return SizedBox(width: 32.0);
  }

  Widget buildBackButton() {
    void onPressed() => navViewModelInstance().goto(Routes.catalog);
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text("Go to Catalog", style: catalogStyle),
      ),
    );
  }

  Widget buildCartButton() {
    void onPressed() => navViewModelInstance().goto(Routes.cart);
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.shopping_cart, semanticLabel: "Cart", color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [buildBackButton(), buildHSpace(), buildCartButton(), buildHSpace()],
      ),
    );
  }
}
