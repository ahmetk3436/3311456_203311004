import 'package:film_uygulamasi/controller/Router.dart';
import 'package:film_uygulamasi/mainScreen/body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routerr.generateRoute,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 57, 100, 182),
          centerTitle: true,
          title: const Text("HADİ FİLM İZLEYELİM!"),
        ),
        body: const MainBody(),
      ),
    );
  }
}
