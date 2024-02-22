import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpordtorurial/counter_demo.dart';

final counterProvider = StateNotifierProvider<CounterDemo, int>((ref) {
  return CounterDemo();
});

class CounterTwo extends ConsumerWidget {
  const CounterTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Provider"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text("$count"),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              child: const Icon(Icons.minimize),
            )
          ],
        ),
      ),
    );
    ;
  }
}
