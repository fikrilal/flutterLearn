import 'package:flutter/material.dart';
import 'package:minggu1/screens/login_view.dart';
import 'package:minggu1/screens/register_view.dart';
import './screens/home.dart';
import './screens/create.dart';
import './screens/details.dart';
import './screens/edit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login Register Page",
    initialRoute: "/",
    routes: {
      // "/": (context) => LoginPage(),
      "/": (context) => Home(),
      "/create": (context) => Create(
            refreshStudentList: null,
          ),
      // "/details": (context) => Details(),
      // "/edit": (context) => Edit(),
    },
  ));
}


// routes: {
//       "/": (context) => LoginPage(),
//       RegisterPage.routeName: (context) => RegisterPage(),
//     },