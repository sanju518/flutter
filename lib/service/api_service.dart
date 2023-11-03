import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterspod/models/movie.dart';
import 'package:flutterspod/shared/client_provider.dart';

import 'package:flutterspod/constants/api.dart';




final apiService = Provider((ref) => ApiService(ref.watch(clientProvider)));

class ApiService {

  final Dio dio;
  ApiService(this.dio);


  Future<Either<String, List<Movie>>> getMovieByCategory({required String apiPath, required int page})async{
    try{
      final response = await dio.get(apiPath,
        queryParameters: {
          'page': 1
        },
      );
      return Right((response.data['results'] as List).map(
              (e) => Movie.fromJson(e)).toList());
    }on DioException catch(err){
      return Left('${err.response}');
    }


  }




  Future<Either<String, List<Movie>>> getSearchMovie({required String query})async{
    try{
      final response = await dio.get(Api.getSearchMovie,
        queryParameters: {
          'page': 1
        },
      );
      return Right((response.data['results'] as List).map(
              (e) => Movie.fromJson(e)).toList());
    }on DioException catch(err){
      return Left('${err.response}');
    }


  }



}