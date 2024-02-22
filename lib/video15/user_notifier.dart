import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpordtorurial/video15/user_f.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateAddress(String address) {
    state = state.copyWith(address: address);
  }
}
