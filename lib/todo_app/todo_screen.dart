import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/todo_app/todo_view_model.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item=ref.watch(itemViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Items length: ${item.length}'),
      ),
      body: Scaffold(body: item.isEmpty? Center(child: Text('no data found')):
      ListView.builder(
        
        itemCount:item.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){

      return ListTile(
        title: Text("Name: ${item[index].name}"),
        subtitle: Text("Id: ${item[index].id}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                ref.read(itemViewModelProvider.notifier).updateItemInList(item[index].id, 'updated item ');
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                ref.read(itemViewModelProvider.notifier).deleteItemFromList(item[index].id);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      );
      })
     
      ///
      /// floatin button
      ///
  
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         final count = ref.read(itemViewModelProvider).length;
          ref.read(itemViewModelProvider.notifier).addItemToList('item ${count + 1}');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}