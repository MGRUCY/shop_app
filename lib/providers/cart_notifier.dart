import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/item.dart';

class CartNotifier extends Notifier<Set<Item>> {
  //init val
  @override
  Set<Item> build() {
    return {
      Item(
          id: '1',
          name: 'Groovy Shorts',
          image: 'assets/items/shorts.png',
          price: 12,
          date: null),
    };
  }
  //method to update
}

final cartNotifierProvider =
    NotifierProvider<CartNotifier, Set<Item>>(() => CartNotifier());
