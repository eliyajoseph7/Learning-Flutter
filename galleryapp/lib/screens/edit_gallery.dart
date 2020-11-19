import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditImage extends StatefulWidget {
  final String name;
  final String material;
  final String description;

  EditImage(this.name, this.material, this.description);

  @override
  _EditImageState createState() =>
      _EditImageState(this.name, this.material, this.description);
}

class _EditImageState extends State<EditImage> {
  final String name;
  final String material;
  final String description;

  var _formState = GlobalKey<FormState>();
  _EditImageState(this.name, this.material, this.description);
  @override
  Widget build(BuildContext context) {
    TextEditingController _title = new TextEditingController(text: name);
    TextEditingController _material = new TextEditingController(text: material);
    TextEditingController _description =
        new TextEditingController(text: description);

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Edit Gallery"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 25.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formState,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.tap_and_play),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "Edit Details",
                              style: textStyle,
                            ),
                            Icon(Icons.check_circle_outline)
                          ],
                        ),
                      ),
                      Divider(),
                      TextFormField(
                        controller: _title,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.title),
                          labelText: 'Title',
                          labelStyle: TextStyle(fontSize: 18.0),
                          errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _material,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.wallet_giftcard),
                          labelText: 'Material',
                          labelStyle: TextStyle(fontSize: 18.0),
                          errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
                        controller: _description,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        maxLines: 3,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.description),
                          labelText: 'Description',
                          labelStyle: TextStyle(fontSize: 18.0),
                          errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                      _buttons(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buttons() {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cancel),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  'Cancel',
                  textScaleFactor: 1.2,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: RaisedButton(
            onPressed: () {
              if (_formState.currentState.validate()) {
                showToast();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.update),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  'Update',
                  textScaleFactor: 1.2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'Saved successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIos: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white70);
  }
}
