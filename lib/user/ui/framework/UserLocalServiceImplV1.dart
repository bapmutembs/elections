import 'package:elections/user/business/model/user/CreateUserRequest.dart';
import 'package:elections/user/business/model/user/UpdateUserRequest.dart';
import 'package:elections/user/business/model/user/User.dart';
import 'package:elections/user/business/service/UserLocalService.dart';
import 'package:elections/user/business/service/UserNetworkService.dart';
import 'package:elections/utils/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalServiceImplV1 implements UserLocalService {
  var bd = db();
  String fichier = 'user.json';

  @override
  Future disconnect() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('phone');

    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    print("Token recuperer");
    return token;
  }

  @override
  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id') ?? -1;
    final name = prefs.getString('name') ?? "";
    final email = prefs.getString('email') ?? "";
    final phone = prefs.getString('phone') ?? "";

    User user = User(
      id: id,
      name: name,
      email: email,
      phone: phone,
    );

    print(user.email);

    return user;
  }

  @override
  Future saveToken(token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    //print("Token sauvegarde : $token");
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', user.id);
    prefs.setString('name', user.name);
    prefs.setString('email', user.email);
    prefs.setString('phone', user.phone);

    await Future.delayed(Duration(seconds: 2));
  }
}
