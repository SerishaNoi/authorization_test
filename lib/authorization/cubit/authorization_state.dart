part of 'authorization_cubit.dart';

@freezed
class AuthorizationState with _$AuthorizationState {
  const factory AuthorizationState.initial() = _Initial;
  const factory AuthorizationState.authorizationRequest() = _AthorizationRequest;
  const factory AuthorizationState.authorizaed(
    AuthorizationData authorizationData,
  ) = _Authorized;
  const factory AuthorizationState.errore(String message) = _Errore;
}
