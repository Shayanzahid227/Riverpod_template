import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/rough/r2_view_model.dart';

class R2Screen extends ConsumerWidget {
  const R2Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(viewmodelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("R2 Screen")),
      body: Column(
        children: [
          SizedBox(height: 200),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Name", hintText: 'name'),

              onChanged: viewModel.updateName,
            ),
          ),
          SizedBox(height: 20),
          Consumer(
            builder: (context, ref, child) {
              final name = ref.watch(nameProvider);
              return Text('Name: $name');
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Age", hintText: 'age'),

              onChanged: viewModel.updateAge,
            ),
          ),
          SizedBox(height: 20),
          Consumer(
            builder: (context, ref, child) {
              final age = ref.watch(ageProvider);
              return Text('Age: $age');
            },
          ),
          SizedBox(height: 40),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: viewModel.onButtonPressed,
                child: Text('Press'),
              );
            },
          ),
        ],
      ),
    );
  }
}
