import 'package:catalog/data/item_names.dart';
import 'package:catalog/data/user_profiles.dart';
import 'package:catalog/datamodels/item.dart';
import 'package:catalog/services/data_manager/items.dart';
import 'package:catalog/services/data_manager/users.dart';

class DataManager {
  Users users = Users();
  Items catalog = Items();
  Items cart = Items();

  void initUsers() {
    usersProfiles().forEach((user) {
      users.create(user);
    });
  }

  void initCatalog() {
    itemNames().forEach((name) {
      catalog.create(name);
    });
  }

  void init() {
    initUsers();
    initCatalog();
  }

  void addCartItem(Item item) {
    if (inCart(item)) return;
    cart.add(item);
  }

  void removeCartItem(Item item) {
    cart.delete(item.id);
  }

  bool inCart(Item item) {
    return cart.all.contains(item);
  }

  DataManager() {
    init();
  }
}
