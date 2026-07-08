import 'package:firebase/book/features/explore/explore_screen.dart';
import 'package:firebase/book/features/home/book_detail.dart';
import 'package:firebase/book/features/home/home_screen.dart';
import 'package:firebase/book/features/home/mail_shell.dart';
import 'package:firebase/book/features/home/player.dart';
import 'package:firebase/book/features/libary/libary_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Ekranlar fayllarini import qiling
// import 'screens/main_shell_screen.dart';
// import 'screens/home_screen.dart';
// import 'screens/book_detail_screen.dart';
// import 'screens/player_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _exploreNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _libraryNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
     
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellScreen(navigationShell: navigationShell);
        },
        branches: [
          // 1-Tab: Home Branch
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'book-detail/:bookId',
                    builder: (context, state) {
                      final bookId = state.pathParameters['bookId'] ?? '';
                      return BookDetailScreen(bookId: bookId);
                    },
                  ),
                ],
              ),
            ],
          ),
          
          StatefulShellBranch(
            navigatorKey: _exploreNavigatorKey,
            routes: [
              GoRoute(
                path: '/explore',
                builder: (context, state) => const ExploreScreen(),
              ),
            ],
          ),
      
          StatefulShellBranch(
            navigatorKey: _libraryNavigatorKey,
            routes: [
              GoRoute(
                path: '/library',
                builder: (context, state) => const LibraryScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/player',
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: PlayerScreen(),
        ),
      ),
    ],
  );
}