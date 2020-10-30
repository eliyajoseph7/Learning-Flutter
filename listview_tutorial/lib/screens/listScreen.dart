import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implementing ListView'),
        centerTitle: true,
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          debugPrint('Button clicked');
        },
        tooltip: "This is the tooltip",
      ),
    );
  }
}

List<String> getListItems() {
  var items = List<String>.generate(100, (index) => 'Item number $index');

  return items;
}

Widget getListView() {
  var listItems = getListItems();

  var listView = ListView.builder(itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(listItems[index]),
        trailing: IconButton(
          icon: new Icon(Icons.delete_forever),
          color: Colors.red,
          onPressed: () {
            final snackbar = SnackBar(
              content: Text('${listItems[index]} deleted'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {},
              ),
            );

            Scaffold.of(context).showSnackBar(snackbar);
          },
        ),
        onTap: () => print('${listItems[index]} clicked'),
      ),
    );
  });

  return listView;
}
