import 'package:catalog/datamodels/user.dart';

User nelson(){
  return User(
    firstname: "Nelson",
    lastname: "Saake",
    othernames: "Kofi",
    password: "password",
    username: "nelson",
  );
}

User jessica(){
  return User(
    firstname: "Jessica",
    lastname: "Saake",
    othernames: "Abra fafa",
    password: "password",
    username: "jessica",
  );
}

User nana(){
  return User(
    firstname: "nana",
    lastname: "kwame",
    othernames: "",
    password: "password",
    username: "buju",
  );
}

List<User> usersProfiles(){
  return [nelson(), jessica(), nana()];
}