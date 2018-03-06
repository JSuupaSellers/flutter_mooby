import '../model/movie.dart';

abstract class MovieView{
  void onMoviesLoaded(List<Movie> movies);
}