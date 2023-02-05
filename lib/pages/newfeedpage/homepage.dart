import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/feedprovider.dart';
import 'instastory.dart';
import 'newfeed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FeedProvider(),
        )
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              height: 3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.86,
              width: double.infinity,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    const SliverAppBar(
                      flexibleSpace: InstaStory(),
                      toolbarHeight: 100,
                      backgroundColor: Colors.white,
                    ),
                  ];
                },
                body: NewFeed(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
