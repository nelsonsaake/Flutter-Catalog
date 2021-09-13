import 'package:catalog/locator.dart';
import 'package:catalog/services/scaffold_service.dart';

void showInSnackBar(String msg) {
  locator<ScaffoldService>().showSnackBarMessage(msg);
}
