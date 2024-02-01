import 'package:flutter/material.dart';
import 'package:loccamb/module/auth/presentation/controller/auth_bloc.dart';
import 'package:loccamb/module/auth/presentation/view/login_screen.dart';
import 'package:loccamb/module/home/presentation/controller/home_bloc.dart';
import 'package:loccamb/module/home/presentation/screen/home_screen.dart';
import 'core/services/services_locator.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'module/controller/app_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ServicesLocator().init();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool loggedIn = prefs.getBool('loggedIn') ?? false;
  runApp(MyApp(
    isLoggedIn: loggedIn,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) =>
              AppBloc()
                ..loggedIn(login: isLoggedIn)),
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(sl(), sl())),
          BlocProvider<HomeBloc>(create: (context) => HomeBloc(sl()))
        ],
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: AppBloc
                    .get(context)
                    .isLoggedIn ? HomeScreen() : LoginScreen()
            );
          },
        ));
  }
}
