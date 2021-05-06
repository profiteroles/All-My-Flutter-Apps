import 'screens/home.dart';
import 'package:im_rich/screens/tabs.dart';


class Routes {
  static routes() {
    return {
      Home.id: (context) => Home(),
      HomeTabs.id: (context) => HomeTabs(),

      // EndScreen.id: (context) => EndScreen(),
    };
  }

  static initScreen() {
    return HomeTabs.id;
  }
}
