import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_app/bloc/auth_bloc.dart';
import 'package:form_validation_app/home_screen.dart';
import 'package:form_validation_app/widgets/gradient_button.dart';
import 'package:form_validation_app/widgets/login_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthFailure){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
          if(state is AuthSuccess){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/signin_balls.png'),
                const Text(
                  'Sign in.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 50),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Password',
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                GradientButton(onPressed: () {
                  context.read<AuthBloc>().add(AuthLoginRequested(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim()));
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}