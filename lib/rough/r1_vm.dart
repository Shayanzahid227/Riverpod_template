import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

/// State Providers
final nameProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');

/// ViewModel Provider
final r1_view_model_provider = Provider((ref) {
  return r1_view_model(ref);
});

class r1_view_model {
  final Ref ref;

  r1_view_model(this.ref);

  void updateName(String name) {
    ref.read(nameProvider.notifier).state = name;
  }

  void updateEmail(String email) {
    ref.read(emailProvider.notifier).state = email;
  }

  void signUp() {
    final name = ref.read(nameProvider);
    final email = ref.read(emailProvider);

    print("Name: $name");
    print("Email: $email");
  }
}
