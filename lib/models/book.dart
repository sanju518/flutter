



class Book{
  final String title;
  final String detail;
  final String imageUrl;
  final String rating;
  final String genre;



  Book({
    required this.detail,
    required this.genre,
    required this.imageUrl,
    required this.rating,
    required this.title,

});
  factory Book.fromJshon(Map<String, dynamic> Jshon){
    return Book(
      detail:Jshon['detail'],
      genre: Jshon['genre'],
        imageUrl: Jshon['imageUrl'],
        rating: Jshon['rating'],
        title: Jshon['title']
    );

  }
}