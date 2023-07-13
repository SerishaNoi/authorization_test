import 'package:flutter/cupertino.dart';

class AutorizationButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const AutorizationButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoButton.filled(
        onPressed: onPressed,
        child: SizedBox(
          height: 32,
          width: double.maxFinite,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0XFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
