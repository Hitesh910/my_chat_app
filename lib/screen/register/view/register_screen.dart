import 'package:flutter/material.dart';
import 'package:mychat_app/utils/helper/auth_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                )),
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  String? msg = await AuthHelper.helper
                      .signUp(txtEmail.text, txtPassword.text);

                  if (msg == "Success") {
                    Navigator.pop(context);
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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
