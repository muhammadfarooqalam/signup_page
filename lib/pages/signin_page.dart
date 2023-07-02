import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup_page/pages/signup_page.dart';

import '../databases/database_helper.dart';
import 'homescreen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var userNameController = TextEditingController();
  var userEmailController = TextEditingController();
  var userPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 91.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 54.h),
              Text(
                "Welcome to LMS",
                style: TextStyle(
                  fontSize: 72.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: const Color(0xff969AA8),
                    ),
                  ),
                  SizedBox(height: 9.h),
                  TextField(
                    controller: userEmailController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.h),
                        fillColor: const Color(0xffEFF0F2),
                        filled: true,
                        hintText: "Enter your Email here",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xffABB3BB),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: const BorderSide(
                              color: Color(0xffF5F6FA),
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: const Color(0xff6DA9E4).withOpacity(0),
                        )),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff6DA9E4),
                        ))),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                      color: const Color(0xff969AA8),
                    ),
                  ),
                  SizedBox(height: 9.h),
                  TextField(
                    controller: userPasswordController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(18.h),
                        fillColor: const Color(0xffEFF0F2),
                        filled: true,
                        hintText: "Enter your Password",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xffABB3BB),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: const BorderSide(
                              color: Color(0xffF5F6FA),
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: const Color(0xff6DA9E4).withOpacity(0),
                        )),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff6DA9E4),
                        ))),
                  ),
                ],
              ),
              SizedBox(height: 29.h),
              Column(
                children: [
                  SizedBox(
                    width: 300.w,
                    height: 60.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff007074),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            )),
                        onPressed: () async {
                          List<Map<String, dynamic>> items =
                              await DatabaseHelper.get();
                          if (items.last["email"] == userEmailController.text &&
                              items.last["password"] ==
                                  userPasswordController.text) {
                            print("obj $items");
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                          } else {
                            const Text("data");
                          }
                          setState(() {
                            // print("oobj $items");
                          });
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: const Color(0xff6DA9E4),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
