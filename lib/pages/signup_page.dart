import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup_page/pages/signin_page.dart';

import '../databases/database_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var userNameController = TextEditingController();
  var userEmailController = TextEditingController();
  var userPasswordController = TextEditingController();

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    List<Map<String, dynamic>> items = await DatabaseHelper.get();
    if (items.isEmpty) {
      userNameController;
      userEmailController;
      userPasswordController;
    } else {
      Map<String, dynamic> item = items[0];
      userNameController = item['full_name'];
      userEmailController = item['email'];
      userPasswordController = item['password'];
    }
    setState(() {});
  }

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
                style: GoogleFonts.poppins(
                  fontSize: 72.sp,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: const Color(0xff043133),
                ),
              ),
              SizedBox(height: 24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: const Color(0xffABB3BB),
                    ),
                  ),
                  SizedBox(height: 9.h),
                  TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.h),
                        fillColor: const Color(0xffEFF0F2),
                        filled: true,
                        hintText: "John Doe",
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
                    "Email",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: const Color(0xff969AA8),
                    ),
                  ),
                  SizedBox(height: 9.h),
                  TextField(
                    controller: userEmailController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(18.h),
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
                          if (items.isEmpty) {
                            await DatabaseHelper.save(
                                userNameController.text,
                                userEmailController.text,
                                userPasswordController.text);
                          } else {}

                          DatabaseHelper.save(
                              userNameController.text,
                              userEmailController.text,
                              userPasswordController.text);

                          // List<Map<String, dynamic>> get =
                          await DatabaseHelper.get();

                          setState(() {
                            // print("get $get");
                          });
                        },
                        child: Text(
                          "Create Account",
                          style: GoogleFonts.poppins(
                            fontSize: 26.sp,
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
                    "Have an account?",
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
                            builder: (context) => const SignInPage(),
                          ));
                    },
                    child: Text(
                      "Sign in",
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
