import 'package:flutter/material.dart';
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
            child: AddBook(bookFormController)
            // child: ElevatedButton(
            //   onPressed: () {
            //     // Validate will return true if the form is valid, or false if
            //     // the form is invalid.
            //     if (_formKey.currentState.validate()) {
            //       AddBook(_formKey.toString());
            //     }
            //   },
            //   child: Text('Submit'),
            // ),
          ),
        ],
      ),
    );
  }
}
