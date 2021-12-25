import 'package:chatapplication/Auth/auth.dart';
import 'package:chatapplication/Helpers/validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return isSignUp
        ? const SignUp()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/brush.png',
                    height: 150,
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Login\n',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w900, fontSize: 40),
                          ),
                          TextSpan(
                              text: 'Please Sign In to Continue',
                              style: GoogleFonts.varelaRound(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FormWidget(isSignUp),
                  const SizedBox(
                    height: 75,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Don\'t have an account ? ',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignUp = true;
                          });
                        },
                        child: Text('Sign Up',
                            style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.w900,
                                color: Colors.deepOrange,
                                fontSize: 20)),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30, top: 30, bottom: 7.5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/fb.png',
                            height: 50,
                            width: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Sign In With Facebook',
                              style: GoogleFonts.montserrat(fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[900]),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 30.0, right: 30, top: 7.5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/go.png',
                            height: 50,
                            width: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Sign In With Google',
                              style: GoogleFonts.montserrat(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[900]),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class FormWidget extends StatefulWidget {
  final bool signUp;
  const FormWidget(this.signUp, {Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 7.5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextFormField(
                controller: _mail,
                validator: (value) {
                  if (!emailValiadtor(value!.trim())) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(EvaIcons.email, color: Colors.black),
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 7.5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                controller: _pass,
                validator: (value) {
                  if (!passwordValiadtor(value!.trim())) {
                    return 'Enter a valid  password';
                  }
                  return null;
                },
                obscureText: isHidden,
                decoration: InputDecoration(
                  prefixIcon: const Icon(EvaIcons.unlock, color: Colors.black),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                      icon: isHidden
                          ? const Icon(EvaIcons.eye, color: Colors.black)
                          : const Icon(EvaIcons.eyeOff, color: Colors.black)),
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                        colors: [Color(0xffff7043), Color(0xfff9a425)])),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Auth().signInWithEmailPassword(
                          _mail.text.trim(), _pass.text.trim());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      // splashFactory: InkRipple.splashFactory,
                      primary: Colors.transparent,
                      minimumSize: const Size(150, 50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const Icon(
                        EvaIcons.arrowForward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
