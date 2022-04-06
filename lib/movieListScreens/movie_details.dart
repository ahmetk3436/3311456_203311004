import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_uygulamasi/dataSource/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, "/movieAdd", arguments: widget.index);
        },
        child: const Text(
          "Ekle",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 100, 182),
        title: Text(movieCategory[widget.index].categoryName),
        centerTitle: true,
      ),
      body: makeList(),
    );
  }

  Center makeList() {
    return Center(
      child: ListView.builder(
          itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (_) {
                  setState(() {
                    movieCategory[widget.index].movieList.removeAt(index);
                  });
                },
                child: Card(
                  elevation: 8,
                  color: const Color.fromARGB(255, 160, 167, 163),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                          imageUrl: movieCategory[widget.index]
                              .movieList[index]
                              .imgUrl
                              .toString(),
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator()),
                      ListTile(
                        isThreeLine: true,
                        subtitle: Text(movieCategory[widget.index]
                            .movieList[index]
                            .movieExplanation),
                        title: Text(movieCategory[widget.index]
                            .movieList[index]
                            .movieName),
                        trailing: FavoriteButton(
                            iconColor: Colors.yellow,
                            isFavorite: movieCategory[widget.index]
                                .movieList[index]
                                .isFavourite,
                            valueChanged: (favourite) {
                              bool isFavorite = movieCategory[widget.index]
                                  .movieList[index]
                                  .isFavourite!;
                              if (isFavorite) {
                                movieCategory[widget.index]
                                    .movieList[index]
                                    .isFavourite = false;
                                favouriteMovies.remove(
                                    movieCategory[widget.index]
                                        .movieList[index]);
                              } else if (!isFavorite) {
                                movieCategory[widget.index]
                                    .movieList[index]
                                    .isFavourite = true;
                                favouriteMovies.add(movieCategory[widget.index]
                                    .movieList[index]);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
          scrollDirection: Axis.vertical,
          itemCount: movieCategory[widget.index].movieList.length),
    );
  }
}
