import 'package:bloc/bloc.dart';
import 'package:firebase/features/auth_post/cubit/auth_post_state.dart';
import 'package:firebase/features/auth_post/repo/auth_post_repo.dart';


class AuthPostCubit extends Cubit<AuthPostState> {
  
  AuthPostCubit({required repository}) : super(AuthPostInitial());

Future<void> authpost() async {
    try {
      emit(AuthPostLoading());

      final users = await AuthPostRepo().authpost();

      emit(AuthSuccess(users));
    } catch (e) {
      emit(AuthPostError(message: e.toString()));
    }
  }
}
