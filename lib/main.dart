import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './pages/tabcontroller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const InstaClone());
}

class InstaClone extends StatelessWidget {
  const InstaClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const TabsController(),
    );
  }
}
