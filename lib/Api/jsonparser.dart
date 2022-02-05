import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_player/Model/new_movie.dart';
import 'package:movie_player/Model/popular_movie.dart';
import 'package:movie_player/Model/search_model.dart';
import 'package:movie_player/Model/special_movie.dart';

class JsonParser {
  //get popular Movie
  static List<PopularMovie> getPopularMovie(Response response) {
    List<PopularMovie> listProduct = [];

    List<dynamic> body = jsonDecode(response.body);
    body.forEach((element) {
      Map item = element;
      String id = item['id'];
      String cat_id = item['cat_id'];
      String title = item['title'];
      String icon = item['icon'];
      String creator = item['creator'];
      String description = item['description'];
      String link = item['link'];
      String view = item['view'];
      String time = item['time'];
      String special = item['special'];

      listProduct.add(PopularMovie(
          id: id,
          catId: cat_id,
          title: title,
          icon: icon,
          creator: creator,
          description: description,
          link: link,
          view: view,
          time: time,
          special: special));
    });

    return listProduct;
  }

  //get New Movie
  static List<NewMovie> getNEwMovie(Response response) {
    List<NewMovie> listNewMovie = [];

    List<dynamic> body = jsonDecode(response.body);
    body.forEach((element) {
      Map item = element;
      String id = item['id'];
      String catId = item['cat_id'];
      String title = item['title'];
      String icon = item['icon'];
      String creator = item['creator'];
      String description = item['description'];
      String link = item['link'];
      String view = item['view'];
      String time = item['time'];
      String special = item['special'];

      listNewMovie.add(NewMovie(
          id: id,
          catId: catId,
          title: title,
          icon: icon,
          creator: creator,
          description: description,
          link: link,
          view: view,
          time: time,
          special: special));
    });

    return listNewMovie;
  }

  //get New Movie
  static List<SpecialMovie> getSpecialMovie(Response response) {
    List<SpecialMovie> listSpecialMovie = [];

    List<dynamic> body = jsonDecode(response.body);
    body.forEach((element) {
      Map item = element;
      String id = item['id'];
      String catId = item['cat_id'];
      String title = item['title'];
      String icon = item['icon'];
      String creator = item['creator'];
      String description = item['description'];
      String link = item['link'];
      String view = item['view'];
      String time = item['time'];
      String special = item['special'];

      listSpecialMovie.add(SpecialMovie(
          id: id,
          catId: catId,
          title: title,
          icon: icon,
          creator: creator,
          description: description,
          link: link,
          view: view,
          time: time,
          special: special));
    });

    return listSpecialMovie;
  }

  //search page
  static List<Search> getSearchMovie(Response response) {
    List<Search> listSearch = [];

    List<dynamic> body = jsonDecode(response.body);
    body.forEach((element) {
      Map item = element;
      String id = item['id'];
      String catId = item['cat_id'];
      String title = item['title'];
      String icon = item['icon'];
      String creator = item['creator'];
      String description = item['description'];
      String link = item['link'];
      String view = item['view'];
      String time = item['time'];
      String special = item['special'];

      listSearch.add(Search(
          id: id,
          catId: catId,
          title: title,
          icon: icon,
          creator: creator,
          description: description,
          link: link,
          view: view,
          time: time,
          special: special));
    });

    return listSearch;
  }
 



}
