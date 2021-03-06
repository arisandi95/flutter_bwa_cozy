import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/providers/space_provider.dart';
import 'package:provider/provider.dart';
import 'pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => SpaceProvider(),
      child: MaterialApp(
        home: SplashPage()
      )
    );
    // return MaterialApp(
    //   home: SplashPage()
    // );
  }
}
