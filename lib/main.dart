import 'package:flutter/cupertino.dart';
import 'package:projectplaystore/pages/androidpage/homepage.dart';
import 'package:projectplaystore/pages/iospage/ihomepage.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'library/source.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: '1',
      channelName: 'pro',
      channelDescription: "channelDescription",
      ledColor: Colors.red,
      playSound: true,
      // soundSource: 'url',
      enableVibration: true,
    )
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return (isIos)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            routes: {
              "/": (context) => const IHomePage(),
              "game_page": (context) => const GamesPage(),
              "app_page": (context) => const AppPage(),
            },
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              "/": (context) => const HomePage(),
              "install_page": (context) => const InstallPage(),
            },
          );
  }
}
