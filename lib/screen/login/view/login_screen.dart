import 'package:flutter/material.dart';

import '../../../utils/helper/auth_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: FlutterLogo(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Login In Now",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text("Please login to continue using our app"),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text("Enter your email"),
              const SizedBox(
                height: 08,
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.sizeOf(context).width - 20,
                child: TextFormField(
                  controller: txtEmail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Enter your password"),
              const SizedBox(
                height: 08,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Forget password ?"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FilledButton(
                  onPressed: () async {
                    String? msg = await AuthHelper.helper
                        .signIn(txtEmail.text, txtPassword.text);

                    if (msg == "Success") {
                      AuthHelper.helper.checkUser();
                      Navigator.pushNamed(context, '/profile');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${msg}"),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text("Or"),
              ),
              const SizedBox(
                height: 10,
              ),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/register');
              //     },
              //     child: const Text("Sign up"),
              //   ),
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       AuthHelper.helper.signInWithGoogleEmailAndPassword();
              //     },
              //     child: const Text("Google")),
              Center(
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async {
                      await AuthHelper.helper
                          .signInWithGoogleEmailAndPassword();
                      AuthHelper.helper.checkUser();
                    },
                    child: Image.asset("assets/images/google.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Create a new Account. "),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
