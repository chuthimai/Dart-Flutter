import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = groceryItems;

  void _addItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<GroceryItem>(MaterialPageRoute( // gia tri tra lai sau khi thoat ra
      builder: (cxt) => const NewItem(),
    )); // doi new_item thoat ra

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem groceryItem) {
    setState(() {
      _groceryItems.remove(groceryItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: Text("No items added yet."),);

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) {
            return Dismissible(
              key: Key(_groceryItems[index].id),
              child: ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItems[index].category.color,
                ),
                trailing: Text(_groceryItems[index].quantity.toString()),
              ),
              onDismissed: (direction) {
                _removeItem(_groceryItems[index]);
              },
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: () {
              _addItem(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
