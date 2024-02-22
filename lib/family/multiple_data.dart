import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user.dart';


final multifamilyProvider=Provider.family<String,User>((ref,user){
  return "Hello ${user.name} ${user.address}";
});


class MutliFamily extends ConsumerWidget {
  const MutliFamily({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name=ref.watch(multifamilyProvider(User("Abhay", "Mohali")));
    return Scaffold(
      appBar: AppBar(title: const Text("Multi Family"),),
      body:  Center(child: Text(name),),
    );
  }
}


