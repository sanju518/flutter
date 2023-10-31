
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterspod/models/movie.dart';
import 'package:flutterspod/constants/api.dart';

import 'package:flutterspod/shared/client_provider.dart ';

final apiService = FutureProvider((ref) => ApiService(ref.watch(clientProvider)).getMovieCategory());
class ApiService{
  //static final dio = Dio(
  //     BaseOptions(
  //   baseUrl: 'https://www.themealdb.com/api/json/v1/1'
  // )
  //);

  final Dio dio;
  ApiService(this.dio);


   Future<List<Movie>> getMovieCategory () async{
    try{
      // final response = await dio.post('https://translate-plus.p.rapidapi.com/translate?query=horror&page=5',
      // queryParameters: {
      //   'query': 'hudhksdh',
      //   'page': 5
      //
      // },
      // data: {
      //   'text': 'Hello , How are you',
      //   'source': 'en',
      //   'target': 'ne'
      //
      // },
      //   options: Options(
      //       headers:{
      //         'content-type': 'application/json',
      //         'X-RapidAPI-Key': 'e34704d382msh9d2e1a29cd5f585p160fc4jsn2843335a0abb',
      //         'X-RapidAPI-Host': 'translate-plus.p.rapidapi.com'
      //
      //       }
      //   )
      //
      // );
      //print(response);
     // return response.data;
      final response = await dio.get(Api.getPopular);
      return (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();



    }on DioException catch (err){
      print(err);
      throw '${err.message}';

    }
  }
}

