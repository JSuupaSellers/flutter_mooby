import 'dart:async';
import 'NetworkUtil.dart';
import '../model/movie.dart';
import '../util/api_util.dart';

class NetworkData {
  NetworkUtil _networkUtil;

  NetworkData() {
    _networkUtil = new NetworkUtil();
  }

  Future<List<Movie>> fetchPopularMovies(int page) async {
    List<Movie> list = [];
    await _networkUtil.request("https://api.themoviedb.org/3/movie/popular?"
        "api_key=$api_key&language=en-US&page=$page")
        .then((dynamic res) {
      List data = res['results'];
      list = data.map((obj) => new Movie.map(obj)).toList();
    });
    return list;
  }
}