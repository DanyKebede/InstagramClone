import 'package:flutter/material.dart';
import '../models/suggestion.dart';
import '../models/userprofile.dart';

class UserProfileProvider extends ChangeNotifier {
  final List<Suggestion> suggestion = [
    Suggestion(
        fname: 'Sarcastic_us',
        profileimg:
            'https://media.gettyimages.com/id/1281269484/photo/portrait-of-a-confident-successful-happy-mature-woman.jpg?s=612x612&w=0&k=20&c=NnUGQOqrw8I5tFrn9JusRIXPM3IFXNSZ1HQv9tiuLuc='),
    Suggestion(
        fname: 'Biruktawit_d_a',
        profileimg:
            'https://media.gettyimages.com/id/1218661893/photo/portrait-of-woman-with-afro-hair-smiling-with-white-wall-background.jpg?s=612x612&w=0&k=20&c=IHEM12CDErWg51Uw-7zR70jN--1U_r9Zi990pUcHwZQ='),
    Suggestion(
        fname: 'Fuye promotion',
        profileimg:
            'https://media.gettyimages.com/id/1312104497/photo/japanese-man-sitting-on-beach-at-dusk.jpg?s=612x612&w=0&k=20&c=T02ojaxf6HszL0JNO5hfQLgkry2CaceXxptGTNd3cPE='),
    Suggestion(
        fname: 'Nhatty_man',
        profileimg:
            'https://media.gettyimages.com/id/185500925/photo/portrait-of-young-man.jpg?s=612x612&w=0&k=20&c=1SheDKim-vq3ei_tnO02Fyhpj0_ANJHEtZEK1sqbY0o='),
    Suggestion(
        fname: 'Bezawit',
        profileimg:
            'https://media.gettyimages.com/id/1289362630/photo/beautiful-girl-with-curly-hairstyle.jpg?s=612x612&w=0&k=20&c=noPt_qkk65jYY6v0kTTvyOjcm53k-2hQoDvsyJAQMtA='),
    Suggestion(
        fname: 'Leonardodicaprio',
        profileimg:
            'https://media.gettyimages.com/id/1132119444/photo/portrait-of-confident-african-businessmen.jpg?s=612x612&w=0&k=20&c=vJWGrEGWWkW-9r6PjcEtwmnaKMvyMi1KOUnr1Zwejl4='),
    Suggestion(
        fname: 'Fuye promotion',
        profileimg:
            'https://media.gettyimages.com/id/1312104497/photo/japanese-man-sitting-on-beach-at-dusk.jpg?s=612x612&w=0&k=20&c=T02ojaxf6HszL0JNO5hfQLgkry2CaceXxptGTNd3cPE='),
    Suggestion(
        fname: 'Nhatty_man',
        profileimg:
            'https://media.gettyimages.com/id/185500925/photo/portrait-of-young-man.jpg?s=612x612&w=0&k=20&c=1SheDKim-vq3ei_tnO02Fyhpj0_ANJHEtZEK1sqbY0o='),
    Suggestion(
        fname: 'Bezawit',
        profileimg:
            'https://media.gettyimages.com/id/1289362630/photo/beautiful-girl-with-curly-hairstyle.jpg?s=612x612&w=0&k=20&c=noPt_qkk65jYY6v0kTTvyOjcm53k-2hQoDvsyJAQMtA='),
    Suggestion(
        fname: 'Leonardodicaprio',
        profileimg:
            'https://media.gettyimages.com/id/1132119444/photo/portrait-of-confident-african-businessmen.jpg?s=612x612&w=0&k=20&c=vJWGrEGWWkW-9r6PjcEtwmnaKMvyMi1KOUnr1Zwejl4='),
  ];

