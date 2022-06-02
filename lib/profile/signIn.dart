import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscureText = true;
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String failInput = "Hatalı giriş yapıldı";
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
          child: emailFormField(failInput, textEditingControllerEmail),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
          child: passwordFormField(failInput, textEditingControllerPassword),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/resetPassword");
            },
            child: const Text(
              "Forgot Password ?",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  letterSpacing: 1.5,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Align(
            heightFactor: 1.2,
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                  elevation: 8,
                  color: Colors.blue,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () async {
                        if (textEditingControllerEmail.text.isNotEmpty &&
                            textEditingControllerPassword.text.isNotEmpty) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: textEditingControllerEmail.text,
                                    password:
                                        textEditingControllerPassword.text);
                            if (auth.currentUser != null) {
                              Navigator.pushNamed(context, "/home");
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        }
                      },
                      child: const Center(
                          child: Text(
                        "Continue",
                        style: TextStyle(fontSize: 18),
                      )))),
            )),
      ],
    );
  }

  TextFormField emailFormField(
      String failInput, TextEditingController textEditingControllerEmail) {
    return TextFormField(
      controller: textEditingControllerEmail,
      autocorrect: true,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("E-mail"),
          hintText: "abcdefgh@gmail.com"),
    );
  }

  TextFormField passwordFormField(
      String failInput, TextEditingController textEditingControllerPassword) {
    return TextFormField(
      controller: textEditingControllerPassword,
      autocorrect: true,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("Password"),
          hintText: "123456abcdef"),
      obscureText: obscureText,
    );
  }
}
