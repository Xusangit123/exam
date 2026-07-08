// import 'package:firebase/book/features/auth/screens/login_email.dart';
// import 'package:firebase/core/routes/app_pages.dart';
// import 'package:firebase/core/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:toastification/toastification.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();  
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ToastificationWrapper(
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         themeMode: ThemeMode.light,
//         // onGenerateRoute: RouteGenerator.generateRoute,
//         // initialRoute: AppPages.loginEmail,
//         home: const LoginEmail()

//       ),
//     );
//   }
// }

import 'package:firebase/book/core/routes/nav_routes.dart';
import 'package:firebase/book/features/auth/screens/forgot_password.dart';
import 'package:firebase/book/features/auth/screens/forgot_password_verify.dart';
import 'package:firebase/book/features/auth/screens/login_email.dart';
import 'package:firebase/book/features/auth/screens/login_password.dart';
import 'package:firebase/book/features/auth/screens/set_password.dart';
import 'package:firebase/book/features/auth/screens/sing_up.dart';
import 'package:firebase/book/features/home/mail_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routerConfig: AppRouter.router
    );
  }
}