  UserProfile userdata = UserProfile(
      username: 'Jazmin',
      profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2K9xcJVlIG31wI5COY_Qep5GahOMmCmLYEQ&usqp=CAU',
      posts: [
        'https://media.istockphoto.com/id/1199653718/photo/client-management-made-easier-with-mobile-tech.jpg?s=612x612&w=0&k=20&c=97vclzruR9UWQHkgOIbVXyRBKoHf9wy_f_jUqRDWsXY=',
        'https://media.istockphoto.com/id/492529287/photo/portrait-of-happy-laughing-man.jpg?s=612x612&w=0&k=20&c=0xQcd69Bf-mWoJYgjxBSPg7FHS57nOfYpZaZlYDVKRE=',
        'https://media.istockphoto.com/id/1214385229/photo/smiling-businessman.jpg?s=612x612&w=0&k=20&c=4ZofijjFczgimH8K1ig38W_OKZPwQ1iMWZIlRtxlXzA=',
        'https://media.istockphoto.com/id/932750734/photo/three-male-friends-on-a-road-trip-using-a-tablet-computer.jpg?s=612x612&w=0&k=20&c=ksFdUrJ62yf5wipekSX7BqathgUQi6zwYOzvmqO7EW0=',
        'https://media.istockphoto.com/id/1310896133/photo/happy-smiling-afro-businessman-using-laptop-at-the-desk-in-office.jpg?s=612x612&w=0&k=20&c=QUQpwqaaPswBIJB6_lk5xU6HY_RevWNSwcqAErPZsOc=',
        'https://media.istockphoto.com/id/1185422927/photo/depressive-man.jpg?s=612x612&w=0&k=20&c=RJO_EsbyHzZYUZmcmOEBqQR2rwsH5QOz5rnQ1O7DevU=',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2K9xcJVlIG31wI5COY_Qep5GahOMmCmLYEQ&usqp=CAU',
        'https://media.istockphoto.com/id/1199653718/photo/client-management-made-easier-with-mobile-tech.jpg?s=612x612&w=0&k=20&c=97vclzruR9UWQHkgOIbVXyRBKoHf9wy_f_jUqRDWsXY=',
        'https://media.istockphoto.com/id/492529287/photo/portrait-of-happy-laughing-man.jpg?s=612x612&w=0&k=20&c=0xQcd69Bf-mWoJYgjxBSPg7FHS57nOfYpZaZlYDVKRE=',
        'https://media.istockphoto.com/id/1214385229/photo/smiling-businessman.jpg?s=612x612&w=0&k=20&c=4ZofijjFczgimH8K1ig38W_OKZPwQ1iMWZIlRtxlXzA=',
        'https://media.istockphoto.com/id/932750734/photo/three-male-friends-on-a-road-trip-using-a-tablet-computer.jpg?s=612x612&w=0&k=20&c=ksFdUrJ62yf5wipekSX7BqathgUQi6zwYOzvmqO7EW0=',
        'https://media.istockphoto.com/id/1310896133/photo/happy-smiling-afro-businessman-using-laptop-at-the-desk-in-office.jpg?s=612x612&w=0&k=20&c=QUQpwqaaPswBIJB6_lk5xU6HY_RevWNSwcqAErPZsOc=',
        'https://media.istockphoto.com/id/1185422927/photo/depressive-man.jpg?s=612x612&w=0&k=20&c=RJO_EsbyHzZYUZmcmOEBqQR2rwsH5QOz5rnQ1O7DevU=',
      ],
      bio:
          'flutter is Google\'s portable UI toolkit for crafting beautiful, natively compiled app. ',
      following: [
        'king_jaz',
        'aster',
        'bekky_trade',
        'yo_papapa',
        'sami',
        'Ermi_shgr',
        'dany_K',
        'samson_B',
        'bamyy',
        'breezy',
      ],
      follower: [
        'jazz_k',
        'aster',
        'bekky',
        'yo_pa',
        'sami',
        'Ermi_shgr',
        'dany_K',
        'samson_B',
        'bamyy',
        'breezy',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ]);

  void alterFollowing(String username) {
    if (userdata.following.contains(username)) {
      userdata.following.remove(username);
    } else {
      userdata.following.add(username);
    }
    notifyListeners();
  }
}
