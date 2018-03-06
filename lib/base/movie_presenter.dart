import 'movie_view.dart';
import '../network/network_data.dart';


abstract class MoviePresenter<T extends MovieView>{
  T _view;
  NetworkData _networkData;
  String _tag;

  MoviePresenter(this._view, this._tag){
    _networkData = new NetworkData();
  }

  void loadMovies(){

  }

  String get tag => _tag;

  NetworkData get networkData => _networkData;
  T get view => _view;
}