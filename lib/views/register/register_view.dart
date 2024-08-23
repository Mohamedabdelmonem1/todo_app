import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_app_route/core/services/snack_bar_services.dart';
import '../../core/widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = "register";

  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  bool isVisable = false;
  bool isLoading = false;

  var globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.onSecondary,
          image: const DecorationImage(
              image: AssetImage("assets/images/login_pattern.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            toolbarHeight: 120,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "Create Account",
              style: theme.textTheme.titleLarge,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.14,
              left: 20,
              right: 20,
            ),
            child: Form(
              key: globalKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      controller: fullNameController,
                      labelText: "Full Name",
                      maxLines: 1,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return "you must enter your name";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: "E-mail",
                      maxLines: 1,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return "you must enter your name";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: "Password",
                      maxLines: 1,
                      obscureText: isVisable,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isVisable = !isVisable;
                          setState(() {});
                        },
                        child: isVisable != true
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility_outlined),
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return "you must enter your name";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      labelText: "Confirm Password",
                      maxLines: 1,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return "you must enter your name";
                        }

                        if (v != passwordController.text) {
                          return "doesn't match the password";
                        }
                        return null;
                      },
                    ),
                    MaterialButton(
                      onPressed: () {
                        register();
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Regsiter",
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (globalKey.currentState!.validate()) {
      isLoading = true;

      print(emailController.text);
      print(passwordController.text);
      try {
        var userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        isLoading = false;
        showSnackBar(context, "Your account has been registered");
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          isLoading = false;
          showSnackBar(context, "The password provided is too weak.");
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          isLoading = false;
          showSnackBar(context, "'The account already exists for that email.");

          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
