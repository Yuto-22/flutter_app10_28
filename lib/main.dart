import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyTabBarWidget());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: MyTabBarWidget(),
      ),
    );
  }
}

class MyTabBarWidget extends StatefulWidget {
  const MyTabBarWidget({Key? key}) : super(key: key);

  @override
  State<MyTabBarWidget> createState() => _MyTabBarWidet();
}

class _MyTabBarWidet extends State<MyTabBarWidget>{

  int _currentIndex = 0;
  final _pageWidgets = [
    CashCard(),
    const Scaffold(),
    //ToDo: Setting(),
    const Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pageWidgets.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.branding_watermark_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_atm_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restore_rounded),
              label: '',
            ),
          ],
          fixedColor: Colors.black,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      ),
    );

  }
  void _onItemTapped(int index) => setState(() => _currentIndex = index );
}