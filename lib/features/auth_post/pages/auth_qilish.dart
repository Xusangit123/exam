import 'package:firebase/features/auth_post/cubit/auth_post_cubit.dart';
import 'package:firebase/features/auth_post/cubit/auth_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthQilish extends StatefulWidget {
  const AuthQilish({super.key});

  @override
  State<AuthQilish> createState() => _AuthQilishState();
}

class _AuthQilishState extends State<AuthQilish> {
 void initState() {
    super.initState();
    context.read<AuthPostCubit>().authpost();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthPostCubit, AuthPostState>(
        builder: (context, state) {
          if (state is AuthPostInitial) {
            return Center(child: Text('Auth Qilish'));
          } else if (state is AuthPostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AuthPostError) {
            return Center(child: Text(state.message));
          } else if (state is AuthSuccess) {
            return Center(child: Text('Auth Success'));
          }
          return Container();
        },
      ),
      floatingActionButton: BlocConsumer<AuthPostCubit, AuthPostState>(
        listener: (context, state) {
          if (state is AuthPostError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Auth Post Success')));
          }
        },
        builder: (context, state) {
          if (state is AuthPostLoading) {
            return CircularProgressIndicator();
          }
          return FloatingActionButton(
            onPressed: () {
              context.read<AuthPostCubit>().authpost();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}
