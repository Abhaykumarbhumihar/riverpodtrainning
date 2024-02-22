import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class Counterapp extends ConsumerWidget {
  const Counterapp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    /*todo---if i want listen if provider value change then use it*/
    ref.listen(counterProvider, (previous, next) {
      print(previous);
      print(next);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("State Provider"),
        actions: [
          IconButton(
              onPressed: () {
                /*todo---way 1 for refresh*/
                // ref.invalidate(counterProvider);
                /*todo---way 2 for refresh*/
                ref.refresh(counterProvider);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*todo---way 1 for update value*/
          //ref.read(counterProvider.notifier).state++;

          /*todo---way 2 for update value*/
          ref.read(counterProvider.notifier).update((state) {
            return state + 2;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*stateNotifierProvider*/