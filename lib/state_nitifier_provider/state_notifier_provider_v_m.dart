import 'package:flutter_riverpod/legacy.dart';

final stateNotifierProviderViewModelProvider =
    // this notifier manage a state of type string
    // we can manage multiple state
    // String represent the type of state we are managing so ow state is type sting
    // it may be something else like int, bool, etc.
    StateNotifierProvider<StateNotifierProviderExampleViewModel, MultiState>((
      ref,
    ) {
      return StateNotifierProviderExampleViewModel();
    });

class StateNotifierProviderExampleViewModel extends StateNotifier<MultiState> {
  StateNotifierProviderExampleViewModel()
    : super(MultiState(displayText: '', isOn: false, isTextVisible: false));
  /*
  //
  //
  // this is the old way to update the state using one one state now switch to multiple from class
  //
  //
  void displayText(String inputText) {
    // satte is string so the value comming from textfield is string
    //so we can assign it to state and then dislaying on screen
    state = inputText;
  }*/

  //
  // new way
  //
  void displayText(String inputText) {
    // satte is string so the value comming from textfield is string
    //so we can assign it to state and then dislaying on screen
    state = state.copyWith(displayText: inputText);
    print('display text callled');
  }

  ///
  ///  for switch button
  ///
  void ischnage(bool isOn) {
    state = state.copyWith(isOn: isOn);
    print('is change callled');
  }

  ///
  /// text filed visibility
  ///
  void isVisiable(bool isTextVisible) {
    state = state.copyWith(isTextVisible: isTextVisible);
    print('text field visibility callled');
  }
}

///
/// for handling multiple state
///
class MultiState {
  final String? displayText;
  final bool isOn;
  final bool isTextVisible;
  // constructor
  MultiState({
    required this.displayText,
    required this.isOn,
    required this.isTextVisible,
  });
  // copyWith create new object with new values and do not change old object values
  MultiState copyWith({String? displayText, bool? isOn, bool? isTextVisible}) {
    return MultiState(
      displayText: displayText ?? this.displayText,
      isOn: isOn ?? this.isOn,
      isTextVisible: isTextVisible ?? this.isTextVisible,
    );
  }
}
