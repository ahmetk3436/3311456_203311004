import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../dataSource/api_source.dart';
import 'package:http/http.dart' as http;

class EditorChoices extends StatefulWidget {
  const EditorChoices({Key? key}) : super(key: key);
  @override
  State<EditorChoices> createState() => _EditorChoicesState();
}

class _EditorChoicesState extends State<EditorChoices> {
  late Future<Movies> movies;
  Future<Movies> fetchMovie() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/ahmetk3436/json/main/movies.json'));

    if (response.statusCode == 200) {
      return moviesFromMap(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    movies = fetchMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("EDİTÖRÜN HAFTALIK SEÇİMLERİ",
                style: TextStyle(fontSize: 20.0))),
        body: editorBody());
  }

  Widget editorBody() {
    return FutureBuilder<Movies>(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.amber,
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: snapshot.data!.movies[index].imgUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    fit: BoxFit.fill,
                  ),
                  ListTile(
                    isThreeLine: true,
                    title: Text(
                      snapshot.data!.movies[index].movieName,
                      style: const TextStyle(fontSize: 25),
                    ),
                    subtitle:
                        Text(snapshot.data!.movies[index].movieExplanation),
                    trailing: RatingBar.builder(
                      initialRating: snapshot.data!.movies[index].imdbPoint / 2,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 20,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        size: 5,
                        color: Colors.blue,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                ],
              ),
            ),
            itemCount: snapshot.data!.movies.length,
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
