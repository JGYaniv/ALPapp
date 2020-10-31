import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:ALPapp/utils/add_book.dart';

class AddBookForm extends StatefulWidget {
  AddBookForm({Key key}) : super(key: key);

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  final bookFormController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    bookFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: bookFormController,
            decoration: const InputDecoration(
              hintText: 'Enter Book title',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                ScanButton(bookFormController),
                AddBook(bookFormController)
              ]
            )
          ),
        ],
      ),
    );
  }
}

class ScanButton extends StatelessWidget{
  final TextEditingController _textController;

  ScanButton(this._textController);

  Future<void> scanQR() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.BARCODE
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // set the text form controller to the result of our scan
    _textController.value = _textController.value.copyWith(
      text: barcodeScanRes,
      selection:
          TextSelection(baseOffset: barcodeScanRes.length, extentOffset: barcodeScanRes.length),
      composing: TextRange.empty,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => scanQR(),
      child: Text("Start barcode scan")
    );
  }
}