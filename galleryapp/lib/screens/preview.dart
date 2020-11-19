import 'package:galleryapp/screens/edit_gallery.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatefulWidget {
  String name;
  String description;
  String image;
  String material;
  Color favcolor;

  ImagePreview(
      this.name, this.description, this.image, this.material, this.favcolor);
  @override
  _ImagePreviewState createState() => _ImagePreviewState(
      this.name, this.description, this.image, this.material, this.favcolor);
}

class _ImagePreviewState extends State<ImagePreview> {
  String name;
  String description;
  String image;
  String material;
  Color favcolor;
  _ImagePreviewState(
      this.name, this.description, this.image, this.material, this.favcolor);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
        appBar: AppBar(
          title: Text('Image preview'),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                _showPopupMenu();
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 350,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Card(
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 12, left: 7, right: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.lerp(
                                              FontWeight.bold,
                                              FontWeight.normal,
                                              1.0),
                                          fontSize: 15.0),
                                    ),
                                    Text(
                                      material,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              height: 200,
                              child: Card(
                                elevation: 2.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12, left: 7, right: 7),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Image Description',
                                          style: textStyle,
                                        ),
                                      ),
                                      Divider(),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(description),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.edit,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        EditImage(
                                                            name,
                                                            material,
                                                            description)),
                                              );
                                            },
                                            tooltip: "Edit",
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.favorite),
                                            onPressed: () {},
                                            color: favcolor,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  _showPopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Delete'),
                  SizedBox(
                    width: 8.0,
                  ),
                  Icon(Icons.delete_forever),
                ],
              ),
              Divider()
            ],
          ),
          value: '1',
        ),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        //code here
      } else {
        //code here
      }
    });
  }
}
