import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);
  static const routeName = '/movie_details';

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetailsPage> {
  // List<MovieDetails> movieDetailsList = [];
  // List<BelongsToCollection> belongsToCollectionList = [];
  // List<Genres> genresList = [];
  // List<ProductionCompanies> productionCompaniesList = [];
  // List<ProductionCountries> productionCountriesList = [];
  // List<SpokenLanguages> spokenLanguagesList = [];
  //
  // final url = Uri.parse(
  //     'https://api.themoviedb.org/3/movie/634649?api_key=2932fa98d58fe6796b5b5bc47db7e670&language=en-US');

  // getData(int id) async {
  //   http.Response response = await http.get(Uri.parse(
  //       'https://api.themoviedb.org/3/movie/$id?api_key=2932fa98d58fe6796b5b5bc47db7e670&language=en-US'));
  //   var jsonData = jsonDecode(response.body.toString());
  //   jsonData.forEach((details) {
  //     MovieDetails movieDetails = MovieDetails.fromJson(details);
  //     print(movieDetails.title);
  //   }).toList();
  //   // print(jsonData);
  //   // jsonData['belongs_to_collection'].forEach((collection) {
  //   //   BelongsToCollection belongsToCollection =
  //   //       BelongsToCollection.fromJson(collection);
  //   //   belongsToCollectionList.add(collection);
  //   // });
  //   // jsonData['genres'].forEach((collection) {
  //   //   Genres geners = Genres.fromJson(collection);
  //   //   genresList.add(collection);
  //   //   print(genresList);
  //   // });
  //   // jsonData['production_companies'].forEach((collection) {
  //   //   ProductionCompanies productionCompanies =
  //   //       ProductionCompanies.fromJson(collection);
  //   //   productionCompaniesList.add(collection);
  //   // });
  //   //
  //   // jsonData['production_countries'].forEach((collection) {
  //   //   ProductionCountries productionCountries =
  //   //       ProductionCountries.fromJson(collection);
  //   //   productionCountriesList.add(collection);
  //   // });
  //   // jsonData['spoken_languages'].forEach((collection) {
  //   //   SpokenLanguages spokenLanguages = SpokenLanguages.fromJson(collection);
  //   //   spokenLanguagesList.add(collection);
  //   // });
  //   // print(spokenLanguagesList);
  //
  //   // print(jsonData);
  //
  //   // print(jsonData['belongs_to_collection']);
  //   // print(jsonData['genres']);
  //   // print(jsonData['production_companies']);
  //
  //   // jsonData.forEach((movie) {
  //   //   MovieDetails movieDetails = MovieDetails.fromJson(movie);
  //   //   movieDetailsList.add(movieDetails);
  //   //   print(movieDetailsList);
  //   //   // print(movieDetails.overview.toString());
  //   //   // print(popularMovies.title);
  //   //   // print(popularMovies.popularity);
  //   // });
  // }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final Map? details = routeArgs;
    // getData(details!['id']);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff2c3840),
            image: DecorationImage(
              image: CachedNetworkImageProvider(details!['banner']),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: details['banner'],
                      ),
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                details['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Released:  ${details['release']}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        details['vote_average'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                details['overview'],
                style: TextStyle(
                  color: Colors.white,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
