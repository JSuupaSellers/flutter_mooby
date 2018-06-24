class Movie {
  final int id;
  final String name;
  final String poster;
  final String backdrop;
  final String desc;
  final String releaseDate;

  Movie({this.id, this.name, this.poster, this.backdrop, this.releaseDate, this.desc});

  Movie.map(Map<String, dynamic> map):
      id = map['id'],
      name = map['original_title'],
      poster = "http://image.tmdb.org/t/p/w342${map['poster_path']}",
      backdrop = "http://image.tmdb.org/t/p/w500${map['backdrop_path']}",
      releaseDate = map['release_date'],
      desc = map['overview'];

  Movie.fromDb(Map<String, dynamic> map):
        id = map['id'],
        name = map['name'],
        poster = map['poster'],
        backdrop = map['backdrop'],
        releaseDate = map['release_Date'],
        desc = map['desc'];
}