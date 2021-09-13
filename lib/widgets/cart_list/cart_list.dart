import 'package:catalog/datamodels/item.dart';
import 'package:catalog/services/data_manager/items.dart';
import 'package:catalog/widgets/catalog_item/catalog_item.dart';
import 'package:catalog/widgets/items_list_widget/items_list_widget.dart';
import 'package:flutter/material.dart';

class CartList extends ItemsListWidget {
  CartList({required Items items}) : super(items: items);

  Widget buildCartItem(int index) {
    index = itemNumber(index);
    if (0 <= index && index < items.all.length) {
      return CatalogItem(item: items.all[index]);
    } else {
      return CatalogItem(item: badItem);
    }
  }

  Widget buildItemWidget(int index) => buildCartItem(index);
}
