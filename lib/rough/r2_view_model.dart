import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final nameProvider = StateProvider<String>((ref) => 'shayan');
final ageProvider = StateProvider<String>((ref) => '21');

final viewmodelProvider = Provider((ref) => R2ViewModel(ref));

class R2ViewModel {
  R2ViewModel(this.ref);

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
