import 'dart:async';
import 'NetworkUtil.dart';
import '../model/movie.dart';

class NetworkData {
  NetworkUtil _networkUtil;
  final String apiKey = '218b2cb0d2e481bd41153409ce64f037';

  NetworkData() {
    _networkUtil = new NetworkUtil();
  }

  Future<List<Movie>> fetchPopularMovies(int page) async {
    List<Movie> list = [];
    await _networkUtil.request("https://api.themoviedb.org/3/movie/popular?"
        "api_key=$apiKey&language=en-US&page=$page")
        .then((dynamic res) {
      List data = res['results'];
      list = data.map((obj) => new Movie.map(obj)).toList();
    });
    return list;
  }
}