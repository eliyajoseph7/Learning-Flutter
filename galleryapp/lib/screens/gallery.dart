import 'package:galleryapp/model/items.dart';
import 'package:galleryapp/providers/items_providers.dart';
import 'package:galleryapp/screens/preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyGallery extends StatefulWidget {
  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  @override
  Widget build(BuildContext context) {
    var itemsProvider = Provider.of<ItemProvider>(context);
    return FutureBuilder<List<Items>>(
      future: Items.fetchItems(),
      builder: (c, s) {
        if (s.hasData) {
          List<Column> items = new List<Column>();
          for (int i = 0; i < s.data.length; i++) {
            items.add(Column(
              children: [
                Expanded(
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    image: NetworkImage(s.data[i].image),
                                    fit: BoxFit.cover)),
                          ),
                          onTap: () {
                            itemsProvider.setFavcolor(Colors.red);
                            setState(() {
                              s.data[i].favColor = itemsProvider.favcolor;
                            });
                          },
                          onDoubleTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => ImagePreview(
                                    s.data[i].itemName,
                                    s.data[i].description,
                                    s.data[i].image,
                                    s.data[i].material,
                                    s.data[i].favColor),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text(s.data[i].itemName)),
                              Expanded(
                                child: Icon(
                                  Icons.favorite,
                                  color: s.data[i].favColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
          }
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: items,
            ),
          );
        }
        if (s.hasError) print(s.error.toString());
        return Scaffold(
          body: Center(
            child: s.hasError
                ? Text("No iternet")
                : CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
                  ),
          ),
        );
      },
    );
  }
}
