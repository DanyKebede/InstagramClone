import 'package:flutter/material.dart';
import 'package:insta_clone/provider/userprofileprovider.dart';
import 'package:provider/provider.dart';

import '../../models/suggestion.dart';

class DiscoverPeople extends StatelessWidget {
  const DiscoverPeople({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileProvider data =
        Provider.of<UserProfileProvider>(context, listen: false);
    List<Suggestion> discoverdata = data.suggestion;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Discover people',
                style: TextStyle(
                    fontFamily: 'SfPro',
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'see All',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: 180,
            width: double.infinity,
            child: Consumer<UserProfileProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: discoverdata.length,
                  itemBuilder: ((context, index) {
                    return Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            margin: index == 0
                                ? const EdgeInsets.only(left: 15, right: 5)
                                : const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 10, left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromARGB(96, 139, 139, 139),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: 130,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 3),
                                  width: 60,
                                  height: 60,
                                  child: ClipOval(
                                    child: CircleAvatar(
                                      child: Image.network(
                                        discoverdata[index].profileimg,
                                        fit: BoxFit.cover,
                                        width: 90,
                                        height: 90,
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    discoverdata[index].fname,
                                    style: const TextStyle(
                                        fontFamily: 'SfPro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    'Followed by  ${data.userdata.follower[index]}',
                                    style: const TextStyle(
                                        fontFamily: 'SfPro',
                                        fontSize: 12,
                                        color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const Spacer(),
                                Consumer<UserProfileProvider>(
                                  builder:
                                      (context, UserProfileProvider, child) {
                                    return SizedBox(
                                      width: 100,
                                      height: 26,
                                      child: data.userdata.following.contains(
                                              discoverdata[index].fname)
                                          ? OutlinedButton(
                                              onPressed: () {
                                                data.alterFollowing(
                                                    discoverdata[index].fname);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith((states) =>
                                                            Colors.white),
                                              ),
                                              child: const Text(
                                                "Following",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'SfPro',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )
                                          : OutlinedButton(
                                              onPressed: () {
                                                data.alterFollowing(
                                                    discoverdata[index].fname);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith((states) =>
                                                            const Color
                                                                    .fromRGBO(
                                                                51,
                                                                151,
                                                                239,
                                                                1)),
                                              ),
                                              child: const Text(
                                                "Follow",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: 'SfPro',
                                                ),
                                              ),
                                            ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 4, right: 7),
                            child: const Icon(
                              Icons.clear,
                              color: Color.fromARGB(255, 107, 107, 107),
                              size: 20,
                            ),
                          )
                        ]);
                  }),
                );
              },
            )),
      ],
    );
  }
}
