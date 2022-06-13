import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, dynamic>> _items = [];
  final profileData = Hive.box("profileData");

  @override
  Widget build(BuildContext context) {
    if (checkProfile()) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profil Sayfası"),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Giriş yapılan email : " +
                          auth.currentUser!.email.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 18)),
                ),
                profileDetail(),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("KAYIT SAYFASI"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Image(
                      image: AssetImage(
                          "assets/images/blank-profile-picture-973460_640.png"),
                    ),
                  ),
                  const Text(
                    "KAYITLI KULLANICI BULUNAMADI",
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                        child: const Text(
                          "Kayıt ol",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 50),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/registerAndLogin");
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  void _refreshItems() {
    final data = profileData.keys.map((key) {
      final value = profileData.get(key);
      return {
        "key": key,
        "name": value["name"],
        "birthDate": value["birthDate"],
        "age": value["age"]
      };
    }).toList();
    setState(
      () {
        _items = data.reversed.toList();
      },
    );
  }

  Widget profileDetail() {
    if (profileData.isEmpty || auth.currentUser == null) {
      return Container();
    } else if (profileData.isNotEmpty && auth.currentUser != null) {
      _refreshItems();
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Ad : " + _items[0]["name"].toString(),
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Doğum Tarihi : " + _items[0]["birthDate"].toString(),
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Yaş : " + _items[0]["age"].toString(),
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, fontSize: 18)),
            ),
            Lottie.network(
                "https://assets10.lottiefiles.com/packages/lf20_cbrbre30.json")
          ],
        ),
      );
    } else {
      return Container();
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
