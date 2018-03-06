import 'package:flutter/material.dart';
import '../model/movie.dart';
import '../ui/movie_poster.dart';

class MovieDetailsPage extends StatefulWidget{
  Movie _movie;

  MovieDetailsPage(Movie movie){
    this._movie = movie;
  }

  @override
  State createState() => new MovieDetailsPageState(_movie);
}

class MovieDetailsPageState extends State<MovieDetailsPage>{
  Movie _movie;
  final double _appbarheight = 256.0;

  MovieDetailsPageState(this._movie);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar:  new AppBar(
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.share), onPressed: null),
          new IconButton(icon: new Icon(Icons.more_vert), onPressed: null)
        ],

      ),
      body: new Column(
        children: <Widget>[
          new MoviePoster(
            photo: _movie.backdrop,
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Row(
                children: <Widget>[
                  new Flexible(
                    child: new Text(_movie.name),
                  ),
                ]
            ),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: new Text(_movie.desc),
          )
        ],
      ),
    );
  }
}