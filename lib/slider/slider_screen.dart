import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/slider/slider_view_model.dart';

class SliderScreen extends ConsumerWidget {
  SliderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderValue = ref.watch(sliderProvider);
    final viewModel = ref.read(sliderViewModel);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Slider Value: $sliderValue'),
          Consumer(
            builder: (context, ref, child) {
              print('container with slider value');
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(sliderValue),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print('slider value');
              return Slider(
                value: sliderValue,
                onChanged: (value) {
                  ref.read(sliderProvider.notifier).state = value;
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print('slider');
              return Visibility(
                visible: ref.watch(visabliltyProvider),
                child: Container(height: 200, width: 200, color: Colors.red),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(visabliltyProvider.notifier).state = !ref.read(
                visabliltyProvider,
              );
              print('visable ');
            },
            child: Text('Show'),
          ),
        ],
      ),
    );
  }
}
