import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_uygulamasi/dataSource/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final List<String> moviePhotos = [
    "https://s3-us-west-2.amazonaws.com/prd-rteditorial/wp-content/uploads/2019/12/19112331/1_mOUcX8WpT2K6qi6jZRGRdw.jpg",
    "https://media.wired.com/photos/5df96d610b3cce0008205954/master/pass/Cul-madmax-MCDMAMA-EC188.jpg",
    "https://media.autoexpress.co.uk/image/private/s--vo9SjHSl--/f_auto,t_content-image-full-mobile@1/v1562241855/autoexpress/2015/11/best-movie-cars-header.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imageBuilder(),
        makeButton(context),
      ],
    );
  }

  Widget makeButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 180.0, left: 10, right: 10),
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
