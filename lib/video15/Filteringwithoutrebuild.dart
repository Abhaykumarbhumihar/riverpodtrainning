import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpordtorurial/video15/user_f.dart';
import 'package:reverpordtorurial/video15/user_notifier.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(const User("Abhay", "kumar"));
});

class FilteringWithOutRebuild extends ConsumerWidget {
  const FilteringWithOutRebuild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build method is called");
    final user = ref.watch(userProvider);
    //final user = ref.watch(userProvider.select((value) => value.name));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtering without Rebuild"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) =>  ref.read(userProvider.notifier).updateName(value),
              onSubmitted: (value) =>
                  ref.read(userProvider.notifier).updateName(value),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              onSubmitted: (value) =>
                  ref.read(userProvider.notifier).updateAddress(value),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(user.name + " " + user.address),
            const SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
