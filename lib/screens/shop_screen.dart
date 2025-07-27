import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/providers/item_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';

class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({super.key});

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final allItems = ref.watch(allItemProvider);
    final cartItems = ref.watch(cartItemProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('W Shop'),
        actions: [
          InkWell(
            splashColor: Colors.blueGrey.withAlpha(50),
            highlightColor: Colors.blueGrey.withAlpha(50),
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    '${cartItems.length} Cart Items',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                  child: Icon(Icons.shopping_cart),
                ),
              ]),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8),
              color: Colors.blueGrey.withAlpha(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      allItems[index].image,
                      width: 60,
                      height: 60,
                    ),
                    Spacer(),
                    Text(allItems[index].name),
                    Spacer(),
                    Text('${allItems[index].price} IQD'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
