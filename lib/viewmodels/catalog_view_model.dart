import '../locator.dart';
import 'package:catalog/services/data_manager/data_manager.dart';
import 'package:flutter/cupertino.dart';

class CatalogViewModel extends ChangeNotifier {
  final items = locator<DataManager>().catalog;
}
