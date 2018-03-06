import 'package:flutter/material.dart';
import '../ui/movies_grid.dart';
import '../network/network_data.dart';
import '../model/movie.dart';
import '../presenters/movie_view_presenter.dart';

class SearchPage extends StatefulWidget {
  @override
  State createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> implements MovieScreenView{
  List<Movie> movies;
  MovieViewPresenter _presenter;
  NetworkData networkData;
  ScrollController controller;

  @override
  void initState(){
    super.initState();
    movies = new List();
    controller = new ScrollController();
    controller.addListener((){
      if(controller.position.maxScrollExtent == controller.offset){
        _presenter.loadMovies();
      }
    });
    _presenter = new MovieViewPresenter(this, "searchMovie");
    _presenter.loadMovies();
  }

  @override
  void onMoviesLoaded(List<Movie> list) {
    setState((){
      movies.addAll(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return new Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Search'),
        ),
        body: getMovieGrid(movies: movies, context: context, crossAxisCount: 2, controller: controller),
      ),
    );
  }
}