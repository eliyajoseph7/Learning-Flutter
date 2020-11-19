import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddToGallery extends StatefulWidget {
  @override
  _AddToGalleryState createState() => _AddToGalleryState();
}

class _AddToGalleryState extends State<AddToGallery> {
  var _formState = GlobalKey<FormState>();

  TextEditingController _title = new TextEditingController();
  TextEditingController _imageUrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Add To Gallery')),
              background: Image.network(
                "http://lorempixel.com/640/480/nature/",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Scrollbar(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Form(
                        key: _formState,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 25.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _title,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "This field is required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Event Title",
                                  hintText: "Enter the name of the event",
                                  labelStyle: textStyle,
                                  errorStyle: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 15.0,
                                  ),
                                  fillColor: Colors.grey[900],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                controller: _imageUrl,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "This field is required";
                                  }
                                  // var urlPattern =
                                  //     r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
                                  bool isMatch = value.isUrl();
                                  if (isMatch == false) {
                                    return "Enter a valid url";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Image URL",
                                  hintText: "Enter the image url",
                                  labelStyle: textStyle,
                                  errorStyle: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 15.0,
                                  ),
                                  fillColor: Colors.grey[900],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              _buttons()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
              setState(() {
                _title.text = "";
                _imageUrl.text = "";
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.settings_backup_restore),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  'Reset',
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
                setState(() {
                  _title.text = "";
                  _imageUrl.text = "";
                });
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  'Save',
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
