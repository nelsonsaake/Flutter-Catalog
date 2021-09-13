import 'package:catalog/datamodels/item.dart';

class Items {
  Map<int, Item> _items = Map<int, Item>();

  Item create(String name) {
    final id = _items.length;
    final newItem = Item(id, name);
    _items[id] = newItem;
    return newItem;
  }

  int get count => all.length;

  Item add(Item item) => _items[item.id] = item;

  List<Item> get all => _items.values.toList();

  void update(int id, Item user) {}

  void delete(int id) => _items.remove(id);

  double totalPrice() {
    double sum = 0;
    _items.forEach((id, item) => sum += item.price);
    return sum;
  }
}
