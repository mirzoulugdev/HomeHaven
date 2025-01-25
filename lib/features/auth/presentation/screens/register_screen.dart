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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  width: 340.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Manrope",
                        ),
                      ),
                      Text(
                        "Fill in your details below to get started on a seamless shopping experience.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(AppIcons.person),
                          ),
                          labelText: "First Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name!";
                          } else if (value.length < 4) {
                            return "Please enter your name full format!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
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
                            return "Please enter your phone number";
                          } else if (!value.contains("+998")) {
                            return "Please enter your phone number correct form (+998)!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(AppIcons.email),
                          ),
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          } else if (!value.contains("@gmail.com")) {
                            return "Please enter your email correct format!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: password,
                        obscureText: _isVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: !_isVisible
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                  )
                                : Icon(Icons.visibility_outlined),
                          ),
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(AppIcons.lock),
                          ),
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password!";
                          } else if (value.length < 8) {
                            return "Please enter your password correct form!";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    } else if (state is Registered) {
                      context.go(AppRouterNames.home);
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () async {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                SignUpRequested(
                                  email: email.text.trim(),
                                  phoneNumber: phoneNumber.text.trim(),
                                  password: password.text.trim(),
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
                                radius: 10.r,
                                color: AppColors.whiteColor,
                              )
                            : Text(
                                "Create Account",
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
                SizedBox(height: 20.h),
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
                Container(
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
                        AppIcons.google,
                        width: 30.w,
                      ),
                      Text(
                        "Log In with Google",
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
                ),
                SizedBox(height: 20.h),
                Container(
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
                        AppIcons.facebook,
                        width: 30.w,
                      ),
                      Text(
                        "Log In with Facebook",
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
                ),
                TextButton(
                  onPressed: () => context.go(AppRouterNames.login),
                  child: Text("Back to Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
