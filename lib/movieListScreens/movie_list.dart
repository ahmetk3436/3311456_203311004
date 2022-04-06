import 'package:film_uygulamasi/dataSource/movie_list.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 100, 182),
        centerTitle: true,
        title: const Text("HADİ FİLM SEÇELİM!"),
      ),
      body: const MakeGridView(),
    );
  }
}

class MakeGridView extends StatelessWidget {
  const MakeGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        itemCount: movieCategory.length,
        itemBuilder: (context, index) => Container(
              color: Colors.white,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/movieDetails",
                        arguments: index);
                  },
                  child: Text(movieCategory[index].categoryName),
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 38, 30, 117)),
                ),
              ),
            ));
  }
}
