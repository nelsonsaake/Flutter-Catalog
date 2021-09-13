import 'dart:math';
import 'package:flutter/material.dart';

final maxItemPrice = 100;
final badItem = Item(-1, "Item doesn't exist");

class Item {
  int id;
  String name;
  Color color;
  double price;

  Item(int id, String name)
      : id = id,
        name = name,
        color = Colors.primaries[id % Colors.primaries.length],
        price = Random().nextDouble() * maxItemPrice;
}
