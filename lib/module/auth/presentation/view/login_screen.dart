import 'package:flutter/material.dart';
import 'package:loccamb/module/auth/presentation/view/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constant/request_state.dart';
import '../../../home/presentation/screen/home_screen.dart';
import '../controller/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/image/login.jpg'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: email,
                  style: const TextStyle(
                      color: Color.fromRGBO(156, 156, 156, 1), fontSize: 14),
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Color(0xFFFFA400)),
                    errorBorder: UnderlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(width: 2, color: Color(0xFFFFA400)),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(width: 2, color: Color(0xFFFFA400)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18.0, horizontal: 4.0),
                    enabledBorder: UnderlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(width: 2, color: Color(0xFFDDE2E5)),
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: Color(0xFF495057),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email Address';
                    } else {
                      return null;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  style: const TextStyle(
                      color: Color.fromRGBO(156, 156, 156, 1), fontSize: 14),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        _toggle();
                      },
                    ),
                    errorStyle: const TextStyle(color: Color(0xFFFFA400)),
                    errorBorder: const UnderlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(width: 2, color: Color(0xFFFFA400)),
                    ),
                    focusedErrorBorder: const UnderlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(width: 2, color: Color(0xFFFFA400)),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 4.0),
                    enabledBorder: const UnderlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(width: 2, color: Color(0xFFDDE2E5)),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                        color: Color(0xFF495057),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty && value.length < 6) {
                      return 'Please use at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25,),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state)async  {
                  if (state.loginState == RequestState.loading) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.loginState == RequestState.loaded) {
                    if (state.loginStatus == "") {
                      print(state.loginStatus);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),

                      );
                      SharedPreferences prefs = await SharedPreferences.getInstance();

                      Future<bool> loggedIn = prefs.setBool('loggedIn', true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                              state.loginStatus,
                            )),
                      );
                    }
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async{
                       // await FirebaseAuth.instance.signOut();

                      // if (loginFormKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                          email.text.trim(), password.text.trim()));
                        // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1c374d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                      "Don't have an account  ",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0XFF959B9F))),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                    },
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text:"Sign up",
                            style: TextStyle(
                                color: Color(0XFF959B9F),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                decoration: TextDecoration
                                    .underline,
                                fontSize: 12),


                           ),
                      ]),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
