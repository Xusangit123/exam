import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase/features/menu/models/menu_item_model.dart';


part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());
}
