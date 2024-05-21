import 'package:elections/user/business/model/user/AuthenticateUserRequest.dart';
import 'package:elections/user/business/model/user/CreateUserRequest.dart';
import 'package:elections/user/business/model/user/UpdateUserRequest.dart';
import 'package:elections/user/business/model/user/User.dart';
import 'package:elections/user/business/service/UserNetworkService.dart';
import 'package:elections/utils/db.dart';
import 'package:uuid/uuid.dart';

class UserNetworkServiceImplV1 implements UserNetworkService {
  var bd = db();
  String fichier = 'users.json';

  @override
  Future<String> authenticate(AuthenticateUserRequest data) async {
    var token = Uuid().v1();
    //print(token);
    await Future.delayed(
      Duration(seconds: 1),
    );
    return token;
  }

  @override
  Future confirmResetPasswordOTPCode(data) {
    // TODO: implement confirmResetPasswordOTPCode
    throw UnimplementedError();
  }

  @override
  Future<String> createUser(CreateUserRequest data) async {
    var resp_one = await bd.deleteAll(this.fichier);

    User user = User(
      id: 1,
      name: data.name,
      email: data.email,
      phone: data.phone,
    );

    var resp = await bd.write(user.toJson(), this.fichier);
    print("Create user V1");
    var token = Uuid().v1();
    return Future.value(token);
  }

  @override
  Future<User> getUser(String token) async {
    var resp = await bd.read(this.fichier);

    User user = User();

    if (resp.length > 0) {
      for (var line in resp) {
        if (line["id"] == 1) {
          print(line["phone"]);
          user = User(
            id: line["id"],
            name: line["name"],
            email: line["email"],
            phone: line["phone"],
          );
        }
      }
    }

    return Future.value(user);
  }

  @override
  Future requestPasswordReset(data) {
    // TODO: implement requestPasswordReset
    throw UnimplementedError();
  }

  @override
  Future setNewPassword(data) {
    // TODO: implement setNewPassword
    throw UnimplementedError();
  }

  @override
  Future updatePassword(token, data) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser(String token, UpdateUserRequest data) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
