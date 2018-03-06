import '../base/movie_view.dart';
import '../base/movie_presenter.dart';

abstract class MovieScreenView extends MovieView{

}

class MovieViewPresenter extends MoviePresenter<MovieScreenView>{

  MovieViewPresenter(MovieScreenView view, String tag) : super(view,tag);
  int currentPage = 0;
  @override
  @override
  void loadMovies() {
    super.loadMovies();
    currentPage++;
    networkData.fetchPopularMovies(currentPage).then((list){
        view.onMoviesLoaded(list);
    });
  }

}