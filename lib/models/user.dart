class User {
  late int id;
  late String username;
  late String password;

  User(this.username, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'username': username,
      'password': password,
    };
    map['id'] = id;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    username = map['username'] as String;
    password = map['password'] as String;
  }
}
