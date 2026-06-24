import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

//  these are stoarge box where you store the data and must be gloabl
// bcoz if viewModel disappear data will lost that what we want to avoid
final homeTextProvider = StateProvider((ref) {
  return 'riverpod';
});
final appbarTextProvider = StateProvider((ref) {
  return 'appbar';
});
// HomeViewModelProvider = where you provide the HomeViewModel to the screen
final homeViewModelProvider = Provider((ref) => HomeViewModel(ref));

//HomeViewModel = where your logic lives (like onButtonPressed)
class HomeViewModel {
  HomeViewModel(this.ref);

  final Ref ref;

  void onButtonPressed() {
    // read update Ui
    // static text pas here but in real we will pass the newState value here
    ref.read(homeTextProvider.notifier).state = 'wellcome to riverpod world';
    ref.read(appbarTextProvider.notifier).state = 'appbar text change';
  }
}
// flow 
// 1. ref.watch continues chnages detection and rebuilding 
// 2. when we tap button ref.read update global storage box variable values 
// 3. ref.watch detect the new state and rebuld the widget where this variable is used by notifying every widget who use this
// 4. ref.watch read the new value and thus update the widgets automatically
// In one line:
// in one line :Tap → ViewModel updates global storage → Riverpod tells the screen → screen rebuilds with new text.