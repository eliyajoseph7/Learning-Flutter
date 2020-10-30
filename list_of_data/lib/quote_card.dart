import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 19,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[800],
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 1.0),
            FlatButton.icon(
              onPressed: delete,
              label: Text('delete quote'),
              icon: Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
