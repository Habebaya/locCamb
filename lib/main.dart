import 'package:flutter/material.dart';
import 'package:loccamb/module/auth/presentation/controller/auth_bloc.dart';
import 'package:loccamb/module/auth/presentation/view/login_screen.dart';
import 'package:loccamb/module/home/presentation/controller/home_bloc.dart';
import 'package:loccamb/module/home/presentation/screen/home_screen.dart';
import 'core/services/services_locator.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  await ServicesLocator().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(sl(),sl())),
          BlocProvider<HomeBloc>(create: (context) => HomeBloc(sl()))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        ));
  }
}
