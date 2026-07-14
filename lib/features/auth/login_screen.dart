import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerse/core/helpers/app_colors.dart';
import 'package:e_commerse/core/helpers/app_field.dart';
import 'package:e_commerse/core/helpers/app_password_field.dart';
import 'package:e_commerse/core/helpers/app_toast.dart';
import 'package:e_commerse/features/auth/login_cubit.dart';
import 'package:e_commerse/features/auth/login_state.dart';
import 'package:e_commerse/features/auth/sign_up.dart';
import 'package:e_commerse/features/home%20screen/home_screen.dart';
import 'package:e_commerse/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is loginFailure) {
                showSnackBar(
                  msg: state.msg,
                  type: AnimatedSnackBarType.error,
                  context: context,
                );
              }

              if (state is loginSuccess) {
                showSnackBar(
                  msg: "login_success".tr(),
                  type: AnimatedSnackBarType.success,
                  context: context,
                );

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<LoginCubit>();

              if (state is loginLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(29),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "login_title".tr(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1A1D1E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "login_subtitle".tr(),
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      "username".tr(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),

                    AppField(
                      controller: cubit.userEmailController,
                      obscureText: false,
                      hint: "email_hint".tr(),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "password".tr(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),

                    AppPasswordField(
                      controller: cubit.userPasswordController,
                      hint: "password_hint".tr(),
                    ),

                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff3B71CA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "sign_in".tr(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("no_account".tr()),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                          },
                          child: Text(
                            "join".tr(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
