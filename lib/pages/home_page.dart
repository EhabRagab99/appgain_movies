import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import '/models/popular_movies_model.dart';
import '/services/constants.dart';
import '/widgets/custom_listview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of PopularMovies Model I created which represented the fetched data from the API
  List<PopularMovies> popularMoviesList = [];

// a future void function that perform the GET request of the popular movies by the API
  getMovies() async {
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    // print(jsonData['results']);
    jsonData['results'].forEach((movie) {
      PopularMovies popularMovies = PopularMovies.fromJson(movie);
      popularMoviesList.add(popularMovies);
      // print(popularMovies.title);
      // print(popularMovies.popularity);
    });
  }

  @override
  void initState() {
    getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Popular Movies'),
        centerTitle: true,
      ),
      // FutureBuilder widget used here to show a spinner until the data fetched, then it will replace that spinner
      body: FutureBuilder(
        future: getMovies(),
        builder: (context, snapShot) {
          // checking if the data has completely fetched or not
          // if not the following widget will be showed until the future function completed
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.white,
              ),
            );
          } else {
            // ListView.separated widget used here to make a separation between each item
            return CustomListViewWidget(popularMoviesList: popularMoviesList);
          }
        },
      ),
    );
  }
}
