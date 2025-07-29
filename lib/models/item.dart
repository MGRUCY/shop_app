import 'package:flutter/material.dart';

enum Priority {
  high(color: Colors.orange, title: 'High'),
  medium(color: Colors.amber, title: 'Medium'),
  low(color: Colors.green, title: 'Low');

  const Priority({required this.color, required this.title});
  final Color color;
  final String title;
}

class Item {
  final String id;
  final String name;
  final String image;
  final double price;
  final DateTime? date;
  int? priority;

  Item(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.date,
      });
}
