import 'package:flutter/material.dart';
import 'package:flutter_real_life_patterns/feature/creational/singleton_real_life/shared_manager.dart';

class HomeViewSingleton extends StatefulWidget {
  const HomeViewSingleton({Key? key}) : super(key: key);

  @override
  _HomeViewSingletonState createState() => _HomeViewSingletonState();
}

class _HomeViewSingletonState extends State<HomeViewSingleton> {
  String _value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProjectConstantsLazy.instnace.projectTitle),
      ),
      body: Column(
        children: [
          TextField(
            controller: TextEditingController(text: SharedManager.instace.getStringValue(SharedKeys.TOKEN)),
            onChanged: (value) {
              _value = value;
            },
          ),
          FloatingActionButton(
            onPressed: () async {
              await SharedManager.instace.setStringValue(SharedKeys.TOKEN, _value);
            },
          )
        ],
      ),
    );
  }
}
