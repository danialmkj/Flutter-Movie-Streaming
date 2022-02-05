import 'package:flutter/material.dart';
import 'package:movie_player/Api/webservice.dart';
import 'package:movie_player/Model/new_movie.dart';
import 'package:movie_player/Model/popular_movie.dart';
import 'package:movie_player/Model/special_movie.dart';
import 'package:movie_player/components/detail_movie.dart';
import 'package:movie_player/utils/my_color.dart';
import 'package:movie_player/utils/text_style.dart';

class PlayListScreen extends StatelessWidget {
  PlayListScreen({Key? key}) : super(key: key);

  Future<List<PopularMovie>> list_popular = WebService.getPopularMovie();
  Future<List<NewMovie>> list_new_movie = WebService.getNewMovie();
  Future<List<SpecialMovie>> list_special_movie = WebService.getSpecialMovie();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: MyColor.primary_dark,
              appBar: AppBar(
                backgroundColor: MyColor.primary_dark,
                elevation: 0,
                bottom: TabBar(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    unselectedLabelColor: MyColor.dark,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent, width: 2.0)),
                    tabs: const [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Movies"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Tv Series"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Sports"),
                        ),
                      ),
                    ]),
              ),
              body: TabBarView(children: [
                //Popular_Movie
                FutureBuilder<List<PopularMovie>>(
                  future: list_popular,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 5, bottom: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailMovie(
                                                  title: snapshot
                                                      .data![index].title,
                                                  image: snapshot
                                                      .data![index].icon,
                                                  description: snapshot
                                                      .data![index].description,
                                                  link_movie: snapshot
                                                      .data![index].link,
                                                )));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  snapshot.data![index].icon!),
                                              fit: BoxFit.cover))),
                                ));
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                //New_Movie
                FutureBuilder<List<NewMovie>>(
                  future: list_new_movie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 5, bottom: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailMovie(
                                                  title: snapshot
                                                      .data![index].title,
                                                  image: snapshot
                                                      .data![index].icon,
                                                  description: snapshot
                                                      .data![index].description,
                                                  link_movie: snapshot
                                                      .data![index].link,
                                                )));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  snapshot.data![index].icon!),
                                              fit: BoxFit.cover))),
                                ));
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                //Special_Movie
                FutureBuilder<List<SpecialMovie>>(
                  future: list_special_movie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 5, bottom: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailMovie(
                                                  title: snapshot
                                                      .data![index].title,
                                                  image: snapshot
                                                      .data![index].icon,
                                                  description: snapshot
                                                      .data![index].description,
                                                  link_movie: snapshot
                                                      .data![index].link,
                                                )));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  snapshot.data![index].icon!),
                                              fit: BoxFit.cover))),
                                ));
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ]),
            )));
  }
}
