import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/suggestion.dart';
import '../../provider/userprofileprovider.dart';

class Suggested extends StatelessWidget {
  const Suggested({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileProvider data =
        Provider.of<UserProfileProvider>(context, listen: false);
    List<Suggestion> suggestion = data.suggestion;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: ListView.builder(
        itemCount: suggestion.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 80,
            child: ListTile(
              leading: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    suggestion[index].profileimg,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                suggestion[index].fname,
                style: const TextStyle(
                  fontFamily: 'SfPro',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      suggestion[index].profileimg,
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Followed by ${suggestion[index].fname}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SfPro',
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              trailing: SizedBox(
                width: 90,
                height: 28,
                child: Consumer<UserProfileProvider>(
                  builder: (context, UserProfileProvider, _) {
                    return data.userdata.following
                            .contains(suggestion[index].fname)
                        ? OutlinedButton(
                            onPressed: () {
                              data.alterFollowing(suggestion[index].fname);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
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
                              data.alterFollowing(suggestion[index].fname);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(51, 151, 239, 1)),
                            ),
                            child: const Text(
                              "Follow",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'OpenSans'),
                            ),
                          );
                  },
                  // child: ,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
