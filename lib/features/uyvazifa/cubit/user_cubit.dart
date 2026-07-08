import 'package:firebase/features/uyvazifa/repositories/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';


part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit({required this.repository}) : super(UserInitial());

  Future<void> getUsers() async {
    try {
      emit(UserLoading());

      final users = await repository.getUsers();

      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
  Future<void> createUser(UserModel user) async {
    try {
      await repository.createUser(user);
      getUsers();
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await repository.deleteUser(id);
      getUsers();
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
   Future<void> updateUser(UserModel user) async {
    try {
      await repository.updateUser(user);
      getUsers();
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}