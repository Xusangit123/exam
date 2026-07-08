import 'package:firebase/features/uyvazifa/models/user_model.dart';
import 'package:firebase/features/uyvazifa/pages/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_cubit.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    context.read<UserCubit>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserError) {
            return Center(child: Text(state.message));
          }

          if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];

                return Card(
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            final nameController = TextEditingController(
                              text: user.name,
                            );

                            final lastnameController = TextEditingController(
                              text: user.lastname,
                            );

                            final cityController = TextEditingController(
                              text: user.city,
                            );

                            final imageController = TextEditingController(
                              text: user.image,
                            );

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Edit User"),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: nameController,
                                          decoration: const InputDecoration(
                                            labelText: "Name",
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        TextField(
                                          controller: lastnameController,
                                          decoration: const InputDecoration(
                                            labelText: "Lastname",
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        TextField(
                                          controller: cityController,
                                          decoration: const InputDecoration(
                                            labelText: "City",
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        TextField(
                                          controller: imageController,
                                          decoration: const InputDecoration(
                                            labelText: "Image URL",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        final updatedUser = UserModel(
                                          id: user.id,
                                          name: nameController.text,
                                          lastname: lastnameController.text,
                                          city: cityController.text,
                                          image: imageController.text,
                                        );

                                        context.read<UserCubit>().updateUser(
                                          
                                          updatedUser,
                                        );

                                        Navigator.pop(context);
                                      },
                                      child: const Text("Update"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context.read<UserCubit>().deleteUser(user.id);
                          },
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.image),
                    ),
                    title: Text(user.name),
                    subtitle: Text("ID: ${user.id}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailPage(user: user),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }

          return const Center(child: Text("No users found"));
        },
      ),
    );
  }
}
