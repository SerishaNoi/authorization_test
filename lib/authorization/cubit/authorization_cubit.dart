import 'package:authorization_test/authorization/api/authorization_api.dart';
import 'package:authorization_test/authorization/api/authorization_api_impl.dart';
import 'package:authorization_test/authorization/models/authorization_data.dart';
import 'package:authorization_test/constants/app_keys.dart';
import 'package:authorization_test/method/show_modal_popup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorization_state.dart';
part 'authorization_cubit.freezed.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit() : super(const AuthorizationState.initial());

  final AuthorizationApi _authenticationApi = AuthorizationApiImpl();

  void requestAuthorization({required String email, required String password}) async {
    final AuthorizationData authorizationData;

    if (email.isNotEmpty && password.isNotEmpty) {
      authorizationData = await _authenticationApi.getTokens(email: email, password: password);
      emit(const AuthorizationState.authorizationRequest());

      if (authorizationData.tokens.accessToken.isNotEmpty) {
        emit(AuthorizationState.authorizaed(authorizationData));
      } else if (authorizationData.tokens.accessToken.isEmpty) {
        // меняем глобальный ключ, если необходимо навигироваться на экран ошибки при ее возникновении
        showDialog('Ошибка авторизации, попробуйте снова', AppKeys.authorizationStateKey);
        emit(const AuthorizationState.errore('AUTHORIZATION ERROR'));
      }
    } else if (email.isEmpty) {
      showDialog('Введите логин', AppKeys.authorizationStateKey);
    } else if (password.isEmpty) {
      showDialog('Введите пароль', AppKeys.authorizationStateKey);
    }
  }

  void navigateBack() {
    emit(const AuthorizationState.initial());
  }
}
