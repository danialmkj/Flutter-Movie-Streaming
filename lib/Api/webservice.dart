import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:movie_player/Api/jsonparser.dart';
import 'package:movie_player/Model/new_movie.dart';
import 'package:movie_player/Model/popular_movie.dart';
import 'package:movie_player/Model/search_model.dart';
import 'package:movie_player/Model/special_movie.dart';

class WebService {
  static Future<List<PopularMovie>> getPopularMovie() async {
    String url = "https://androidsupport.ir/pack/aparat/getBestVideos.php";

    List<PopularMovie> list_popular_movie = [];

    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      list_popular_movie = await JsonParser.getPopularMovie(response);
    } else {
      print('list populat in webservice 1 is +$list_popular_movie');
      return list_popular_movie;
    }
    print('list populat in webservice  2 is  +$list_popular_movie');
    return list_popular_movie;
  }

  static Future<List<NewMovie>> getNewMovie() async {
    String url = "https://androidsupport.ir/pack/aparat/getNewVideos.php";

    List<NewMovie> list_new_movie = [];

    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      list_new_movie = await JsonParser.getNEwMovie(response);
    } else {
      print('list populat in webservice 1 is +$list_new_movie');
      return list_new_movie;
    }
    print('list populat in webservice  2 is  +$list_new_movie');
    return list_new_movie;
  }

  static Future<List<SpecialMovie>> getSpecialMovie() async {
    String url = "https://androidsupport.ir/pack/aparat/getSpecial.php";

    List<SpecialMovie> list_special_movie = [];

    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      list_special_movie = await JsonParser.getSpecialMovie(response);
    } else {
      print('list populat in webservice 1 is +$list_special_movie');
      return list_special_movie;
    }
    print('list populat in webservice  2 is  +$list_special_movie');
    return list_special_movie;
  }

  static Future<List<Search>> getSearchMovie({String? myInput}) async {
    String url ="https://androidsupport.ir/pack/aparat/search.php?title=$myInput";

    List<Search> list_search = [];

    Response response = await http.get(Uri.parse(url),);

    if (response.statusCode == 200) {
      list_search = JsonParser.getSearchMovie(response);
    } else {
      print('list populat in webservice 1 is +$list_search');
      return list_search;
    }
    print('list populat in webservice  2 is  +$list_search');
    return list_search;
  }
}
