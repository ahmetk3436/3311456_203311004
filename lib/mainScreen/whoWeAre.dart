import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 101, 87, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 100, 182),
        centerTitle: true,
        title: const Text("BİZ KİMİZ ?"),
      ),
      body: body(),
    );
  }

  Widget body() {
    List<String> selcukPhotos = [
      "https://img.piri.net/mnresize/840/-/resim/imagecrop/2021/11/08/01/09/resized_d4799-dc0ec272selcukuniversitesiyataygecistakvimi20213.jpg",
      "https://yt3.ggpht.com/ytc/AKedOLR5QchPiCRovwcUsJvTiRK47K2Q7qg9GBotheAX_w=s900-c-k-c0x00ffffff-no-rj",
      "https://media-cdn.t24.com.tr/media/library/2020/07/1595323633037-new-project-3.jpg"
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          makeSelcukPhotos(selcukPhotos),
          explanationText(),
          bodyText(),
        ],
      ),
    );
  }

  Center explanationText() => const Center(
          child: Text(
        "BİZ PUVOGUZ!",
        style: TextStyle(fontSize: 25.0, color: Colors.white),
      ));
  Padding bodyText() => const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          "Biz 2022 yılında Selçuk Üniversitesinde kurulan bir topluluğuz. Adımız PUVOG.Kuruluşumuzdaki amaç öğrencilere oyun geliştirme konusunda eğitim vermek ek olarak yazılım desteği sunmak ve bunun yanında onlara teknofest gibi proje bazlı görevlerde yer alabilmelerini sağlamak.",
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      );
  Widget makeSelcukPhotos(List<String> selcukPhotos) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        final finalImg = selcukPhotos[index];
        return buildImage(finalImg, index);
      },
      options: CarouselOptions(height: 250),
    );
  }

  Widget buildImage(String finalImg, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          imageUrl: finalImg,
          fit: BoxFit.cover));
}
