import 'package:appgain_movies/firebase_options.dart';
import 'package:appgain_movies/pages/movie_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'pages/home_page.dart';
import 'services/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//SHA-256: A4:99:F2:58:F3:C9:1D:88:1E:CA:A0:33:79:6E:82:13:D9:A1:5F:CB:F6:76:71:44:47:2F:EF:EB:2A:17:A3:C7
  await http.get(url);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        MovieDetailsPage.routeName: (context) => MovieDetailsPage(),
      },
    );
  }
}
