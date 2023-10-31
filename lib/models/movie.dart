




class Movie{
  final String title;
  final String poster_path;
  final String overview;
  final int id;
  final String vote_average;
  final String backdrop_path;

  Movie({
    required this.title,
    required this.backdrop_path,
    required this.id,
    required this.overview,
    required this.poster_path,
    required this.vote_average

});

  factory Movie.fromJson(Map<String, dynamic>json){
    return Movie(
        title: json['title']?? '',
        backdrop_path: 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
        id: json['id'],
        overview: json['overview'],
        poster_path: 'https://image.tmdb.org/t/p/w500${ json['poster_path']}',
        vote_average: '${json['vote_average']}'
    );
  }
}