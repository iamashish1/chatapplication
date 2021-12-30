import 'package:chatapplication/Auth/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'userprofilepage.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  bool isLoading = false;
  final PageController _pageController = PageController();

  @override
  void initState() {
    isLoading = true;

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Auth>(
      create: (BuildContext context) => Auth(),
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          isLoading
              ? Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.pink,
                    elevation: 0.0,
                    title: Text(
                      'Chat Messenger',
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 20),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                                duration: Duration(microseconds: 200),
                                curve: Curves.easeIn);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: Column(
                    children: [
                      Container(
                        color: Colors.pink,
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.pink[100],
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(EvaIcons.searchOutline),
                              border: InputBorder.none,
                              hintText: 'Search Friends',
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CircleAvatar(
                            maxRadius: 10,
                            backgroundColor: Colors.green[50],
                            child: Text('email'),
                          );
                        },
                        itemCount: 6,
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  maxRadius: 10,
                                  backgroundColor: Colors.pink,
                                ),
                                Text('User' + [index].toString()),
                                IconButton(
                                  icon: Icon(EvaIcons.messageSquare),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          );
                        },
                      )),
                    ],
                  ),
                ),
          UserProfilePage(_pageController),
        ],
      ),
    );
  }
}
