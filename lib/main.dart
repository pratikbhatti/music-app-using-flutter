import 'package:flutter/material.dart';
import 'package:media_booster/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:media_booster/Screens/HomeScreen/view/HomePage.dart';
import 'package:media_booster/Screens/HomeScreen/view/SongViewPage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      ),
    ],
    child: Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => HomePage(),
            'SongView': (context) => SongViewPage(),
          },
        );
      },
    ),
  ));
}
