import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/favourite/favourite_view_model.dart';

class FavourteScreen extends ConsumerWidget {
  const FavourteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // access to all the states of the favourite screen mention in view model

    final vm = ref.watch(favouriteStateProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('search Screen')),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
            ref.read(favouriteStateProvider.notifier).searchItems(value);
            },
          ),
          vm.allItems.isEmpty
              ? const Center(child: Text('No items found'))
              : Expanded(
                  child: ListView.builder(
                    itemCount: vm.filterItems.length,
                    itemBuilder: (context, index) {
                      final item = vm.filterItems[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('ID: ${item.id}'),
                        trailing: IconButton(
                          icon: Icon(
                            item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: item.isFavourite ? Colors.red : null,
                          ),
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(favouriteStateProvider.notifier).addItem();
        },
      ),
    );
  }
}
