import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class AddFindReader extends StatefulWidget {
  AddFindReader({Key key}) : super(key: key);

  @override
  _AddFindReaderState createState() => _AddFindReaderState();
}

class _AddFindReaderState extends State<AddFindReader> {
  String _myReader;
  String _myReaderResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myReader = '';
    _myReaderResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myReaderResult = _myReader;
      });
    }
  }

// https://stackoverflow.com/questions/54480641/flutter-how-to-create-forms-in-popup 
  _openModal() {
    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.amber,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "First Name"
                        ),
                        validator: (value) {
                          if(value.isEmpty) {
                            return 'Please enter the First Name';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Last Name"
                        ),
                        validator: (value) {
                          if(value.isEmpty) {
                            return 'Please enter the Last Name';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Date of Birth"
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "School name or number"
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Readers'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Readers',
                  hintText: 'Please choose one',
                  value: _myReader,
                  onSaved: (value) {
                    setState(() {
                      _myReader = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myReader = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Reader1",
                      "value": "Reader1",
                    },
                    {
                      "display": "Reader2",
                      "value": "Reader2",
                    },
                    {
                      "display": "Reader3",
                      "value": "Reader3",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Add Reader'),
                  onPressed: _openModal,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myReaderResult),
              )
            ],
          ),
        ),
      ),
    );
  }
}