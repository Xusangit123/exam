import 'package:bloc/bloc.dart';
import 'package:firebase/features/auth/cubit/auth_cubit_state.dart';
import 'package:firebase/features/repositories/auth_repositories.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  final AuthService repository;
  AuthCubitCubit({required this.repository}) : super(AuthInitial());
  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final userCredential = await repository.signUp(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user: userCredential.user!));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final userCredential = await repository.signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user: userCredential.user!));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
