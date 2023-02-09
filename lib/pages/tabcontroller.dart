import 'package:flutter/material.dart';
import 'package:insta_clone/pages/newfeedpage/instastory.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:insta_clone/services/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../provider/userprofileprovider.dart';
import '../provider/feedprovider.dart';
import 'addpage/addpage.dart';
import 'favoritepage/favpage.dart';
import 'newfeedpage/homepage.dart';
import 'searchpage/search.dart';
import 'useraccountpage/useraccountpage.dart';
import 'newfeedpage/instaappbar.dart';

class TabsController extends StatefulWidget {
  const TabsController({super.key});

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  int selectedIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const AddPage(),
    FavPage(),
    UserAccountPage(),
  ];

  changepage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loggedInUser =
        Provider.of<FirebaseAuthMethods>(context, listen: false).user;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedProvider(),
        )
      ],
      child: Scaffold(
        appBar: selectedIndex == 0
            ? const PreferredSize(
                preferredSize: Size.fromHeight(44),
                child: InstaAppBar(),
              )
            : null,
        body: pages[selectedIndex],
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => changepage(0),
                  child: Image.asset(
                    selectedIndex == 0
                        ? 'assets/images/HomeShade.png'
                        : 'assets/images/Home.png',
                    height: 40,
                  ),
                ),
                InkWell(
                  onTap: () => changepage(1),
                  child: Image.asset(
                    selectedIndex == 1
                        ? 'assets/images/SearchShade.png'
                        : 'assets/images/Search.png',
                    height: 40,
                  ),
                ),
                InkWell(
                  onTap: () => changepage(2),
                  child: Image.asset(
                    'assets/images/Add.png',
                    height: 40,
                  ),
                ),
                InkWell(
                  onTap: () => changepage(3),
                  child: Image.asset(
                    selectedIndex == 3
                        ? 'assets/images/FavShade.png'
                        : 'assets/images/Fav.png',
                    height: 40,
                  ),
                ),
                InkWell(
                  onTap: () => changepage(4),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: selectedIndex == 4
                        ? const BoxDecoration(
                            shape: BoxShape.circle,
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.pink,
                                  Colors.purple,
                                  Colors.amber,
                                ],
                              ),
                            ),
                          )
                        : null,
                    child: ClipOval(
                      child: Image.network(
                        const InstaStory().stories[0].imageurl,
                        fit: BoxFit.cover,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   selectedFontSize: 1,
        //   unselectedFontSize: 1,
        //   elevation: 0,
        //   onTap: changepage,
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Image.asset(
        //           selectedIndex == 0
        //               ? 'assets/images/HomeShade.png'
        //               : 'assets/images/Home.png',
        //           height: 40,
        //         ),
        //         label: ''),
        //     BottomNavigationBarItem(
        //         icon: Image.asset(
        //           selectedIndex == 1
        //               ? 'assets/images/SearchShade.png'
        //               : 'assets/images/Search.png',
        //           height: 40,
        //         ),
        //         label: ''),
        //     BottomNavigationBarItem(
        //         icon: Image.asset(
        //           'assets/images/Add.png',
        //           height: 40,
        //         ),
        //         label: ''),
        //     BottomNavigationBarItem(
        //         icon: Image.asset(
        //           selectedIndex == 3
        //               ? 'assets/images/FavShade.png'
        //               : 'assets/images/Fav.png',
        //           height: 40,
        //         ),
        //         label: ''),
        //     BottomNavigationBarItem(
        //         icon: ClipOval(
        //           child: Image.network(
        //             InstaStory().stories[0].imageurl,
        //             fit: BoxFit.cover,
        //             width: 30,
        //             height: 30,
        //           ),
        //         ),
        //         label: '')
        //   ],
        // ),
      ),
    );
  }
}
