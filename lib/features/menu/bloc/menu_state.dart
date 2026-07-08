part of 'menu_cubit.dart';

abstract class MenuState {
  const MenuState();
}

class MenuInitial extends MenuState {
  const MenuInitial();
}

class MenuLoading extends MenuState {
  const MenuLoading();
}

class MenuLoaded extends MenuState {
  const MenuLoaded();
}

class MenuError extends MenuState {
  final String error;

  MenuError({required this.error});
}
class MenuSuccess extends MenuState {
  final List<MenuItem> menu;

  MenuSuccess({required this.menu});
}