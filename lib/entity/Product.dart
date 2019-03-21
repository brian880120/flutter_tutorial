import 'package:flutter/material.dart';

class Product {
    String title;
    String image;
    String description;
    double price;
    final bool isFavorite;

    Product({
        @required this.title,
        @required this.description,
        @required this.image,
        @required this.price,
        this.isFavorite = false
    });
}