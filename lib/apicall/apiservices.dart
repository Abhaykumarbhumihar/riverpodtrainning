import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'getuserlist.dart';
import 'usermodel.dart';

class ApiService {
  String endPoint = "https://reqres.in/api/users?";

  Future<UserModel> getUser() async {

    Response response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return UserModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
