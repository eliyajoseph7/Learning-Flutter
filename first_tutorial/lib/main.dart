import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('My ID'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            age++;
          });
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.grey[500],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[700],
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.grey[500],
                letterSpacing: 3.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Eliya Joseph',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 28.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Nationality',
              style: TextStyle(
                color: Colors.grey[500],
                letterSpacing: 3.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Tanzanian',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 28.0,
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'emailme@example.com',
                  style: TextStyle(
                    color: Colors.grey[500],
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Age',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 28.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$age',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 28.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
