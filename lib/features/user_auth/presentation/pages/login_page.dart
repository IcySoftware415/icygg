import 'package:beta_project/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:beta_project/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../firebase_auth_implementation/firebase_auth_services.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 100),
          decoration: BoxDecoration(
            border: Border.all(width: 2),
          ),
          margin: const EdgeInsets.all(40),
          child: buildSignInForm(context),
        ),
      ),
    );
  }

  Widget buildSignInForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch, // Use stretch for horizontal alignment
      children: [
        buildHeader(),
        const SizedBox(height: 30),
        FormContainerWidget(
          hintText: 'Email',
          isPasswordField: false,
          controller: _emailController,
        ),
        const SizedBox(height: 10),
        FormContainerWidget(
          hintText: 'Password',
          isPasswordField: true,
          controller: _passwordController,
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: _logIn,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          child: const Text('Log In'),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            const SizedBox(width: 5,),
            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignUpPage()), (route) => false);
              },
              child: const Text('Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildHeader() {
    return const Column(
      children: [
        Text(
          'Login',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Use your Google Account',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void _logIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if(user != null){
      print('User is succesfully signed in');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
    } else{
      print("Some error occured");
    }
  }
}