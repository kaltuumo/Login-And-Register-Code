import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'display.dart';
// import 'display_screen.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  LoginScreen({super.key});
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
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
                    "Welcome Back!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Log in to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(color: Colors.black),
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
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder()),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/forget');
                  //     },
                  //     child: const Text(
                  //       "Forgot Password?",
                  //       style: TextStyle(color: Colors.blue),
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/changepassword');
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),

                  // child: child),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      // if (user != null) {
                      //   Navigator.pushNamed(context, '/display');
                      // }
                      try {
                        final userCredential =
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                        final user = userCredential.user;
                        if (user != null) {
                          Navigator.pushNamed(context, '/display');
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text('Login failed. Please try again.'),
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
                      } catch (e) {
                        print(e);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Login failed. Please try again.'),
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
                      // backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 18,
                        // color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          "Sign Up",
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
