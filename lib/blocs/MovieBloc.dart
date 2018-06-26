import 'dart:async';
import '../model/movie.dart';
import '../network/network_data.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc{
  final NetworkData api;

  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<String> _query = RelaySubject<String>();

  Stream<String> get log => _log;
  Stream<List<Movie>> get results => _results;
  Sink<String> get query => _query;

  MovieBloc(this.api, int page){
    _results = _query.distinct().asyncMap(api.fetchPopularMovies(page)).asBroadcastStream();

    _log = Observable(results).withLatestFrom(_query.stream, (_, query) => 'Results for $query').asBrodcastStream();
  }

  void dispose(){
    _query.close();
  }
}