import 'package:flutter/cupertino.dart';

class ProfileInfo extends StatelessWidget {
  final String userName;
  final String userMail;
  final String userProfilePicture;

  const ProfileInfo({
    super.key,
    required this.userName,
    required this.userMail,
    required this.userProfilePicture,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38, bottom: 15),
            child: Container(
              child: userProfilePicture.isEmpty
                  ? const Icon(
                      CupertinoIcons.profile_circled,
                      size: 84,
                    )
                  : Image(
                      image: NetworkImage(userProfilePicture),
                    ),
            ),
          ),
          DefaultTextStyle(
            style: const TextStyle(
                fontSize: 24, color: CupertinoColors.black, fontWeight: FontWeight.w600),
            child: Text(
              userName,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          DefaultTextStyle(
            style: const TextStyle(
                fontSize: 16, color: CupertinoColors.placeholderText, fontWeight: FontWeight.w400),
            child: Text(
              userMail,
            ),
          ),
        ],
      ),
    );
  }
}
