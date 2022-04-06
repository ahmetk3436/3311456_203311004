import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_uygulamasi/dataSource/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MovieAdd extends StatefulWidget {
  const MovieAdd({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<MovieAdd> createState() => _MovieAddState();
}

class _MovieAddState extends State<MovieAdd> {
  int movieId = 0;
  String movieName = "";
  double imdbPoint = 0.0;
  String movieExplanation = "";
  int outDate = 2022;
  String imgUrl =
      "https://image.shutterstock.com/image-vector/cinema-film-strip-wave-reel-260nw-1422026513.jpg";
  final TextEditingController textEditingControllerMovieName =
      TextEditingController();
  final TextEditingController textEditingControllerMovieExplanation =
      TextEditingController();
  final TextEditingController textEditingControllerMovieOutDate =
      TextEditingController();
  final TextEditingController textEditingControllerMoviePoint =
      TextEditingController();
  final TextEditingController textEditingControllerMoviePhotoUrl =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    String failInput = "Hatalı veya Eksik giriş yaptınız";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Film Ekleme Sayfası"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://galeri14.uludagsozluk.com/861/bitti-diyen-kiza-tamam-sen-bilirsin-diyen-erkek_1931536.gif",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              TextFormField(
                autocorrect: true,
                controller: textEditingControllerMovieName,
                decoration: InputDecoration(
                    errorText: failInput,
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)),
                    label: const Text("Film Adı"),
                    hintText: "Çılgın Kaçış"),
                onChanged: (String value) {
                  setState(() {
                    movieName = value;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                autocorrect: true,
                controller: textEditingControllerMovieExplanation,
                decoration: InputDecoration(
                    errorText: failInput,
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)),
                    label: const Text("Film Açıklaması"),
                    hintText: "İki kardeşin hapishaneden kaçışını anlatıyor."),
                onChanged: (String value) {
                  setState(() {
                    movieExplanation = value;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'\d+'))
                ],
                autocorrect: true,
                controller: textEditingControllerMovieOutDate,
                decoration: InputDecoration(
                    errorText: failInput,
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)),
                    label: const Text("Çıkış Yılı"),
                    hintText: "2022"),
                onChanged: (String value) {
                  setState(() {
                    outDate = int.parse(value);
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'\d*\.?\d+'))
                ],
                autocorrect: true,
                controller: textEditingControllerMoviePoint,
                decoration: InputDecoration(
                    errorText: failInput,
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.black26)),
                    label: const Text("Puanı")),
                onChanged: (String value) {
                  setState(() {
                    imdbPoint = double.parse(value);
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                autocorrect: true,
                controller: textEditingControllerMoviePhotoUrl,
                decoration: InputDecoration(
                    errorText: failInput,
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)),
                    label: const Text("Fotoğraf Linki")),
                onChanged: (String value) {
                  setState(() {
                    imgUrl = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    movieCategory[widget.index].movieList.add(MovieList(
                          categoryId: widget.index,
                          isFavourite: true,
                          imgUrl: imgUrl,
                          movieId:
                              movieCategory[widget.index].movieList.length + 1,
                          movieName: movieName,
                          imdbPoint: imdbPoint,
                          movieExplanation: movieExplanation,
                          outDate: outDate,
                        ));
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/movieDetails",
                        arguments: widget.index);
                  },
                  child: const Text("Kaydet")),
            ],
          ),
        ),
      ),
    );
  }
}
