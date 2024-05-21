

import 'package:elections/user/business/model/user/AuthenticateUserRequest.dart';
import 'package:elections/user/business/model/user/CreateUserRequest.dart';
import 'package:elections/user/business/model/user/UpdateUserRequest.dart';
import 'package:elections/user/business/model/user/User.dart';

abstract class UserNetworkService{
  Future<String> createUser(CreateUserRequest data);
  Future<User> getUser(String token);
  Future<bool> updateUser(String token,UpdateUserRequest data);
  Future<String> authenticate(AuthenticateUserRequest data);
  Future<dynamic> updatePassword(token, data);
  Future<dynamic> requestPasswordReset(data);
  Future<dynamic> confirmResetPasswordOTPCode(data);
  Future<dynamic> setNewPassword(data);
}