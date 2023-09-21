import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample2/cubit/user_cubit.dart';
import 'package:sample2/cubit/user_cubit_state.dart';
import 'package:sample2/model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getAllUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample'),),
      body: BlocBuilder<UserCubit, UserCubitState>(builder: (context, state){
        if(state is UserCubitLoading){
          return const Center(child: CircularProgressIndicator(),);
        } else if(state is UserCubitError){
          return Center(child: Text(state.message),);
        } else if(state is UserCubitLoaded){
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              itemCount: state.userList.length,
              itemBuilder: (context, index){
            UserModel user = state.userList[index];
            return ListTile(
              title: Text('${user.firstName}'),
              leading: CircleAvatar(child: Image.network('${user.avatar}'),),
            );
          });
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
