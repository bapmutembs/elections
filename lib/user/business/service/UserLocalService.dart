// TODO: deconnexion user
import 'package:elections/user/business/model/user/User.dart';

abstract class UserLocalService{
  Future<void> saveUser(User user);
  Future<void> saveToken(token);

  Future<User> getUser();
  Future<String?> getToken();

  Future<void> disconnect();


}