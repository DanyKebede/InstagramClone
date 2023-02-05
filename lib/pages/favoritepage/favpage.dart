import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/feedprovider.dart';

import './suggestion.dart';

class FavPage extends StatelessWidget {
  FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'SfPro',
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  flexibleSpace: Column(
                    children: const [
                      TodaysNotification(),
                    ],
                  ),
                  toolbarHeight: 210,
                  backgroundColor: Colors.white,
                ),
              ];
            },
            body: const Suggested(),
          ),
        ),
      ),
    );
  }
}

class TodaysNotification extends StatelessWidget {
  const TodaysNotification({super.key});

  @override
  Widget build(BuildContext context) {
    List data = Provider.of<FeedProvider>(context, listen: false).newfeeddata;
    return Column(
      children: [
        const Divider(
          height: 3,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 14),
          margin: const EdgeInsets.symmetric(vertical: 13),
          child: const Text(
            "Today",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Stack(
                  children: [
                    CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          data[0].bodyImageurl[2],
                          fit: BoxFit.cover,
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 8,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image.network(
                              data[0].profileImageurl,
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 13),
                    children: [
                      TextSpan(
                        text: data[0].likes[0],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: ', ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: data[0].likes[1],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: '${data[0].likes.length} others',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: ' Liked your photo.'),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              FittedBox(
                child: Image.network(
                  data[0].bodyImageurl[0],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 14, top: 8, right: 14, bottom: 4),
          child: Row(
            children: [
              CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    data[1].bodyImageurl[2],
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              const SizedBox(width: 22),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 13),
                    children: [
                      TextSpan(
                        text: data[0].fname,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: ' started following you.'),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 90,
                height: 28,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  child: const Text(
                    "Message",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SfPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 3,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 14),
          margin: const EdgeInsets.symmetric(vertical: 11),
          child: const Text(
            "Suggested for you",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
