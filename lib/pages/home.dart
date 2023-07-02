import 'package:flutter/material.dart';
import './setting.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(children: [
          TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},
              child: const Row(
                children: [
                  Text(
                    "Application",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.black)
                ],
              )),
        ]),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: IconButton(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: const Icon(Icons.settings, color: Colors.black),
                onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const Dialog.fullscreen(
                                child: SettingPage(),
                              ))
                    }),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
