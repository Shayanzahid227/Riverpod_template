import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final sliderProvider = StateProvider((ref) {
  return 0.0;
});
final visabliltyProvider = StateProvider((ref) {
  return false;
});
// make the acces to the view model from the screen also global
final sliderViewModel = Provider((ref) => SliderViewModel(ref));

class SliderViewModel {
  SliderViewModel(this.ref);

  final Ref ref;
  final sliderViewModelProvider = Provider((ref) {
    return SliderViewModel(ref);
  });
  void onSliderChanged(double value) {
    ref.read(sliderProvider.notifier).state = value;
  }

  void visablilty(bool isVisible) {
    ref.read(visabliltyProvider.notifier).state = isVisible;
  }
}
