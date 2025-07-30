import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/providers/cart_notifier.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems.elementAt(index);
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.blueGrey.withAlpha(20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,12,0),
                    child: Image.asset(
                      item.image,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Text(item.name),
                  Spacer(),
                  Text('${item.price} IQD'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
