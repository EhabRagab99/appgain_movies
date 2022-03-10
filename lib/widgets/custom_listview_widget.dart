import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '/models/popular_movies_model.dart';
import '/pages/movie_details.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({
    Key? key,
    required this.popularMoviesList,
  }) : super(key: key);

  final List<PopularMovies> popularMoviesList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shrinkWrap: true,
      itemBuilder: (context, index) => Column(
        children: [
          ...popularMoviesList
              .map((movie) => InkWell(
                    onTap: () {
                      // through the navigation to the page that display contents of the movie
                      // we sent parameters of that movie to be showed based on it
                      Navigator.pushNamed(context, MovieDetailsPage.routeName,
                          arguments: {
                            'id': movie.id,
                            'adult': movie.adult,
                            'original_language': movie.originalLanguage,
                            'title': movie.title,
                            'banner':
                                'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                            'overview': movie.overview,
                            'popularity': movie.popularity,
                            'release': movie.releaseDate,
                            'vote_average': movie.voteAverage,
                            'vote_count': movie.voteCount,
                          });
                    },
                    child: Card(
                      color: Colors.grey,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 10,
                      child: Stack(
                        children: [
                          // CachedNetworkImage widget used to save the fetched images to the device cache memory
                          // instead of fetching it every time
                          CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                            placeholder: (context, url) => Center(
                              child: SpinKitFadingCircle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              // leading: CircleAvatar(
                              //
                              //   child: Text('${movieNumber++}'),
                              // ),
                              title: Container(
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '${movie.title}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
      separatorBuilder: (context, index) => SizedBox(),
      itemCount: popularMoviesList.length,
    );
  }
}
