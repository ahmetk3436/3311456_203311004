import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 100.0, left: 10, right: 10),
      child: Column(
        children: [
          emailFormField("Hatalı giriş", textEditingController),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  resetPassword(textEditingController.text.toString(), context);
                },
                child: const Text("Send E-mail")),
          ),
        ],
      ),
    );
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    Navigator.pushNamed(context, "/home");
  }

  TextFormField emailFormField(
      String failInput, TextEditingController textEditingController) {
    return TextFormField(
      controller: textEditingController,
      autocorrect: true,
      decoration: InputDecoration(
          errorText: failInput,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("E-mail"),
          hintText: "abcdefgh@gmail.com"),
    );
  }
}
