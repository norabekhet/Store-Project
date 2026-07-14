import 'package:dio/dio.dart';
import 'package:e_commerse/core/helpers/cache_helper.dart';
import 'package:e_commerse/features/auth/login_state.dart';
import 'package:e_commerse/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(loginInitial());

  final Dio dio = Dio();

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  Future<void> login() async {
    try {
      emit(loginLoading());

      final Response response = await dio.post(
        "https://api.escuelajs.co/api/v1/auth/login",
        data: {
          "email": userEmailController.text,
          "password": userPasswordController.text,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        UserModel userModel = UserModel.fromjson(response.data);

        if (userModel.token != null) {
          CacheHelper.saveToken(userModel.token!);
        }

        emit(loginSuccess());
      } else {
        emit(loginFailure("there is No Token"));
      }
    } on DioException catch (e) {
      emit(loginFailure(e.message ?? "error"));
    } catch (e) {
      emit(loginFailure(e.toString()));
    }
  }
}
