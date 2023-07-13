import 'package:flutter/cupertino.dart';

class DummyScreen extends StatelessWidget {
  final String appBarTitle;

  const DummyScreen({
    super.key,
    required this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      navigationBar: CupertinoNavigationBar(
        middle: Text(appBarTitle),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 22,
              color: CupertinoColors.label,
            ),
            child: Text(
              'Раздел $appBarTitle сейчас в разработке, заглядывайте позже 🙃',
            ),
          ),
        ),
      ),
    );
  }
}
