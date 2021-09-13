import 'package:catalog/datamodels/item.dart';
import 'package:catalog/viewmodels/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class CatalogItem extends StatelessWidget {
  final Item item;
  final maxNameLength = 30;
  final colorWidth = 10.0;
  final widgetWidth = 240.0;
  final priceDecimalCount = 2;
  final horizontalSpace = 16.0;
  final padding = EdgeInsets.all(16);
  final backgroundColor = Color.fromRGBO(0, 0, 0, 0.2);
  final altBackgroundColor = Color.fromRGBO(0, 0, 0, 0.4);
  final nameStyle = TextStyle(fontSize: 24, color: Colors.white);
  final priceStyle = TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold);

  CatalogItem({required this.item, Key? key}) : super(key: key);

  Widget buildColor() {
    return Container(height: colorWidth, width: colorWidth, color: item.color);
  }

  TextSpan name() {
    final text = "${item.name}, ";
    return TextSpan(text: text, style: nameStyle);
  }

  TextSpan price() {
    final text = item.price.toStringAsFixed(priceDecimalCount);
    return TextSpan(text: text, style: priceStyle);
  }

  Widget buildText(BuildContext context) {
    final style = DefaultTextStyle.of(context).style;
    final children = [name(), price()];
    final text = TextSpan(style: style, children: children);
    return Expanded(child: RichText(text: text));
  }

  Widget buildSpace() {
    return SizedBox(width: horizontalSpace);
  }

  Widget buildIcon(CartViewModel model) {
    final fav = Icons.favorite;
    final unFav = Icons.favorite_border;
    final icon = model.inCart(item) ? fav : unFav;
    return Icon(icon, color: Colors.red);
  }

  Widget buildBackground({required Widget child, required CartViewModel model}) {
    return Material(
      color: item.id.isOdd ? backgroundColor : altBackgroundColor,
      child: InkWell(
        onTap: () => model.toggle(item),
        child: Container(padding: padding, child: child),
      ),
    );
  }

  Widget buildContent({required BuildContext context, required CartViewModel model}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [buildColor(), buildSpace(), buildText(context), buildSpace(), buildIcon(model)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => cart(),
      disposeViewModel: false,
      builder: (context, model, child) => buildBackground(
        model: model,
        child: buildContent(context: context, model: model),
      ),
    );
  }
}
