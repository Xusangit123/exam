import 'package:firebase/features/auth/cubit/auth_cubit_cubit.dart';
import 'package:firebase/features/auth/cubit/auth_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: BlocConsumer<AuthCubitCubit, AuthCubitState>(
        listener: (context, state) {
          if (state is AuthError) {
           toastification.show(title: Text(state.message), type: ToastificationType.error);
          } else if (state is AuthSuccess) {
            toastification.show(title: Text('Login Successful'), type: ToastificationType.success);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return CircularProgressIndicator();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: state is AuthLoading ? null : () {
                  context.read<AuthCubitCubit>().signUp(
                        email: 'user1@example.com',
                        password: 'password',
                      );
                },
                child: state is AuthLoading ? CircularProgressIndicator.adaptive() : Text('Login'),
              ),
            ],
          );
        },)
      ),  
    );
  }
}