import 'package:film_uygulamasi/dataSource/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
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

class MakeGridView extends StatefulWidget {
  const MakeGridView({
    Key? key,
  }) : super(key: key);

  @override
  State<MakeGridView> createState() => _MakeGridViewState();
}

class _MakeGridViewState extends State<MakeGridView> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4')
      ..addListener(() => setState(() {}))
      ..initialize().then((value) => _controller.play());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          makeList(),
          videoPlayer(),
          video(),
        ],
      ),
    );
  }

  Widget videoPlayer() {
    return GestureDetector(
        onTap: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        },
        child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Center(
              child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller)),
            )));
  }

  Widget video() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 1),
      child: VideoProgressIndicator(
        _controller,
        allowScrubbing: true,
        colors: const VideoProgressColors(
            backgroundColor: Colors.red,
            bufferedColor: Colors.black,
            playedColor: Colors.blueAccent),
      ),
    );
  }

  GridView makeList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        itemCount: movieCategory.length,
        shrinkWrap: true,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
