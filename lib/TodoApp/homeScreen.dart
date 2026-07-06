import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pract/TodoApp/todoProvider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build");
    final item = ref.watch(ItemProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          final DetailItem = item[index];
          return ListTile(
            trailing: Row(
              mainAxisSize: .min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    ref.read(ItemProvider.notifier).DeleteItme(DetailItem.id);
                  },
                ),
                IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              ],
            ),
            title: Text(item[index].name),
            subtitle: Text(item[index].description),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(ItemProvider.notifier).AddItem("Title", "Descriptions");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
