import 'package:firebase/features/auth_post/models/auth_post_models.dart';

abstract class AuthPostState {
  AuthPostState();
}

class AuthPostInitial extends AuthPostState {
  AuthPostInitial();
}

class AuthPostLoading extends AuthPostState {
  AuthPostLoading();
}

class AuthPostError extends AuthPostState {
  final String message;
  AuthPostError({required this.message});
}

class AuthSuccess extends AuthPostState {
  final List<AuthPostModels> users;

  AuthSuccess(this.users);
}
