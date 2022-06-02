import 'package:film_uygulamasi/dataSource/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (checkProfile()) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profil Sayfası"),
          actions: [
            PopupMenuButton<int>(
              onSelected: (value) => makeFunction(context, value),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text("Profili Düzenle"),
                  value: 0,
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  "Giriş yapılan email : " + auth.currentUser!.email.toString(),
                  style: const TextStyle(
                      fontSize: 17, fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      );
    } else {
      return ElevatedButton(
          child: const Text(
            "Kayıt ol",
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 50),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/registerAndLogin");
          });
    }
  }

  Widget profileDetail() {
    if (user.isEmpty) {
      return Container();
    } else {
      return Column(
        children: [
          Text(user[0].fullName),
          Text(user[0].birthDate),
          Text(user[0].age.toString()),
        ],
      );
    }
  }

  void makeFunction(BuildContext context, int value) {
    switch (value) {
      case 0:
        Navigator.pushNamed(context, "/profileUpdate");
        break;
      default:
    }
  }
}

bool checkProfile() {
  if (auth.currentUser != null) {
    return true;
  } else {
    return false;
  }
}
