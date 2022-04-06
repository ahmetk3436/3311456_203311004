import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_uygulamasi/dataSource/movie_list.dart';
import 'package:flutter/material.dart';

class FavouriteMovies extends StatefulWidget {
  const FavouriteMovies({Key? key}) : super(key: key);

  @override
  State<FavouriteMovies> createState() => _FavouriteMoviesState();
}

class _FavouriteMoviesState extends State<FavouriteMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("FAVORİLERİM", style: TextStyle(fontSize: 30.0))),
        body: makeList());
  }

  Widget makeList() {
    if (favouriteMovies.isEmpty) {
      return movieImages();
    } else if (favouriteMovies.isNotEmpty) {
      return makeListView();
    } else {
      return Container();
    }
  }

  Center makeListView() {
    return Center(
      child: ListView.builder(
          itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (_) {
                  setState(() {
                    switch (favouriteMovies[index].categoryId) {
                      case 0:
                        movieCategory[0]
                            .movieList[favouriteMovies[index].movieId]
                            .isFavourite = false;
                        break;
                      default:
                    }
                    favouriteMovies.removeAt(index);
                  });
                },
                child: ListTile(
                  leading: CachedNetworkImage(
                      imageUrl: favouriteMovies[index].imgUrl!),
                  title: Text(favouriteMovies[index].movieName),
                  subtitle: Text(favouriteMovies[index].movieExplanation),
                  trailing: const Icon(Icons.movie),
                  isThreeLine: true,
                ),
              ),
          scrollDirection: Axis.vertical,
          itemCount: favouriteMovies.length),
    );
  }

  Widget movieImages() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/6/6b/Beautiful_mind.jpg",
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: SizedBox(
                height: 40,
                width: 200,
                child: Card(
                  color: Colors.amber,
                  child: Center(child: Text("AKIL OYUNLARI")),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl:
                  "https://i.kanald.com.tr/i/kanald/70/0x0/5f345f513ab16617b480a7a8",
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: SizedBox(
                height: 40,
                width: 200,
                child: Card(
                  color: Colors.amber,
                  child: Center(child: Text("MATRIX")),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl:
                  "https://iasbh.tmgrup.com.tr/ee3437/1200/627/0/0/800/417?u=https://isbh.tmgrup.com.tr/sbh/2021/07/27/esaretin-bedeli-konusu-nedir-oyunculari-kimler-kac-odul-aldi-esaretin-bedeli-imdb-puani-1627375947315.jpg",
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: SizedBox(
                height: 40,
                width: 200,
                child: Card(
                  color: Colors.amber,
                  child: Center(child: Text("ESARETİN BEDELİ")),
                )),
          ),
        ],
      ),
    );
  }
}
