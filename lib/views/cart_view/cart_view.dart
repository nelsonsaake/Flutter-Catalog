import 'package:catalog/viewmodels/cart_view_model.dart';
import 'package:catalog/widgets/cart_list/cart_list.dart';
import 'package:catalog/widgets/cart_table/cart_table.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  final padding = EdgeInsets.all(16.0);

  Widget buildCartList() {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => cart(),
      builder: (context, cart, _) => CartList(items: cart.items),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CartTable();
  }
}
