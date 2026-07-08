import 'package:firebase/book/features/auth/screens/login_email.dart';
import 'package:firebase/features/auth/cubit/auth_cubit_cubit.dart';
import 'package:firebase/features/auth/page/login_screen.dart';
import 'package:firebase/features/auth_post/cubit/auth_post_cubit.dart';
import 'package:firebase/features/auth_post/pages/auth_qilish.dart';
import 'package:firebase/features/auth_post/repo/auth_post_repo.dart';
import 'package:firebase/features/repositories/auth_repositories.dart';
import 'package:firebase/features/uyvazifa/cubit/user_cubit.dart';
import 'package:firebase/features/uyvazifa/pages/users_page.dart';
import 'package:firebase/features/uyvazifa/repositories/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// O'zingizning loyihadagi fayllaringizga yo'nalishlar (Relative imports)

import 'app_pages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => AuthCubitCubit(
              repository: AuthService(firebaseAuth: FirebaseAuth.instance),
            ),
            child: const LoginScreen(),
            
          ),
          
        );
       case AppPages.users:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => UserCubit(
              repository: UserRepository(),
            ),
            child: const UsersPage(),
            
          ),
          
        );
        
      case AppPages.authPost:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => AuthPostCubit(
              repository: AuthPostRepo(),
            ),
            child: const AuthQilish(),
          ),
        );
        case AppPages.loginEmail:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginEmail(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Sahifa topilmadi!')),
          ),
        );
        
    }
  }
  

}
