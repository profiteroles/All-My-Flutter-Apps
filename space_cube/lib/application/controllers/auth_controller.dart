// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class AuthController extends GetxController {
//   final box = GetStorage().obs;
//   var authenicated = false.obs;

//   AuthController() {
//     authenicated(box.value.read('auth'));
//   }

//   login(email, password) {
//     // ignore: prefer_typing_uninitialized_variables
//     var users;
//     users = box.value.read('users') ?? [];
//     users = jsonDecode(users.toString());

//     var index = -1;
//     for (var i = 0; i < users.length; i++) {
//       if (users[i]['email'] == email && users[i]['password'] == password) {
//         authenicated(true);
//         index = i;
//         break;
//       }
//     }
//     if (index != -1) box.value.write("auth", authenicated.value ? users[index]['id'] : null);
//     return authenicated.value;
//   }

//   signUp(email, password) {
//     var users;
//     users = box.value.read("users") ?? [];
//     users = jsonDecode(users.toString());
//     var user = {"id": users.length, "email": email, "password": password};
//     users.add(user);
//     box.value.write("users", jsonEncode(users));
//     box.value.write("auth", user["id"]);
//     authenicated(true);
//   }

//   logout() {
//     box.value.write('auth', null);
//     authenicated(false);
//   }
// }
