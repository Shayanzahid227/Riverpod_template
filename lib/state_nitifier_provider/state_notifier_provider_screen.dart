import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/state_nitifier_provider/state_notifier_provider_v_m.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(stateNotifierProviderViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('State Notifier Provider Screen')),
      body: Column(
        children: [
          SizedBox(height: 100),
          Consumer(
            builder: (context, ref, child) {
              final visibalityState = ref.watch(
                stateNotifierProviderViewModelProvider,
              );
              return Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        vm.isVisiable(!visibalityState.isTextVisible);
                      },
                      icon: Icon(
                        visibalityState.isTextVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    labelText: "Name",
                    hintText: 'name',
                  ),

                  obscureText: visibalityState.isTextVisible,
                  onChanged: (vlaue) {
                    vm.displayText(vlaue);
                    // this is another way to update the state but to avoid not a good approach
                    // ref
                    //     .read(stateNotifierProviderViewModelProvider.notifier)
                    //     .displayText(vlaue);
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Consumer(
            builder: (context, ref, child) {
              final visibalityState = ref.watch(
                stateNotifierProviderViewModelProvider,
              );
              final displayTextstate = ref.watch(
                stateNotifierProviderViewModelProvider,
              );
              final displayText = displayTextstate.displayText ?? '';
              return Text(
                visibalityState.isTextVisible
                    ? 'text:${displayText.isEmpty ? " No state found" : displayText}'
                    : 'Text is hidden',
              );
            },
          ),
          SizedBox(height: 40),
          Consumer(
            builder: (context, ref, child) {
              final switchState = ref.watch(
                stateNotifierProviderViewModelProvider,
              );
              return Switch(value: switchState.isOn, onChanged: vm.ischnage);
            },
          ),
        ],
      ),
    );
  }
}
