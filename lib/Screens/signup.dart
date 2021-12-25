import 'package:chatapplication/Auth/auth.dart';
import 'package:chatapplication/Helpers/validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    return isSignIn
        ? const SignIn()
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
                            text: 'Sign Up\n',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w900, fontSize: 40),
                          ),
                          TextSpan(
                              text: 'Please Sign Up to Continue',
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
                  const FormWidget(),
                  const SizedBox(
                    height: 75,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Already have an account ? ',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignIn = true;
                          });
                        },
                        child: Text('Sign in',
                            style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.w900,
                                color: Colors.deepOrange,
                                fontSize: 20)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool isHidden = true;
  bool isHidden1 = true;
  final _formKey = GlobalKey<FormState>();
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
                validator: (value) {
                  if (value!.trim().length > 3) {
                    return null;
                  }
                  return 'Need more than three characters';
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(EvaIcons.person, color: Colors.black),
                  border: InputBorder.none,
                  hintText: 'Full Name',
                  errorStyle: GoogleFonts.montserrat(
                      color: Colors.amber, fontStyle: FontStyle.italic),
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 15, right: 15, bottom: 7.5, top: 7.5),
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
                validator: (value) {
                  if (!emailValiadtor(value!.trim())) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                controller: _mail,
                decoration: InputDecoration(
                  prefixIcon: const Icon(EvaIcons.email, color: Colors.black),
                  border: InputBorder.none,
                  hintText: 'Email',
                  errorStyle: GoogleFonts.montserrat(
                      color: Colors.amber, fontStyle: FontStyle.italic),
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 15, right: 15, top: 7.5, bottom: 7.5),
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
                validator: (value) {
                  if (!passwordValiadtor(value!.trim())) {
                    return 'Enter a valid  password';
                  }
                  return null;
                },
                controller: _pass,
                obscureText: isHidden,
                decoration: InputDecoration(
                  errorStyle: GoogleFonts.montserrat(
                      color: Colors.amber, fontStyle: FontStyle.italic),
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
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 7.5),
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
                obscureText: isHidden1,
                validator: (value) {
                  if (value!.trim() == _pass.text.trim()) {
                    return null;
                  }
                  return 'Enter a matching  password';
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isHidden1 = !isHidden1;
                        });
                      },
                      icon: isHidden1
                          ? const Icon(EvaIcons.eye, color: Colors.black)
                          : const Icon(EvaIcons.eyeOff, color: Colors.black)),
                  prefixIcon: const Icon(EvaIcons.unlock, color: Colors.black),
                  border: InputBorder.none,
                  hintText: 'Confirm Password',
                  errorStyle: GoogleFonts.montserrat(
                      color: Colors.amber, fontStyle: FontStyle.italic),
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w900),
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
                      Auth().createUserWithEmailAndPassword(
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
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 20),
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
