import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'apicall/getuserlist.dart';
import 'count_with_statenotifier.dart';
import 'counter_app.dart';
import 'family/multiple_data.dart';
import 'stream_provider/stream_reverpord.dart';
import 'video15/Filteringwithoutrebuild.dart';

final nameProvider = Provider<String>((ref) {
  return "Abhay kumr rai rai SDF SDF";
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FilteringWithOutRebuild(),
    );
  }
}

class MyHomepage extends ConsumerStatefulWidget {
  const MyHomepage({super.key});

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends ConsumerState<MyHomepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final name = ref.read(nameProvider);
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reverpord Toturial"),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}

/*todo----read and watch value with ConsumerWidget
class MyHomepage extends ConsumerWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name=ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Reverpord Toturial"),),
      body:  Center(child: Text("$name"),),
    );
  }
}*/

/*todo----read and watch value with Consumer
*
* class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reverpord Toturial"),),
      body:  Center(child: Consumer(
        builder: (context,ref,child){
          final name=ref.watch(nameProvider);
          return Text(name);
        },
      ),),
    );
  }
}*/

/*todo----read and watch value with ConsumerStateFulWidge
*
* class MyHomepage extends ConsumerStatefulWidget {
  const MyHomepage({super.key});

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends ConsumerState<MyHomepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 final name=ref.read(nameProvider);
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    final name=ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Reverpord Toturial"),),
      body:  Center(child: Text(name),),
    );
  }
}
*
*
* */