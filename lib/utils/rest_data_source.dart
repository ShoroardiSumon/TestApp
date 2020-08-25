import 'dart:async';
import 'package:test_app/utils/network_util.dart';

class RestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://103.4.145.242:8001/api/";
  static final LOGIN_URL = BASE_URL + "login/examiner";
  static final GET_URL = "https://jsonplaceholder.typicode.com/users";

  Future<dynamic> login(String email, String password) {
    return _netUtil.post(LOGIN_URL,
        body: {"email": email, "password": password}).then((dynamic res) {
      print(res.toString());
      return res;
    });
  }

  Future<dynamic> getData() {
    return _netUtil.get(GET_URL).then((dynamic res) {
      print(res.toString());
      print('object');
      return res;
    });
  }
}
