import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider=StreamProvider<int>((ref) {
  print("CODE IS RUNING HERE");
  return Stream.periodic(const Duration(seconds: 2),((compurationCount)=>compurationCount));
});

class StreamProviderRiverpord extends ConsumerWidget {
  const StreamProviderRiverpord({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final streamData=ref.watch(streamProvider);
    streamData.whenOrNull(data: (data){
      print("CODE IS RUNING HERE $data");
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Provider"),
      ),
      body: streamData.when(data: (data)=>Center(child:Text(data.toString()),),
          error: (error,stackTrace)=>Text(error.toString()),
          loading: ()=>const Center(child: CircularProgressIndicator(),)),

    );
  }
}
