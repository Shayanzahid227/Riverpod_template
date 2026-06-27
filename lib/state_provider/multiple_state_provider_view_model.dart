import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final nameProvider = StateProvider<String>((ref) => 'shayan');
final ageProvider = StateProvider<String>((ref) => '21');

final multipleStateProviderViewModelProvider = Provider(
  (ref) => MultipleStateProviderViewModel(ref),
);

class MultipleStateProviderViewModel {
  MultipleStateProviderViewModel(this.ref);

  final Ref ref;

  String name = '';
  String age = '';

  void updateName(String nameParameter) {
    name = nameParameter;
  }

  void updateAge(String ageParameter) {
    age = ageParameter;
  }

  void onButtonPressed() {
    // Update providers
    ref.read(nameProvider.notifier).state = name.isEmpty
        ? ref.read(nameProvider)
        : name;
    ref.read(ageProvider.notifier).state = age.isEmpty
        ? ref.read(ageProvider)
        : age;

    // Print values
    print('Name: $name');
    print('Age: $age');
  }
}
