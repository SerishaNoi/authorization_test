import 'package:authorization_test/authorization/cubit/authorization_cubit.dart';
import 'package:authorization_test/authorization/models/authorization_data.dart';
import 'package:authorization_test/screens/profile_screen/widgets/profile_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final AuthorizationData authorizationData;

  const ProfileScreen({
    super.key,
    required this.authorizationData,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Профиль',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            ProfileInfo(
              userMail: authorizationData.user.email,
              userName: authorizationData.user.nickname,
              userProfilePicture: '',
            ),
            const SizedBox(height: 27),
            CupertinoButton(
              padding: EdgeInsets.zero,
              color: CupertinoColors.white,
              borderRadius: const BorderRadius.all(Radius.zero),
              onPressed: () {
                context.read<AuthorizationCubit>().navigateBack();
                // Navigator.push(
                //   context,
                //   CupertinoPageRoute(
                //     builder: (BuildContext context) => const AuthorizationScreen(),
                //   ),
                // );
              },
              child: const SizedBox(
                height: 55,
                width: double.maxFinite,
                child: Padding(
                  padding: EdgeInsets.only(top: 17, left: 29),
                  child: Text(
                    'Выйти',
                    style: TextStyle(
                      color: Color(0XFFEC3A4D),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
