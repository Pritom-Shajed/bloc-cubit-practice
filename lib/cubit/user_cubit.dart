import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample2/cubit/user_cubit_state.dart';
import 'package:sample2/model/user_model.dart';
import 'package:sample2/services/api_service.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];

  ApiService apiService;

  UserCubit({required this.apiService}) : super(UserCubitInit());

  void getAllUserList() async {
    try {
      emit(UserCubitLoading());
      userList = await apiService.getAllUser();
      emit(UserCubitLoaded(userList: userList));
    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}
