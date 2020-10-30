import 'package:flutter/material.dart';
import 'package:list_of_data/quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(text: 'Lorem ipsum, dolor sit amet ', author: 'Eliya Joseph'),
    Quote(text: 'facilis dolore quam numquam ', author: 'Eliya Joseph'),
    Quote(text: 'Lorem ipsum, dolor sit amet ', author: 'Eliya Joseph'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('List Of Words'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
