import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatelessWidget {
  final List<Map> searchData = const [
    {
      'fname': 'yapaa',
      'img': [
        'https://media.istockphoto.com/id/1334702614/photo/young-man-with-laptop-and-coffee-working-indoors-home-office-concept.jpg?s=612x612&w=0&k=20&c=qAhnrFIMKaObf7Ybf19FVE605g5OVcR7CSt0E3xYSMo=',
        'https://media.istockphoto.com/id/544358212/photo/happy-laughing-man.jpg?s=612x612&w=0&k=20&c=FwJw5gqpUX3A8jOdsnIqQmSOxptVcYqHzaBkz6bvtMA=',
        'https://media.istockphoto.com/id/1254062265/photo/an-african-american-guy-using-laptop-in-the-office.jpg?s=612x612&w=0&k=20&c=qyH05cqhlwsH6Wzm0x7FT6NDE6CYwfku1UktL7aOCTA='
      ]
    },
    {
      'fname': 'dany',
      'img': [
        'https://media.istockphoto.com/id/1199653718/photo/client-management-made-easier-with-mobile-tech.jpg?s=612x612&w=0&k=20&c=97vclzruR9UWQHkgOIbVXyRBKoHf9wy_f_jUqRDWsXY=',
        'https://media.istockphoto.com/id/492529287/photo/portrait-of-happy-laughing-man.jpg?s=612x612&w=0&k=20&c=0xQcd69Bf-mWoJYgjxBSPg7FHS57nOfYpZaZlYDVKRE=',
        'https://media.istockphoto.com/id/1214385229/photo/smiling-businessman.jpg?s=612x612&w=0&k=20&c=4ZofijjFczgimH8K1ig38W_OKZPwQ1iMWZIlRtxlXzA='
      ]
    },
    {
      'fname': 'Abebe',
      'img': [
        // 'https://media.istockphoto.com/id/1256127007/photo/close-up-portrait-of-his-he-nice-attractive-glad-cheerful-cheery-guy-pointing-forefinger.jpg?s=612x612&w=0&k=20&c=ikuJ6lIP_sLTlzldA5Qrwjp6Ttjy0dS8A80rWq0ZcjI=',
        // 'https://media.istockphoto.com/id/1201024668/photo/stylish-man-wearing-sunglasses-and-white-shirt-city-life.jpg?s=612x612&w=0&k=20&c=00vZ3so3sKEpexvIXUzvp0fSAMX2b1ZYo1Nq35wAHuU=',
        'https://media.istockphoto.com/id/1213860433/photo/smart-confidence-asian-startup-entrepreneur-business-owner-businessman-smile-hand-use.jpg?s=612x612&w=0&k=20&c=3llD1R6hLJ0HKpJ-l-apRybSGx6Itw3K6go8MDT5qpM='
      ]
    },
    {
      'fname': 'mi_kta',
      'img': [
        'https://media.istockphoto.com/id/1178769741/photo/man-using-phone.jpg?s=612x612&w=0&k=20&c=Tq6aGBfFUWpVEi85D76Ah1UTzdMCxUENtSXFejWgofE=',
        // 'https://media.istockphoto.com/id/1090837964/photo/handsome-man-laughing.jpg?s=612x612&w=0&k=20&c=Z7cynOxU1v7Fe-CRzh2C_dgR0URgU4uzF2UbOH14vtE=',
        // 'https://media.istockphoto.com/id/1232773089/photo/portrait-of-a-young-handsome-african-man.jpg?s=612x612&w=0&k=20&c=Uk5iJaCe19tG0WvrN51XhrnekTq2guha1eW9zHsFwhA='
      ]
    },
    {
      'fname': 'osman',
      'img': [
        'https://media.istockphoto.com/id/932750734/photo/three-male-friends-on-a-road-trip-using-a-tablet-computer.jpg?s=612x612&w=0&k=20&c=ksFdUrJ62yf5wipekSX7BqathgUQi6zwYOzvmqO7EW0=',
        'https://media.istockphoto.com/id/1310896133/photo/happy-smiling-afro-businessman-using-laptop-at-the-desk-in-office.jpg?s=612x612&w=0&k=20&c=QUQpwqaaPswBIJB6_lk5xU6HY_RevWNSwcqAErPZsOc=',
        'https://media.istockphoto.com/id/1185422927/photo/depressive-man.jpg?s=612x612&w=0&k=20&c=RJO_EsbyHzZYUZmcmOEBqQR2rwsH5QOz5rnQ1O7DevU='
      ]
    },
    {
      'fname': 'berket',
      'img': [
        'https://media.istockphoto.com/id/1132792394/photo/headshot-of-a-young-adult.jpg?s=612x612&w=0&k=20&c=p0qasJ-HvUrRhMPrlVNFmOrcEd7BoZpcbB6imIUBB2Y=',
        '',
      ]
    },
    {
      'fname': 'Aster_k',
      'img': [
        'https://media.istockphoto.com/id/1232773089/photo/portrait-of-a-young-handsome-african-man.jpg?s=612x612&w=0&k=20&c=Uk5iJaCe19tG0WvrN51XhrnekTq2guha1eW9zHsFwhA=',
        'https://media.istockphoto.com/id/969233490/photo/young-african-woman-smiling-at-sunset.jpg?s=612x612&w=0&k=20&c=G0cagT6s1rXm455ZN8TCReO1C78ua1xGJPXDi6eKGLA='
      ],
    },
    {
      'fname': 'Makbel',
      'img': [
        'https://media.istockphoto.com/id/1295057612/photo/young-african-american-man-with-afro-hair-wearing-casual-winter-sweater-happy-face-smiling.jpg?s=612x612&w=0&k=20&c=v0xRMteZdCfq4OhfvfQbtf8GmXEJmhUNoEHBmMJJ9YI=',
        'https://media.istockphoto.com/id/544358286/photo/pride-man-smiling.jpg?s=612x612&w=0&k=20&c=o7xWnlzKLdrPWdnml8s0kfaiXlme62N4iVWGC0TO0C8=',
        'https://media.istockphoto.com/id/850045040/photo/jogging-with-my-best-friend.jpg?s=612x612&w=0&k=20&c=OBbDwmWY4ErOajR8QNvT9h8_zJ6ko2eFftnX2V7BM3Q='
      ],
    },
    {
      'fname': 'beky',
      'img': [
        'https://media.istockphoto.com/id/544357744/photo/friends-laughing-and-enjoying.jpg?s=612x612&w=0&k=20&c=Pbic5nOf77r61WX7nhGvCq7IStW76FmfiXm6niYYvak=',
        'https://media.istockphoto.com/id/649668978/photo/pub-food-and-drinks.jpg?s=612x612&w=0&k=20&c=kdEaFfAAFCwj_-XkxoqYBohpdePqChQLZ0kPU2oGxuI=',
        'https://media.istockphoto.com/id/1150520884/photo/whats-the-vibe-on-the-newsfeed.jpg?s=612x612&w=0&k=20&c=ebV8gD-wNDWC8HQ-EpehKxkrxmsSsh0NfGhYJAMqHEU='
      ],
    },
    {
      'fname': 'jo_sfr',
      'img': [
        'https://media.istockphoto.com/id/1150520884/photo/whats-the-vibe-on-the-newsfeed.jpg?s=612x612&w=0&k=20&c=ebV8gD-wNDWC8HQ-EpehKxkrxmsSsh0NfGhYJAMqHEU=',
        '',
      ],
    },
    {
      'fname': 'Aster_k',
      'img': [
        'https://media.istockphoto.com/id/1232773089/photo/portrait-of-a-young-handsome-african-man.jpg?s=612x612&w=0&k=20&c=Uk5iJaCe19tG0WvrN51XhrnekTq2guha1eW9zHsFwhA=',
        'https://media.istockphoto.com/id/969233490/photo/young-african-woman-smiling-at-sunset.jpg?s=612x612&w=0&k=20&c=G0cagT6s1rXm455ZN8TCReO1C78ua1xGJPXDi6eKGLA='
      ],
    },
    {
      'fname': 'Makbel',
      'img': [
        // 'https://media.istockphoto.com/id/1295057612/photo/young-african-american-man-with-afro-hair-wearing-casual-winter-sweater-happy-face-smiling.jpg?s=612x612&w=0&k=20&c=v0xRMteZdCfq4OhfvfQbtf8GmXEJmhUNoEHBmMJJ9YI=',
        'https://media.istockphoto.com/id/544358286/photo/pride-man-smiling.jpg?s=612x612&w=0&k=20&c=o7xWnlzKLdrPWdnml8s0kfaiXlme62N4iVWGC0TO0C8=',
        'https://media.istockphoto.com/id/850045040/photo/jogging-with-my-best-friend.jpg?s=612x612&w=0&k=20&c=OBbDwmWY4ErOajR8QNvT9h8_zJ6ko2eFftnX2V7BM3Q='
      ],
    },
    {
      'fname': 'beky',
      'img': [
        // 'https://media.istockphoto.com/id/544357744/photo/friends-laughing-and-enjoying.jpg?s=612x612&w=0&k=20&c=Pbic5nOf77r61WX7nhGvCq7IStW76FmfiXm6niYYvak=',
        'https://media.istockphoto.com/id/649668978/photo/pub-food-and-drinks.jpg?s=612x612&w=0&k=20&c=kdEaFfAAFCwj_-XkxoqYBohpdePqChQLZ0kPU2oGxuI=',
        // 'https://media.istockphoto.com/id/1150520884/photo/whats-the-vibe-on-the-newsfeed.jpg?s=612x612&w=0&k=20&c=ebV8gD-wNDWC8HQ-EpehKxkrxmsSsh0NfGhYJAMqHEU='
      ],
    },
    {
      'fname': 'jo_sfr',
      'img': [
        'https://media.istockphoto.com/id/1150520884/photo/whats-the-vibe-on-the-newsfeed.jpg?s=612x612&w=0&k=20&c=ebV8gD-wNDWC8HQ-EpehKxkrxmsSsh0NfGhYJAMqHEU=',
        '',
      ],
    },
    {
      'fname': 'Makbel',
      'img': [
        'https://media.istockphoto.com/id/850045040/photo/jogging-with-my-best-friend.jpg?s=612x612&w=0&k=20&c=OBbDwmWY4ErOajR8QNvT9h8_zJ6ko2eFftnX2V7BM3Q=',
        'https://media.istockphoto.com/id/1295057612/photo/young-african-american-man-with-afro-hair-wearing-casual-winter-sweater-happy-face-smiling.jpg?s=612x612&w=0&k=20&c=v0xRMteZdCfq4OhfvfQbtf8GmXEJmhUNoEHBmMJJ9YI=',
        // 'https://media.istockphoto.com/id/544358286/photo/pride-man-smiling.jpg?s=612x612&w=0&k=20&c=o7xWnlzKLdrPWdnml8s0kfaiXlme62N4iVWGC0TO0C8=',
      ],
    },
  ];

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return const [
                SliverAppBar(
                  flexibleSpace: SearchAppbar(),
                  toolbarHeight: 48,
                  backgroundColor: Colors.white,
                ),
              ];
            },
            body: SearchGrid(searchData: searchData)),
      ),
    );
  }
}

class SearchGrid extends StatelessWidget {
  const SearchGrid({
    Key? key,
    required this.searchData,
  }) : super(key: key);

  final List<Map> searchData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: searchData
            .map(
              (e) => StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: e['img'].length == 1 ? 2 : 1,
                child: GridTile(
                  header: GridTileBar(
                    title: const Text(''),
                    trailing: e['img'].length == 1
                        ? const Icon(
                            Icons.video_call_outlined,
                            color: Colors.white,
                            size: 24,
                          )
                        : Image.asset(
                            'assets/images/pic_library.png',
                            width: 20,
                            height: 23,
                          ),
                  ),
                  child: Image.network(
                    e['img'][0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(118, 118, 128, 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        onTap: () {
          // setState(() {
          //   showGrid = false;
          // });
        },
        clipBehavior: Clip.antiAlias,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIconConstraints: const BoxConstraints(maxHeight: 18),
          prefixIcon: Container(
            margin: const EdgeInsets.only(right: 2),
            child: const Icon(
              Icons.search,
              size: 21,
            ),
          ),
          hintText: 'Search',
        ),
      ),
    );
  }
}
