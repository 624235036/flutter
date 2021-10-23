import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterapp/src/configs/api.dart';
import 'package:flutterapp/src/model/upcoming_movie_model.dart';
import 'package:flutterapp/src/model/video_model.dart';

class NetworkServices{
  NetworkServices._internal();

  static final NetworkServices _instace = NetworkServices._internal();

  factory NetworkServices() => _instace;

  static final Dio _dio = Dio();



  Future<UpcomingMovieModel> getUpcomingMovieDio()  async {
    final response = await _dio.get(API.MOVIE_URL);
    if (response.statusCode == 200) {
      return upcomingMovieModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<VideoModel> getVideoDio(String id) async {
    String vdoUrl = 'https://api.themoviedb.org/3/movie/';
    String key = '/videos?api_key=f90f90edb1f32dda20177c1d264d2b0f&language=en-US';

    final response = await _dio.get(vdoUrl+id+key);
    if (response.statusCode == 200) {
      return videoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }
}// end class