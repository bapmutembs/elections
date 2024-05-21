
class AuthenticateUserRequest{
  String username;
  String password;

  AuthenticateUserRequest({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };

}