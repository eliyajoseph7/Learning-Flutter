import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Items {
  String itemId;
  String itemName;
  String material;
  String price;
  String description;
  String image;
  Color favColor;

  Items(
      {this.itemId,
      this.material,
      this.itemName,
      this.image,
      this.description,
      this.price,
      this.favColor});

  static Future<List<Items>> fetchItems() async {
    http.Response response = await http
        .get('https://5e98afff5eabe7001681c474.mockapi.io/api/v1/products');

    List<Items> items = [];
    try {
      if (response.statusCode == 200) {
        var resp = jsonDecode(response.body);
        for (var map in resp) {
          items.add(
            Items(
                itemId: map['id'],
                itemName: map['name'],
                material: map['material'],
                price: map['price'],
                image: map['image'],
                description: map['description'],
                favColor: Colors.grey),
          );
        }
      }
    } catch (e, _) {
      print(e.toString());
    }
    return items;
  }
}
