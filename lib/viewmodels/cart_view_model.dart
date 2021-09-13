import '../locator.dart';
import 'package:catalog/datamodels/item.dart';
import 'package:catalog/services/data_manager/data_manager.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  List<Item> get itemsAsList => locator<DataManager>().cart.all;

  final items = locator<DataManager>().cart;

  bool inCart(Item item) => locator<DataManager>().inCart(item);

  void addItem(Item item) {
    locator<DataManager>().addCartItem(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    locator<DataManager>().removeCartItem(item);
    notifyListeners();
  }

  void toggle(Item item) {
    inCart(item) ? removeItem(item) : addItem(item);
    notifyListeners();
  }

  double totalCost(){
    return items.totalPrice();
  }
}

CartViewModel cart(){
  return locator<CartViewModel>();
}