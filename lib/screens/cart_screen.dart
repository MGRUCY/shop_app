import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/providers/item_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartItemProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.blueGrey.withAlpha(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,12,0),
                    child: Image.asset(
                      allItems[index].image,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Text(allItems[index].name),
                  Spacer(),
                  Text('${allItems[index].price} IQD'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
