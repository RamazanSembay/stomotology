import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:stomotology/admin_provider/login_auth_provider.dart';
import 'package:stomotology/provider/register_auth_provider.dart';
import 'package:stomotology/provider/send_auth_provider.dart';
import 'package:stomotology/provider/user_provider.dart';
import 'package:stomotology/screens/login_page.dart';
import 'package:stomotology/screens/splash_page.dart';
import 'package:stomotology/widgets/bottom_navigation_tooth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<RegisterAuthPorvider>(
          create: (context) => RegisterAuthPorvider(),
        ),
        ChangeNotifierProvider<SendAuthPorvider>(
          create: (context) => SendAuthPorvider(),
        ),
        ChangeNotifierProvider<AdminAuthProvider>(
          create: (context) => AdminAuthProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BottomNavigationTooth();
            } else {
              return SplashPage(duration: 3, goToPage: LoginPage());
            }
          },
        ),
      ),
    );
  }
}
