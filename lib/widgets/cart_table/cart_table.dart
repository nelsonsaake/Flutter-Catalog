import 'package:catalog/datamodels/item.dart';
import 'package:catalog/viewmodels/cart_view_model.dart';
import 'package:flutter/material.dart';

class CartTable extends StatelessWidget {
  final headingStyle = TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

  final cellStyle = TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);

  final colNames = ["Id", "Name", "Price"];

  final decDigitCount = 2;

  final headingRowColor = MaterialStateProperty.all(Colors.white);

  final totalRowColor = MaterialStateProperty.all(Color.fromRGBO(78, 78, 78, 1));

  final diverThickness = 0.0;

  final shiftRowLeftBy = 20.0;

  final headingRowHeight = 50.0;

  final dataRowHeight = 70.0;

  CartTable({Key? key}) : super(key: key);

  String priceToString (double price) {
    return price.toStringAsFixed(decDigitCount);
  }

  DataColumn buildDataCol(String txt) {
    return DataColumn(label: Text(txt, style: headingStyle));
  }

  List<DataColumn> buildDataCols() {
    return colNames.map((col) => buildDataCol(col)).toList();
  }

  DataCell buildDataCell(String txt) {
    return DataCell(Text(txt, style: cellStyle));
  }

  DataRow buildDataRow(Item item) {
    return DataRow(
      cells: [
        buildDataCell(item.id.toString()),
        buildDataCell(item.name),
        buildDataCell(priceToString(item.price)),
      ],
    );
  }

  DataCell buildTotalCell(String txt) {
    return DataCell(Text(txt, style: cellStyle));
  }

  DataRow buildTotalRow(){
    return DataRow(
      color: totalRowColor,
      cells: [
        buildTotalCell(""),
        buildTotalCell("Total Cost:"),
        buildTotalCell(priceToString(cart().totalCost())),
      ],
    );
  }


  List<DataRow> buildDataRows() {
    final rows = cart().itemsAsList.map((item) => buildDataRow(item)).toList();
    rows.add(buildTotalRow());
    return rows;
  }

  Widget buildDataTable() {
    return DataTable(
      headingRowHeight: headingRowHeight,
      headingRowColor: headingRowColor,
      horizontalMargin: shiftRowLeftBy,
      dividerThickness: diverThickness,
      dataRowHeight: dataRowHeight,
      columns: buildDataCols(),
      rows: buildDataRows(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: buildDataTable(),
      ),
    );
  }
}
