import 'package:flutter/material.dart';

import 'feature/creational/singleton_real_life/home_view_singleton.dart';
import 'feature/creational/singleton_real_life/shared_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedManager.initSharedPrefences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeViewSingleton(),
    );
  }
}
