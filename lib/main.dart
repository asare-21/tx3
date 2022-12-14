import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/providers/background_music_provider.dart';
import 'package:tic_tac_toe/providers/player_move_provider.dart';
import 'package:tic_tac_toe/providers/socket_provider.dart';
import 'package:tic_tac_toe/providers/user_provider.dart';
import 'package:tic_tac_toe/screens/home_page.dart';
import 'package:tic_tac_toe/screens/game_page.dart';
import 'package:tic_tac_toe/screens/select_game.dart';
import 'package:tic_tac_toe/screens/sign_in_or_create.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => BackgroundMusicProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MoveProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SocketProvider(),
    )
  ], child: const MyApp()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tx3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffedffe9),
        appBarTheme: const AppBarTheme(
          color: Color(0xffedffe9),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
      initialRoute: "/auth",
      routes: {
        "/": (context) => const HomePageScreen(),
        "/auth": (context) => const SignInOrCreate(),
        "/select-game": (context) => const SelectGameScreen(),
        "/game": (context) => const GameScreen(),
      },
    );
  }
}
