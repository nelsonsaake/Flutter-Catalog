import 'package:catalog/services/data_manager/data_manager.dart';
import 'package:catalog/services/navigation_service.dart';
import 'package:catalog/services/scaffold_service.dart';
import 'package:catalog/viewmodels/cart_view_model.dart';
import 'package:catalog/viewmodels/login_view_model.dart';
import 'package:catalog/viewmodels/navigation_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = setupLocator();

GetIt setupLocator() {
  final locator = GetIt.instance;
  locator.registerLazySingleton(() => DataManager());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ScaffoldService());
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerLazySingleton(() => CartViewModel());
  locator.registerLazySingleton(() => NavigationViewModel());
  return locator;
}
