import 'package:authorization_test/authorization/models/authorization_data.dart';
import 'package:authorization_test/screens/dummy_screens/dummy_scrrens.dart';
import 'package:flutter/cupertino.dart';

import '../profile_screen/profile_screen.dart';

class AuthorizedScreen extends StatefulWidget {
  final AuthorizationData authorizationData;

  const AuthorizedScreen({
    super.key,
    required this.authorizationData,
  });

  @override
  State<AuthorizedScreen> createState() => _AuthorizedScreenState();
}

class _AuthorizedScreenState extends State<AuthorizedScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = [
      const DummyScreen(appBarTitle: 'Лента'),
      const DummyScreen(appBarTitle: 'Карта'),
      const DummyScreen(appBarTitle: 'Избранное'),
      ProfileScreen(authorizationData: widget.authorizationData),
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.pencil_outline, size: 22), label: 'Лента'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.map, size: 22), label: 'Карта'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart, size: 22), label: 'Избранное'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled, size: 22), label: 'Профиль'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return _tabs[index];
      },
    );
  }
}
