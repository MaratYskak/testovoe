import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/app/const/page_const.dart';
import 'package:testovoe/features/user/domain/entities/user_entity.dart';
import 'package:testovoe/features/user/presentation/cubit/user_cubit.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Posts"),
      //   centerTitle: true,
      // ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UsersLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageConst.singleUserPage,
                        arguments: UserEntity(
                            address: user.address,
                            company: user.company,
                            email: user.email,
                            id: user.id,
                            name: user.name,
                            phone: user.phone,
                            username: user.username,
                            website: user.website));
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 34, 59, 102),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'username: ${user.username}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'name: ${user.name}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                  SizedBox(height: 16),
                  Text(
                    "Ошибка загрузки users",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
