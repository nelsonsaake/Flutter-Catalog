import '../../widgets/catalog_list/catalog_list.dart';
import 'package:catalog/viewmodels/catalog_view_model.dart';
import 'package:flutter/material.dart';

class CatalogView extends StatelessWidget {
  final catalog = CatalogViewModel().items;

  Widget build(BuildContext context) {
    return CatalogList(items: catalog);
  }
}
