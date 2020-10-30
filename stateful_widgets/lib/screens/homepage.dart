import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The stateful widget'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: InputChangeHandling(),
    );
  }
}

class InputChangeHandling extends StatefulWidget {
  @override
  _InputChangeHandlingState createState() => _InputChangeHandlingState();
}

class _InputChangeHandlingState extends State<InputChangeHandling> {
  String text;
  var _theList = ['Moja', 'Mbili', 'Tatu', 'Nne', 'Tano'];
  var _currentValue = 'Moja';
  var click = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (String message) {
                      setState(() {
                        text = message;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                DropdownButton<String>(
                  items: _theList.map((String listItems) {
                    return DropdownMenuItem<String>(
                      value: listItems,
                      child: Text(listItems),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      this._currentValue = newValue;
                    });
                  },
                  value: _currentValue,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('The text you typed is $text'),
                    SizedBox(
                      height: 14.0,
                    ),
                    Text('The current dropdown value is $_currentValue'),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  'You clicked the button $click times!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[900],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        click = 0;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.restore,
                          color: Colors.amber[900],
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text('Reset'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        click++;
                        final snackBar = SnackBar(
                          content: Text(
                            'You clicked the button $click times!',
                          ),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              setState(() {
                                click--;
                              });
                            },
                          ),
                        );

                        Scaffold.of(context).showSnackBar(snackBar);
                      });
                    },
                    tooltip: 'Increment click number',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
