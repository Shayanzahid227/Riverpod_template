import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // store homeTextProvider value in homeText variable
    // watch looks mean detech chnage in homeTextProvider and update ui accordingly
    final homeText = ref.watch(homeTextProvider);
    final appbarText = ref.watch(appbarTextProvider);
    final viewModel = ref.read(homeViewModelProvider);

    return Scaffold(
      // display homeText value here
      appBar: AppBar(title: Text(appbarText)),
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: Text(
              homeText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 100),
          Center(
            child: ElevatedButton(
              onPressed: viewModel.onButtonPressed,
              child: Text('press to see chnage'),
            ),
          ),
        ],
      ),
    );
  }
}
