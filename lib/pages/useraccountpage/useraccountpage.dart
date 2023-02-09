import 'package:flutter/material.dart';
import 'package:insta_clone/provider/userprofileprovider.dart';
import 'package:insta_clone/services/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../models/userprofile.dart';
import './discover.dart';
//import '../favPage.dart';

class UserAccountPage extends StatefulWidget {
  UserAccountPage({super.key});

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    UserProfileProvider data =
        Provider.of<UserProfileProvider>(context, listen: false);
    UserProfile myaccount = data.userdata;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 44,
        title: Text(myaccount.username,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: 'SfPro',
                fontWeight: FontWeight.bold)),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 18),
              width: 24,
              height: 24.5,
              child: Image.asset('assets/images/Camera.png')),
          Container(
              margin: const EdgeInsets.only(right: 18),
              width: 24,
              height: 24.5,
              child: Image.asset('assets/images/Messanger.png')),
          Container(
            margin: const EdgeInsets.only(right: 18),
            width: 24,
            height: 24.5,
            child: InkWell(
              onTap: () {
                FirebaseAuthMethods().signOut(context);
              },
              child: Image.asset('assets/images/Menu.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.89,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  flexibleSpace: Column(
                    children: [
                      UserProfileInfo(),
                      DiscoverPeople(),
                      Container(
                        height: 44,
                        margin: const EdgeInsets.only(top: 4),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => controller.jumpTo(1),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: selectedIndex == 0
                                    ? Image.asset('assets/images/GridIcon.png')
                                    : Image.asset(
                                        'assets/images/GridIconFade.png'),
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.jumpToPage(2),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: selectedIndex == 1
                                    ? Image.asset(
                                        'assets/images/TagsIconShade.png')
                                    : Image.asset('assets/images/TagsIcon.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 1.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: selectedIndex == 0
                                ? const Color.fromRGBO(26, 26, 26, 1)
                                : Colors.white,
                          ),
                          Container(
                            height: 1.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: selectedIndex == 1
                                ? const Color.fromRGBO(26, 26, 26, 1)
                                : Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                  toolbarHeight: 525,
                  backgroundColor: Colors.white,
                ),
              ];
            },
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: [
                  GridView.builder(
                    itemCount: myaccount.posts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Image.network(
                        myaccount.posts[index],
                        width: 124,
                        height: 124,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/images/TagsIconShade.png',
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              "Photos and videos of you",
                              style: TextStyle(
                                  fontFamily: 'SfPro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 220,
                            child: Text(
                              "When people tag you in photos and videos, they'll appear here.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SfPro',
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileProvider data =
        Provider.of<UserProfileProvider>(context, listen: false);
    UserProfile myaccount = data.userdata;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 96,
                width: 96,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromRGBO(199, 199, 204, 1), width: 2),
                ),
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      myaccount.profileImage,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          myaccount.posts.length.toString(),
                          style: const TextStyle(
                              fontFamily: 'SfPro',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text('Posts')
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          myaccount.follower.length.toString(),
                          style: const TextStyle(
                              fontFamily: 'SfPro',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text('Follower')
                      ],
                    ),
                    Consumer<UserProfileProvider>(
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Text(
                              myaccount.following.length.toString(),
                              style: const TextStyle(
                                  fontFamily: 'SfPro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text('Following'),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                width: double.infinity,
                child: Text(
                  '${myaccount.username} Abera',
                  style: const TextStyle(
                      fontFamily: 'SfPro',
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 250,
                  child: Text(
                    myaccount.bio,
                    style: const TextStyle(fontSize: 12, fontFamily: 'SfPro'),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: OutlinedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            onPressed: () {},
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                  color: Color.fromRGBO(38, 38, 38, 1),
                  fontSize: 13,
                  fontFamily: 'SfPro',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
