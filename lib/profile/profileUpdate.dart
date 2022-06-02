import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_uygulamasi/dataSource/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String failInput = "Hatalı giriş";
    TextEditingController textEditingControllerName = TextEditingController();
    TextEditingController textEditingControllerBirthDate =
        TextEditingController();
    TextEditingController textEditingControllerAge = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Düzenleme Sayfası")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: fullNameFormField(failInput, textEditingControllerName),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  birthDateFormField(failInput, textEditingControllerBirthDate),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ageFormField(failInput, textEditingControllerAge),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text(
                    "Kaydet",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (textEditingControllerName.text.isNotEmpty &&
                        textEditingControllerBirthDate.text.isNotEmpty &&
                        textEditingControllerAge.text.isNotEmpty) {
                      user.clear();
                      user.add(User(
                          fullName: textEditingControllerName.text,
                          birthDate: textEditingControllerBirthDate.text,
                          age: int.parse(textEditingControllerAge.text)));
                      Navigator.pushNamed(context, "/profilePage");
                    } else {
                      Fluttertoast.showToast(
                          msg: "LÜTFEN BİLGİLERİ DOĞRU GİRİNİZ !");
                    }
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: CachedNetworkImage(
                imageUrl:
                    "https://1.bp.blogspot.com/-qx4k0OMmw8U/XxMXXTRS76I/AAAAAAAAA-k/bUkrVVA-TVw1th-W86QpiPBnudibu7jMgCLcBGAsYHQ/s1600/youtube-instagram-sosyal-medya-profil-resmi-sayfa-kapak-hazirlamak-kaliteli-ucretsiz-canva-program-site-izlenme-arttirma.jpg",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            )
          ]),
        ),
      ),
    );
  }

  TextFormField fullNameFormField(
      String failInput, TextEditingController textEditingControllerName) {
    return TextFormField(
      autocorrect: true,
      controller: textEditingControllerName,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("Ad-Soyad"),
          hintText: "Ahmet Coşkun Kızılkaya"),
    );
  }

  TextFormField birthDateFormField(
      String failInput, TextEditingController textEditingControllerBirthDate) {
    return TextFormField(
      autocorrect: true,
      controller: textEditingControllerBirthDate,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("Doğum Tarihi"),
          hintText: "23/05/2001"),
    );
  }

  TextFormField ageFormField(
      String failInput, TextEditingController textEditingControllerAge) {
    return TextFormField(
      controller: textEditingControllerAge,
      autocorrect: true,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("Yaş"),
          hintText: "21"),
    );
  }
}
