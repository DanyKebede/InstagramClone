import 'package:flutter/material.dart';

class InstaAppBar extends StatelessWidget {
  const InstaAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 44,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Image.asset(
        'assets/images/Camera.png',
        width: 24,
        height: 24.5,
      ),
      title: Image.asset(
        'assets/images/Instagram.png',
      ),
      centerTitle: true,
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 18),
            width: 24,
            height: 24.5,
            child: Image.asset('assets/images/IGTV.png')),
        Container(
            margin: const EdgeInsets.only(right: 18),
            width: 24,
            height: 24.5,
            child: Image.asset('assets/images/Messanger.png'))
      ],
    );
  }
}
