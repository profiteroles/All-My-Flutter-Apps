import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:space_cube/application/storage/local_storage_impl.dart';
import 'package:space_cube/screens/auth/profile_controller.dart';
import 'package:space_cube/screens/home/home_controller.dart';
import 'package:space_cube/widgets/material_button.dart';

class ProfilePage extends StatelessWidget {
  // final controller = Get.find<HomeController>();

  // void logout() {
  //   controller.logout();
  // }

  @override
  Widget build(BuildContext context) {
    // final user = controller.user!.value;
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(''),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "user.name",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Text(
                            'Your Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                JukeMaterialBtn(height: 20, title: 'Log Out', onPressed: () {}),
                // ElevatedButton(
                //     onPressed: () => LocalStorageImpl().clearAllData(),
                //     child: Padding(
                //       padding: const EdgeInsets.all(12.0),
                //       child: Text('Log Out'),
                //     ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
