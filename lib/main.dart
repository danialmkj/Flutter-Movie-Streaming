import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_player/screens/dashboard.dart';
import 'package:movie_player/utils/my_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //for Hide Navigation Bar user below code 
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    
    SystemUiOverlayStyle mySystemTheme = SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: MyColor.primary_dark);
    
    //For change color Navigation Bar user below code 
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        scaffoldBackgroundColor: Color(0xff09090F),
      ),
      home: DashboardScreen(),
    );
  }
}
