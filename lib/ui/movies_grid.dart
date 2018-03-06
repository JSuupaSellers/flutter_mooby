import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../model/movie.dart';
import '../pages/movie_details_page.dart';
import 'movie_poster.dart';

Widget getMovieGrid({@required List<Movie> movies, @required BuildContext context,
                      @required int crossAxisCount, Axis scroll = Axis.vertical, @required ScrollController controller}){
  if(movies.length == 0){
    return new Container(
      child: new Center(
        child: new Text("No movies found"),
      ),
    );
  }

  return new GridView.count(
      crossAxisCount: crossAxisCount,
      scrollDirection: scroll,
      controller: controller,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      padding: const EdgeInsets.all(4.0),
      children: movies.map((movie) =>
          new Card(
            child: new GridTile(
                child: new MoviePoster(
                  photo: movie.backdrop,
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) {
                      return new MovieDetailsPage(movie);
                    }));
                  },
                ),
              footer: new GridTileBar(
                backgroundColor: Colors.black54,
                title: new FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: new Text(movie.name),
                ),
              ),
            ),
          )
      ).toList()
  );
}