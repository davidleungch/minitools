import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:minitools/pages/setting.dart';

const double _kItemExtent = 32.0;
const List<String> _applications = <String>[
  'Fee Spliter',
  'Interest Calculator',
  'Loan Calculator',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _showDialog(Widget child) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

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
              onPressed: () => {
                    _showDialog(CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: _kItemExtent,
                      scrollController: FixedExtentScrollController(
                          initialItem: _selectedIndex),
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      children: List<Widget>.generate(_applications.length,
                          (int index) {
                        return Center(
                          child: Text(_applications[index]),
                        );
                      }),
                    ))
                  },
              child: Row(
                children: [
                  Text(
                    _applications[_selectedIndex],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.black)
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
