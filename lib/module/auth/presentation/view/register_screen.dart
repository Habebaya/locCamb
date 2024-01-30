import 'package:flutter/material.dart';
import 'package:loccamb/module/auth/presentation/controller/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/request_state.dart';
import '../../../home/presentation/screen/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/image/register.jpg'),
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
                      return 'the email doesn’t look valid. Please, check again';
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 4.0),
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
              const SizedBox(
                height: 25,
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.registerState == RequestState.loading) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.registerState == RequestState.loaded) {
                    if (state.registerStatus == '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                            state.registerStatus,
                            )),
                      );
                    }
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (registerFormKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
                            email.text.trim(), password.text.trim()));
                   //   }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1c374d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
