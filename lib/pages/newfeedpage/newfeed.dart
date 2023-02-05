import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../provider/feedprovider.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({super.key});

  @override
  State<NewFeed> createState() => _NewFeedState();
}

class _NewFeedState extends State<NewFeed> {
  bool showfav = false;
  List<int> slider = FeedProvider().newfeeddata.map<int>((e) => 1).toList();
  @override
  Widget build(BuildContext context) {
    FeedProvider data = Provider.of<FeedProvider>(context, listen: false);
    List feedData = data.newfeeddata;

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,

      child: ListView.builder(
        itemCount: feedData.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: index == 0 ? true : false,
                child: const Divider(height: 0),
              ),
              ListTile(
                horizontalTitleGap: 10,
                leading: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      feedData[index].profileImageurl,
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 3),
                      child: Text(
                        feedData[index].fname.toLowerCase(),
                        style: const TextStyle(
                          fontFamily: 'SfPro',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/OfficialIcon.png',
                      width: 14,
                      height: 13,
                    ),
                  ],
                ),
                subtitle: Text(
                  '${feedData[index].city}, ${feedData[index].country}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'SfPro',
                    fontSize: 12,
                  ),
                ),
                trailing: const Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.black,
                  size: 18,
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  InkWell(
                    onDoubleTap: () {
                      if (feedData[index].favorite == false) {
                        setState(() {
                          showfav = true;
                        });
                      }
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          showfav = false;
                        });
                      });

                      data.switchFavorite(index, 'Jazmin');
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CarouselSlider(
                          items:
                              feedData[index].bodyImageurl.map<Widget>((img) {
                            return Image.network(
                              img,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.48,
                              fit: BoxFit.cover,
                            );
                          }).toList(),
                          options: CarouselOptions(
                            onPageChanged: (cindex, reason) {
                              setState(() {
                                slider[index] = cindex + 1;
                              });
                            },
                            enableInfiniteScroll: false,
                            viewportFraction: 1,
                            height: MediaQuery.of(context).size.height * 0.48,
                          ),
                        ),
                        Visibility(
                          visible: showfav,
                          child: Image.asset(
                            '/images/WhiteLike.png',
                            width: 100,
                            height: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible:
                        feedData[index].bodyImageurl.length == 1 ? false : true,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, right: 24),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      height: 25,
                      width: 34,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 43, 41, 41),
                          borderRadius: BorderRadius.circular(13)),
                      child: Text(
                        ' ${slider[index]} / ${feedData[index].bodyImageurl.length}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 216, 210, 210),
                            fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (feedData[index].favorite == false) {
                              setState(() {
                                showfav = true;
                              });
                            }
                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                showfav = false;
                              });
                            });

                            data.switchFavorite(index, 'Jazmin');
                          },
                          child: Consumer<FeedProvider>(
                            builder: (context, FeedProvider, child) {
                              return Image.asset(
                                feedData[index].favorite
                                    ? 'images/LikeShade.png'
                                    : 'assets/images/Like.png',
                                width: 34,
                                height: 30,
                              );
                            },
                            // child: ,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 14),
                          child: Image.asset('assets/images/Shape.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 14),
                          child: Image.asset('assets/images/Messanger.png'),
                        ),
                      ],
                    ),
                    Center(
                      child: Visibility(
                        visible: feedData[index].bodyImageurl.length == 1
                            ? false
                            : true,
                        child: Row(
                          children: feedData[index].bodyImageurl.map<Widget>(
                            (elt) {
                              return Container(
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: slider[index] - 1 ==
                                            feedData[index]
                                                .bodyImageurl
                                                .indexOf(elt)
                                        ? Colors.blue
                                        : Colors.grey[350]),
                                height: 6,
                                width: 5.5,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                    Image.asset('assets/images/Shape1.png')
                  ],
                ),
                // trailing: Image.asset('assets/images/Shape1.png'),
              ),
              FeedBottom(
                feedData: feedData,
                index: index,
              ),
            ],
          );
        },
      ),
      // ),
    );
  }
}

class FeedBottom extends StatelessWidget {
  const FeedBottom({
    Key? key,
    required this.feedData,
    required this.index,
  }) : super(key: key);

  final List feedData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      padding: const EdgeInsets.only(left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<FeedProvider>(
            builder: (context, FeedProvider, child) {
              return Text.rich(
                TextSpan(
                  style: const TextStyle(fontFamily: 'SfPro', fontSize: 12),
                  children: [
                    const TextSpan(text: 'Liked by '),
                    TextSpan(
                      text: feedData[index]
                          .likes[feedData[index].likes.length - 1],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: '${feedData[index].likes.length} others',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(fontFamily: 'SfPro', fontSize: 13),
                children: [
                  TextSpan(
                    text: feedData[index].fname,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' ${feedData[index].discription}',
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'view all ${feedData[index].comments.length} comments',
              style: const TextStyle(
                  fontFamily: 'SfPro',
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
