import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/counter/counter_view_model.dart';

/*
// this methode rebuild the whole UI ---> bad performance
class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counter);
    return Scaffold(
      body: Center(
        child: Text(
          '$count',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state = count + 1;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
 */

// so just rebuild the widget which state is chnaging ---> good performance
class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(counterViewModel);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter);
                return Text(
                  '$count',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final switchValue = ref.watch(switchProvider);
                return Switch(
                  value: switchValue,
                  onChanged: (value) {
                    ref.read(switchProvider.notifier).state = value;
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: viewModel.onIncrement,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
