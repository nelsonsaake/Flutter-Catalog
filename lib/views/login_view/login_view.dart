import 'package:catalog/locator.dart';
import 'package:catalog/routing/route_names.dart';
import 'package:catalog/services/navigation_service.dart';
import 'package:catalog/services/notification_service.dart';
import 'package:catalog/style/text_styles.dart';
import 'package:catalog/viewmodels/login_view_model.dart';
import 'package:catalog/viewmodels/navigation_view_model.dart';
import 'package:catalog/widgets/button/button.dart';
import 'package:catalog/widgets/form_title/form_title.dart';
import 'package:catalog/widgets/labelled_text_input/labelled_text_input.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginViewModel lvm = locator<LoginViewModel>();

  LoginView({Key? key}) : super(key: key);

  final vSpacing = 32.0;

  final loginTitle = "Login";
  final usernameLabelTxt = "username: ";
  final passwordLabelTxt = "password: ";
  final loginButtonLabelTxt = "Login";

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showMessage(BuildContext context, String message) {
    print(message);
    showInSnackBar(message);
  }

  void login(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    await lvm.login(username: username, password: password);
    print("\n username: ${usernameController.text} \n password: $password \n ");

    showMessage(context, lvm.loginMessage());
    if (lvm.isLoggedIn()) {
      navViewModelInstance().goto(Routes.catalog);
    }
  }

  Widget buildColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget buildRow(List<Widget> children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children,
    );
  }

  Widget buildVerticalSpace() {
    return SizedBox(
      height: vSpacing,
    );
  }

  Widget buildInput({
    required String labelText,
    TextEditingController? controller,
    bool isPassword = false,
  }) {
    return LabelledTextInput(
      labelText: labelText,
      inputStyle: inputStyle,
      labelStyle: labelStyle,
      inputController: controller,
      isPassword: isPassword,
    );
  }

  Widget buildUserNameInput() {
    return buildInput(
      labelText: usernameLabelTxt,
      controller: usernameController,
      isPassword: false,
    );
  }

  Widget buildPasswordInput() {
    return buildInput(
      labelText: passwordLabelTxt,
      controller: passwordController,
      isPassword: true,
    );
  }

  Widget buildButton(BuildContext context) {
    return Button(
      text: loginButtonLabelTxt,
      customStyle: buttonStyle,
      onPressed: () => login(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildColumn(
      [
        FormTitle(title: loginTitle),
        buildVerticalSpace(),
        buildUserNameInput(),
        buildVerticalSpace(),
        buildPasswordInput(),
        buildVerticalSpace(),
        buildButton(context),
      ],
    );
  }
}
