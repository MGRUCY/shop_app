import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/item.dart';

List<Item> allItems = [
  Item(
      id: '1',
      name: 'Groovy Shorts',
      image: 'assets/items/shorts.png',
      price: 12,
      date: DateTime.now()),
  Item(
      id: '2',
      name: 'Karati Kit',
      image: 'assets/items/karati.png',
      price: 34,
      date: DateTime.now()),
  Item(
      id: '3',
      name: 'Denim Jeans',
      image: 'assets/items/jeans.png',
      price: 54,
      date: DateTime.now()),
  Item(
      id: '4',
      name: 'Red Backpack',
      image: 'assets/items/backpack.png',
      price: 14,
      date: DateTime.now()),
  Item(
      id: '5',
      name: 'Drum & Sticks',
      image: 'assets/items/drum.png',
      price: 29,
      date: DateTime.now()),
  Item(
      id: '6',
      name: 'Blue Suitcase',
      image: 'assets/items/suitcase.png',
      price: 44,
      date: DateTime.now()),
  Item(
      id: '7',
      name: 'Roller Skates',
      image: 'assets/items/skates.png',
      price: 52,
      date: DateTime.now()),
  Item(
      id: '8',
      name: 'Electric Guitar',
      image: 'assets/items/guitar.png',
      price: 79,
      date: DateTime.now()),
];

final allItemProvider = Provider((ref) => allItems);

final cartItemProvider = Provider((ref) {
  return allItems.where((i) => i.price < 50);
});
