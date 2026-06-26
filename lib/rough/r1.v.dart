import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/rough/r1_vm.dart';

class r1_screen extends ConsumerWidget {
  const r1_screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final email = ref.watch(emailProvider);

    final viewModel = ref.read(r1_view_model_provider);

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Name"),
              onChanged: viewModel.updateName,
            ),

            const SizedBox(height: 20),

            TextField(
              decoration: const InputDecoration(labelText: "Email"),
              onChanged: viewModel.updateEmail,
            ),

            const SizedBox(height: 20),

            Text("Name : $name"),
            Text("Email : $email"),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: viewModel.signUp,
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
