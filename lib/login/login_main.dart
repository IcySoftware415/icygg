import 'package:flutter/material.dart';

class LoginMain extends StatelessWidget{
  const LoginMain({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 100),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
        ),
        margin: const EdgeInsets.all(40),
        child: buildSignInForm(),
      ),
    );
  }

  Widget buildSignInForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch, // Use stretch for horizontal alignment
      children: [
        buildHeader(),
        const SizedBox(height: 30),
        buildTextField('Username'),
        const SizedBox(height: 30),
        buildTextField('Password'),
        const SizedBox(height: 30),
        buildSignInButton(),
      ],
    );
  }

  Widget buildHeader() {
    return const Column(
      children: [
        Text(
          'Sign in',
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

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }

  Widget buildSignInButton() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      child: const Text('Sign In'),
    );
  }
}