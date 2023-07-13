import 'package:authorization_test/authorization/cubit/authorization_cubit.dart';
import 'package:authorization_test/screens/authorization_screen/authorization_screen.dart';
import 'package:authorization_test/screens/authorized_screen/authorized_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  /* "maripbekoff@gmail.com", */
  /* "adminadmin"  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AuthorizationCubit(),
        child: BlocBuilder<AuthorizationCubit, AuthorizationState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () {
                return const AuthorizationScreen();
              },
              authorizaed: (authorizationData) {
                return AuthorizedScreen(
                  authorizationData: authorizationData,
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
