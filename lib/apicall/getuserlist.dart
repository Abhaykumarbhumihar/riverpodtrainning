import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpordtorurial/apicall/apiservices.dart';
import 'package:reverpordtorurial/apicall/usermodel.dart';
import 'package:flutter/material.dart';

final apiLoadingProvider = StateNotifierProvider<ApiState, bool>((ref) {
  return ApiState();
});
final apiProvider = Provider<ApiService>((ref) {
  return ApiService();
});


final userDataProvider = FutureProvider<UserModel>((ref) {
 // ref.read(apiLoadingProvider.notifier).setLoading(false);
  //ref.read(apiLoadingProvider.notifier).setLoading(false);
  final userData=ref.read(apiProvider).getUser();
  //ref.read(apiLoadingProvider.notifier).setLoading(true);
 // ref.read(apiLoadingProvider.notifier).state=true;// Set loading to false
  return userData;
});

class UserlistPage extends ConsumerWidget {
  const UserlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final userData = ref.watch(userDataProvider);
var isLoading=ref.watch(apiLoadingProvider.notifier).state;

print("$isLoading check here");
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List With Api & FutureProvider"),
      ),
      body: Expanded(
          child:
          isLoading==true?CircularProgressIndicator():   ListView.separated(
            itemCount: userData.asData?.value.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  title: Text(userData.asData?.value.data?[index].firstName??"" +" "+"${userData.asData?.value.data?[index].lastName}"??""),
                  subtitle: Text(userData.asData?.value.data?[index].email??""),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                    child: Image.network(userData.asData?.value.data?[index].avatar??""),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider(
                color: Colors.red,
              );
            },
          )),
    );
  }
}


class ApiState extends StateNotifier<bool> {
  ApiState() : super(false);

  void setLoading(bool loading) {
    state = loading;
  }


}