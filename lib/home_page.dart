import 'package:flutter/material.dart';

import 'widgets/custom_textbox_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hide = true;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golden Test'),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 250,
              child: CustomTextWidget(
                key: const Key('txtPassword'),
                obscureText: hide,
                initialValue: 'sdfsdfsdf',
                eyePressed: () {
                  setState(() {
                    hide = !hide;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
