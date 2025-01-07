import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = "register_screen";

  final _auth = FirebaseAuth.instance;
  late String name;
  late String email;
  late String password;
  late String confpassword;
  // const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Sign up to get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Email Address",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      confpassword = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (password != confpassword) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Password do not Match'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok'))
                            ],
                          ),
                        );
                        return;
                      }
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, '/login');
                        }
                      } catch (e) {
                        print(e);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content:
                                Text('Registration failed. Please try again.'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok'))
                            ],
                          ),
                        );
                        return;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          // try {
                          //   final newUser =
                          //       await _auth.createUserWithEmailAndPassword(
                          //           email: email, password: password);

                          Navigator.pushNamed(context, '/login');
                          // } catch (e) {
                          //   print(e);
                          // }
                          // Navigate to login screen if implemented
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
