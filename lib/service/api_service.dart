
import 'package:dio/dio.dart';


class ApiServices{
  static final dio = Dio(
  //     BaseOptions(
  //   baseUrl: 'https://www.themealdb.com/api/json/v1/1'
  // )
  );

  static Future getMealData () async{
    try{
      final response = await dio.post('https://translate-plus.p.rapidapi.com/translate',
      queryParameters: {

      },
      data: {
        'text': 'Hello , How are you',
        'source': 'en',
        'target': 'ne'

      },
        options: Options(
            headers:{
              'content-type': 'application/json',
              'X-RapidAPI-Key': 'e34704d382msh9d2e1a29cd5f585p160fc4jsn2843335a0abb',
              'X-RapidAPI-Host': 'translate-plus.p.rapidapi.com'

            }
        )

      );
      print(response);
      return response.data;
    }on DioException catch (err){
      print(err);
      throw '${err.message}';

    }
  }
}

