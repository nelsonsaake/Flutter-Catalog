import 'package:catalog/services/scaffold_service.dart';
import 'package:catalog/viewmodels/navigation_view_model.dart';
import 'package:catalog/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:catalog/locator.dart';
import 'package:catalog/constants/images.dart';
import 'package:catalog/routing/route_names.dart';
import 'package:catalog/routing/router.dart';
import 'package:catalog/widgets/background_image/background_image.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class Layout extends StatelessWidget {
  Layout({Key? key}) : super(key: key);

  final glassColor = Color.fromRGBO(0, 0, 0, 0.2);
  final glassBorderRadius = BorderRadius.circular(10.0);
  final padding = EdgeInsets.all(32);
  final vSpacing = 32.0;
  final appTitle = "Catalog";
  final titleStyle = TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

  Widget buildTitleBuilder() {
    final currentRoute = navViewModelInstance().route;
    final additions = currentRoute == Routes.cart ? ": Cart" : "";
    final title = "$appTitle $additions";
    return Text(title, style: titleStyle);
  }

  Widget buildTitle() {
    return ViewModelBuilder<NavigationViewModel>.reactive(
        viewModelBuilder: () => navViewModelInstance(), builder: (context, model, _) => buildTitleBuilder());
  }

  List<Widget> buildAppBarAction() {
    return [NavigationBar()];
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: buildTitle(),
      actions: buildAppBarAction(),
    );
  }

  Widget buildBackground({Widget? child}) {
    final glass = buildGlass(
      child: child,
    );
    final glassWrapper = Container(
      padding: padding,
      child: glass,
    );
    return BackgroundImage(
      src: Images.dog,
      child: glassWrapper,
    );
  }

  Widget buildGlass({Widget? child}) {
    final decoration = BoxDecoration(
      color: glassColor,
      borderRadius: glassBorderRadius,
    );
    return Container(
      padding: padding,
      decoration: decoration,
      child: Center(child: child),
    );
  }

  Widget buildNavigator() {
    return Navigator(
      key: navViewModelInstance().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: Routes.cart,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: locator<ScaffoldService>().scaffoldKey,
      appBar: buildAppBar(),
      body: buildBackground(
        child: buildNavigator(),
      ),
    );
  }
}
