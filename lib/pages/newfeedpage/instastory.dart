import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../models/story.dart';

class InstaStory extends StatelessWidget {
  const InstaStory({super.key});

  final List<Story> stories = const [
    Story(
      fname: 'your story',
      imageurl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2K9xcJVlIG31wI5COY_Qep5GahOMmCmLYEQ&usqp=CAU',
    ),
    Story(
      fname: 'Abebe',
      imageurl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq7dDqaApR0N2jhw8SQglWnx41KEY1P1D1cg&usqp=CAU',
    ),
    Story(
      fname: 'kebede',
      imageurl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe0uFjmYSu-eG7UEYyIRAiGmTCZNxDk3iygA&usqp=CAU',
    ),
    Story(
      fname: 'Japi',
      imageurl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGmr4TL9v_2oun80IJqmUAfl2DKysnL6NA0w&usqp=CAU',
    ),
    Story(
      fname: 'Yo-Yo',
      imageurl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU',
    ),
    Story(
      fname: 'kingz',
      imageurl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXPftt6heWX3xiJQgRST_qYIEfVvTCBA3lgg&usqp=CAU',
    ),
    Story(
      fname: 'Abebe',
      imageurl:
          'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?cs=srgb&dl=pexels-italo-melo-2379004.jpg&fm=jpg',
    ),
    Story(
      fname: 'Yo-Yo',
      imageurl:
          'https://media.gettyimages.com/id/1326660339/photo/using-phone-in-a-front-of-neon-lights-on-the-street.jpg?s=1024x1024&w=gi&k=20&c=munPm0L69kbCdRlBM6bxvIsyWthHUvZPpx-bdvOLO1M=',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.only(top: 10),
            margin: index == 0
                ? const EdgeInsets.only(left: 10)
                : const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                StoryImage(
                  stories: stories,
                  index: index,
                ),
                Text(
                  stories[index].fname.toLowerCase(),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class StoryImage extends StatelessWidget {
  final int index;
  StoryImage({
    Key? key,
    required this.stories,
    required this.index,
  }) : super(key: key);

  final List<Color> mycolors = [
    Colors.pink,
    Colors.purple,
    Colors.amber,
  ];

  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    mycolors.shuffle();
    return Container(
      decoration: BoxDecoration(
        border: index == 0
            ? null
            : GradientBoxBorder(
                width: 3,
                gradient: LinearGradient(
                  colors: mycolors,
                ),
              ),
        borderRadius: BorderRadius.circular(31),
      ),
      width: 62,
      height: 62,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: index == 0
              ? Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    ClipOval(
                      child: Image.network(
                        stories[index].imageurl,
                        fit: BoxFit.cover,
                        width: 56,
                        height: 56,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                    )
                  ],
                )
              : ClipOval(
                  child: index == 0
                      ? null
                      : Image.network(
                          stories[index].imageurl,
                          fit: BoxFit.cover,
                          width: 56,
                          height: 56,
                        ),
                ),
        ),
      ),
    );
  }
}
