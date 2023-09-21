import 'package:equatable/equatable.dart';
import 'package:sample2/model/user_model.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class UserCubitInit extends UserCubitState {
  @override
  List<Object?> get props => [];

}

class UserCubitLoading extends UserCubitState {
  @override
  List<Object?> get props => [];

}

class UserCubitLoaded extends UserCubitState {
  List<UserModel> userList;

  UserCubitLoaded({required this.userList});
  @override

  List<Object?> get props => [userList];

}

class UserCubitError extends UserCubitState {
  String message;

  UserCubitError({required this.message});


  @override
  List<Object?> get props => [message];
}