import 'package:chatapplication/Auth/auth.dart';
import 'package:chatapplication/FireStroreRepo/datarepository.dart';
import 'package:chatapplication/Screens/privatechat.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
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
    return StreamBuilder(
        stream: DataRepository().getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Builder(builder: (context) {
              return PageView(
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
                            backgroundColor: Colors.deepOrange,
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
                                color: Colors.deepOrange,
                                width: double.infinity,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.amber[50],
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
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withOpacity(0.1),
                                        Colors.deepOrange.withOpacity(0.2),
                                      ]),
                                ),
                                height: 100,
                                child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return (index == 0)
                                        ? Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: CircleAvatar(
                                              maxRadius: 40,
                                              backgroundColor:
                                                  Colors.yellow[900],
                                              child: Icon(
                                                EvaIcons.plus,
                                                color: Colors.white,
                                                size: 35,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: CircleAvatar(
                                              maxRadius: 30,
                                              backgroundColor: Colors.black,
                                            ),
                                          );
                                  },
                                ),
                              ),
                              Expanded(
                                  child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PrivateChat()));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            maxRadius: 30,
                                            backgroundColor: Colors.grey,
                                          ),
                                          Spacer(),
                                          Text('Deepak Batala',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18)),
                                          Spacer(),
                                          IconButton(
                                            icon: Icon(
                                              EvaIcons.messageCircleOutline,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )),
                            ],
                          ),
                        ),
                  UserProfilePage(_pageController),
                ],
              );
            });
          }
          return CircularProgressIndicator();
        });
  }
}
