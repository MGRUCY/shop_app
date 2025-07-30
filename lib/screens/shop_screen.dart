import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/providers/cart_notifier.dart';
import 'package:shop_app/providers/item_provider.dart';
import 'package:shop_app/providers/selectedItemsProvider.dart';
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
    final isInCart = ref.watch(cartNotifierProvider);
    final selectedItems = ref.watch(selectedItemsProvider);
    final isSelecting = selectedItems.isNotEmpty;
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
                    '${isInCart.length} Cart Items',
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
          padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: GridView.builder(
            itemCount: allItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              final item = allItems[index];
              final selectedItems = ref.watch(selectedItemsProvider);
              final isSelected = selectedItems.contains(item);
              return GestureDetector(
                onLongPress: () {
                  ref.read(selectedItemsProvider.notifier).toggle(item);
                },
                onTap: () {
                  if (isSelecting) {
                    ref.read(selectedItemsProvider.notifier).toggle(item);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blue.withAlpha(20)
                        : Colors.blueGrey.withAlpha(20),
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.asset(item.image, width: 80, height: 80),
                      Spacer(),
                      Text(item.name),
                      Spacer(),
                      Text('${item.price} IQD'),
                    ],
                  ),
                ),
              );
            },
          )),
      bottomNavigationBar: isSelecting
          ? Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: ElevatedButton(
                onPressed: () {
                  final selectedItems = ref.read(selectedItemsProvider);
                  final cartNotifier = ref.read(cartNotifierProvider.notifier);
                  for (final item in selectedItems) {

                    cartNotifier.addItem(item);
                  }
                  ref.read(selectedItemsProvider.notifier).clear();
                },
                child: Text('Add ${selectedItems.length} Item to Cart'),
              ),
            )
          : null,
    );
  }
}
