import 'package:firebase_auth/firebase_auth.dart';
import 'package:beta_project/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        children: [
          const Center(
            child: Text("Welcome to HomePage"),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
            },
            child: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: Text("Sign Out"),),
            ),
          ),
        ],
      ),
    );
  }
}