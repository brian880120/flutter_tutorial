import 'package:flutter/material.dart';

class Product {
    String title;
    String image;
    String description;
    double price;

    Product({
        @required this.title,
        @required this.description,
        @required this.image,
        @required this.price
    });
}