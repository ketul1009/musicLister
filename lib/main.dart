import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_lister/AppPages/ViewPlaylist.dart';
import 'package:music_lister/Models/Playlist.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppPages/CreatePlaylist.dart';
import 'AppPages/HomePage.dart';
import 'AppPages/LoginPage.dart';
import 'AppPages/SignUpPage.dart';

Set<Playlist> playlists = {};

Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var session = prefs.getBool("session");
  debugPrint(session.toString());
  final GoRouter router = GoRouter(
    initialLocation: session == true ? '/home' : '/',
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      GoRoute(
          name: 'login',
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          }
      ),
      GoRoute(
          name: 'signup',
          path: '/signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpPage();
          }
      ),
      GoRoute(
          name: 'home',
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          }
      ),
      GoRoute(
          name: 'create',
          path: '/create',
          builder: (BuildContext context, GoRouterState state) {
            return CreatePlaylistPage();
          }
      ),
      GoRoute(
          name: 'view',
          path: '/view',
          builder: (BuildContext context, GoRouterState state) {
            return const ViewPlaylist();
          }
      ),
    ],
  );
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  runApp(
    ChangeNotifierProvider<PlaylistProvider>(
      create: (context) => PlaylistProvider(Playlist("", [])),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Stock Trading App',
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
      ),
    ),
  );
}