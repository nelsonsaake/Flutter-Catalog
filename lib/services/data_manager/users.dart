import 'package:catalog/datamodels/user.dart';

class Users {
  Map<int, User> _users = Map<int, User>();

  String errUniqueConstraintViolated = "unique constraint violated";
  String errRecordDoesNotExist = "record does not exist";

  User create(User newUser) {
    _users.forEach((id, user) {
      if (user.username == newUser.username) {
        throw errUniqueConstraintViolated;
      }
    });

    var id = _users.length;

    newUser.id = id;

    _users[id] = newUser;

    return newUser;
  }

  User? retrieve({required String username, required String password}) {
    User? user;

    _users.forEach((id, userX) {
      if (userX.username == username && userX.password == password) {
        user = userX;
        return;
      }
    });

    return user;
  }

  void update(int id, User user) {}

  void delete() {}
}
