import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counter = StateProvider((ref) {
  return 0;
});
final switchProvider = StateProvider((ref) {
  return false;
});
final counterViewModel = Provider((ref) => CounterViewModel(ref));

class CounterViewModel {
  CounterViewModel(this.ref);

  final Ref ref;

  void onIncrement() {
    ref.read(counter.notifier).state++;
  }
}
