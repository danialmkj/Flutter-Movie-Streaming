import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_player/Api/webservice.dart';
import 'package:movie_player/Model/search_model.dart';
import 'package:movie_player/components/detail_movie.dart';
import 'package:movie_player/components/search_widget.dart';
import 'package:movie_player/screens/home_screen.dart';
import 'package:movie_player/utils/my_color.dart';
import 'package:movie_player/utils/text_style.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Search> searchs = [];
  String query = '';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer(duration, callback);
  }

  Future init() async {
    final books = await WebService.getSearchMovie(myInput: query);

    setState(() => this.searchs = searchs);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.primary_dark,
          title: Text('Search'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: searchs.length,
                itemBuilder: (context, index) {
                  final search = searchs[index];

                  return buildSearch2(search);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() {
    return SearchWidget(
        text: query, onChanged: searchMovie, hintText: 'Search');
  }

  Future searchMovie(String query) async => debounce(() async {
        final search = await WebService.getSearchMovie(myInput: query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.searchs = search;
        });
      });

  Widget buildSearch2(Search search) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=> DetailMovie(search: search) ));
      },
      child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  search.icon!,
                  fit: BoxFit.cover,
                  width: 93,
                  height: 105,
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(search.title! , style: MyTextStyle.Search_card_titile,),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Horor,Mystery',style: MyTextStyle.Search_card_sub_titile,),
                    SizedBox(
                      height: 10.0,
                    ),
                    RatingBar.builder(
                      itemSize: MediaQuery.of(context).size.width * 0.06,
                      initialRating: 4.5,
                      minRating: 1,
                      unratedColor: Color(0xffc4c4c4),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
    ),
  );
}
