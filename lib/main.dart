import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initFirebase();

  await FlutterFlowTheme.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;
  BaseAuthUser? initialUser;
  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();

    userStream = gymstatsFirebaseUserStream()
      ..listen((user) {
        initialUser ?? setState(() => initialUser = user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => setState(() => displaySplashImage = false),
    );
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gymstats',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Builder(
              builder: (context) => Container(
                color: const Color(0xFF7DCB91),
                child: Center(
                  child: Image.asset(
                    'assets/images/renamarket-logo.png',
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : currentUser!.loggedIn
              ? const HubWidget()
              : const CadastroWidget(),
    );
  }
}
