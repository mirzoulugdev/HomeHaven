import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_router_names.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../blocs/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool validate() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    phoneNumber.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Manrope",
                  ),
                ),
                Text(
                  "Enter your email to start shopping and get awesome deals today!",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGreyColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                          labelText: "Phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your phone number!";
                          } else if (!value.contains("+998")) {
                            return "Please enter your phone number in correct form (+998 )";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email!";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
                              .hasMatch(value)) {
                            return "Please enter a valid email address!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                          ),
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password!";
                          } else if (value.trim().length < 8) {
                            return "Your password must be at least 8 characters long!";
                          }
                          return null;
                        },
                        obscureText: !_isVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: Icon(
                              _isVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    } else if (state is Authenticated) {
                      context.go(AppRouterNames.home);
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                SignInRequested(
                                  email: email.text.trim(),
                                  password: password.text.trim(),
                                  phoneNumber: phoneNumber.text.trim(),
                                ),
                              );
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 350.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColors.mainColor,
                        ),
                        child: state is Loading
                            ? CupertinoActivityIndicator(
                                radius: 10,
                                color: AppColors.whiteColor,
                              )
                            : Text(
                                "Log In",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Inter",
                                  color: AppColors.whiteColor,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120.w,
                      height: 1.h,
                      color: AppColors.lightGreyColor,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                        color: AppColors.lightGreyColor,
                      ),
                    ),
                    Container(
                      width: 120.w,
                      height: 1.h,
                      color: AppColors.lightGreyColor,
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                _buildSocialLoginButton(
                  icon: AppIcons.google,
                  label: "Log In with Google",
                ),
                SizedBox(height: 20.h),
                _buildSocialLoginButton(
                  icon: AppIcons.facebook,
                  label: "Log In with Facebook",
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 30.w),
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.go(AppRouterNames.register),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: 30.w),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton(
      {required String icon, required String label}) {
    return Container(
      alignment: Alignment.center,
      width: 350.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 2.w,
          color: AppColors.mainColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 50.w),
          SvgPicture.asset(
            icon,
            width: 30.w,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(width: 50.w),
        ],
      ),
    );
  }
}
