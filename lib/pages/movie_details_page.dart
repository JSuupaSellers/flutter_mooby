import 'package:flutter/material.dart';
import '../model/movie.dart';
import '../ui/movie_poster.dart';
import '../util/date_formatter.dart';

class MovieDetailsPage extends StatefulWidget {
  Movie _movie;

  MovieDetailsPage(Movie movie) {
    this._movie = movie;
  }

  @override
  State createState() => new MovieDetailsPageState(_movie);
}

final ThemeData _themeData = new ThemeData(
  primaryColor: const Color(0xFF23272A),
  accentColor: const Color(0xFFBC2025),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  canvasColor: const Color(0xFF23272A), //changes navbar color
);

class MovieDetailsPageState extends State<MovieDetailsPage> {
  Movie _movie;
  final double _appbarheight = 256.0;

  MovieDetailsPageState(this._movie);

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: _themeData,
      child: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.share,color: Colors.white,), onPressed: null,),
            new IconButton(icon: new Icon(Icons.more_vert, color: Colors.white,), onPressed: null,)
          ],
        ),
        body: new Column(
          children: <Widget>[
            new MoviePoster(
              photo: _movie.backdrop,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Wrap(
                  spacing: 70.0,
                  children: <Widget>[
                      new Text(_movie.name),
                      new Text('Release Year: ' + DateFormatter.getYear(_movie.releaseDate))
                  ]
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: new Text(_movie.desc),
            )
          ],
        ),
      ),
    );
  }
}