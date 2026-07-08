import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthCubitState extends Equatable {
  const AuthCubitState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthCubitState {}

class AuthLoading extends AuthCubitState {}

class AuthSuccess extends AuthCubitState {
  final User user;
  const AuthSuccess({required this.user});
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthCubitState {
  final String message;
  const AuthError({required this.message});
  @override
  List<Object?> get props => [message];
}
