import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_uygulamasi/dataSource/movie_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final List<String> moviePhotos = [
    "https://s3-us-west-2.amazonaws.com/prd-rteditorial/wp-content/uploads/2019/12/19112331/1_mOUcX8WpT2K6qi6jZRGRdw.jpg",
    "https://media.wired.com/photos/5df96d610b3cce0008205954/master/pass/Cul-madmax-MCDMAMA-EC188.jpg",
    "https://media.autoexpress.co.uk/image/private/s--vo9SjHSl--/f_auto,t_content-image-full-mobile@1/v1562241855/autoexpress/2015/11/best-movie-cars-header.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 100, 182),
        centerTitle: true,
        title: const Text("HADİ FİLM İZLEYELİM!"),
        leading: GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/profilePage"),
            child: const Icon(Icons.account_circle)),
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) => makeFunction(context, value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Çıkış Yap"),
                value: 0,
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageBuilder(),
            movieChart(),
            makeButton(context),
          ],
        ),
      ),
    );
  }

  Widget movieChart() {
    return SfCartesianChart(
        // Initialize category axis
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: "Yıllara Göre Sinemaya Giden Kişi Sayısı"),
        series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              // Bind data source
              dataSource: <SalesData>[
                SalesData('2018', "1311300934"),
                SalesData('2019', "1228763382"),
                SalesData('2020', "221762724"),
                SalesData('2021', "496534193"),
                SalesData('2022', "782360723")
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => int.parse(sales.sales))
        ]);
  }

  void makeFunction(BuildContext context, int value) {
    switch (value) {
      case 0:
        Hive.box("profileData").clear();
        auth.signOut();
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
        break;
      default:
    }
  }

  Widget makeButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10),
                itemCount: 4,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                      color: Colors.white,
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, buttonRouters[index]);
                          },
                          child: Text(buttonNames[index]),
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 38, 30, 117)),
                        ),
                      ),
                    )),
          ],
        ));
  }

  Container imageBuilder() {
    return Container(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: SizedBox(
          child: CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) {
              final finalImg = moviePhotos[index];
              return buildImage(finalImg, index);
            },
            options: CarouselOptions(height: 200, autoPlay: true),
            itemCount: moviePhotos.length,
          ),
        ),
      ),
    );
  }

  Widget buildImage(String finalImg, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: CachedNetworkImage(
            imageUrl: finalImg,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator()),
      );
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final String sales;
}
