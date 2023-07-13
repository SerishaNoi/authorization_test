import 'package:authorization_test/authorization/cubit/authorization_cubit.dart';
import 'package:authorization_test/constants/app_keys.dart';
import 'package:authorization_test/screens/authorization_screen/widgets/button.dart';
import 'package:authorization_test/screens/authorization_screen/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => AuthorizationScreenState();
}

class AuthorizationScreenState extends State<AuthorizationScreen> {
  late TextEditingController loginOrEmailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    loginOrEmailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: AppKeys.authorizationStateKey,
      backgroundColor: const Color(0xFFF3F4F6),
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: CupertinoColors.white,
              child: Column(
                children: [
                  StyledCupertinoField(
                    controller: loginOrEmailController,
                    onChanged: (value) {},
                    placeholder: 'Логин или почта',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color(0xFFE0E6ED),
                          ),
                        ),
                      ),
                    ),
                  ),
                  StyledCupertinoField(
                    controller: passwordController,
                    onChanged: (value) {},
                    placeholder: 'Пароль',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AutorizationButton(
              title: 'Войти',
              onPressed: () async {
                context.read<AuthorizationCubit>().requestAuthorization(
                    email: loginOrEmailController.text, password: passwordController.text);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            AutorizationButton(
              onPressed: () {},
              title: 'Зарегистрироваться',
            ),
          ],
        ),
      ),
    );
  }
}
