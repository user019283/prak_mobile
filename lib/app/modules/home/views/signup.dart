
import 'package:expense_track/app/modules/home/views/signin.dart';
import 'package:expense_track/app/modules/home/views/signupsuccess.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back)),
                    const Image(width: 100, image: AssetImage('assets/logo.png')),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
                      child: const Text(
                        "Sign In!",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Sign Up Account',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const Text("Please fill in the data below",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Email",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  onChanged: (value) {
                    // Handle text input
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("New Username",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  onChanged: (value) {
                    // Handle text input
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your New Username',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("New Password",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  onChanged: (value) {
                    // Handle text input
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your New Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpSuccess()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
