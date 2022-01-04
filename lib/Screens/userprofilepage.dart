import 'package:chatapplication/Auth/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfilePage extends StatefulWidget {
  final PageController _pageController;

  const UserProfilePage(this._pageController, {Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            ))
          : Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.longestSide * 0.1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        EvaIcons.arrowIosBack,
                      ),
                      onPressed: () {
                        widget._pageController.previousPage(
                            duration: Duration(milliseconds: 220),
                            curve: Curves.easeInOut);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.shortestSide *
                                  0.3,
                              width: MediaQuery.of(context).size.shortestSide *
                                  0.3,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue[900],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Ashish Koirala',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                          minimumSize: Size(double.infinity, 65)),
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 1), () async {
                          Auth().signOut();
                          _isLoading = false;
                        });
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            ),
    );
  }
}
