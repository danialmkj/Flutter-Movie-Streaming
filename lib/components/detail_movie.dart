import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:movie_player/Api/webservice.dart';
import 'package:movie_player/Model/new_movie.dart';
import 'package:movie_player/Model/popular_movie.dart';
import 'package:movie_player/Model/search_model.dart';
import 'package:movie_player/Model/special_movie.dart';
import 'package:movie_player/components/play_movie.dart';
import 'package:movie_player/screens/dashboard.dart';
import 'package:movie_player/screens/home_screen.dart';
import 'package:movie_player/utils/custom_bottom_navigation.dart';
import 'package:movie_player/utils/my_color.dart';
import 'package:movie_player/utils/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailMovie extends StatefulWidget {
  final String? title;
  final String? image;
  final String? description;
  final String? link_movie;
  Search? search;

  DetailMovie(
      {Key? key, this.title, this.image, this.description, this.link_movie , this.search})
      : super(key: key);

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.primary_dark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container & image
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      color: MyColor.white,
                    ),
                    child: Stack(
                      children: [
                        //Image
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8.0),
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.network(
                                widget.image!,
                                fit: BoxFit.cover,
                              ),
                            )),

                        //Elevation & Shadow
                        Container(
                          height: MediaQuery.of(context).size.height * 0.375,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.grey.withOpacity(0.0),
                                  MyColor.primary_dark
                                ],
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter),
                          ),
                        ),

                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: GestureDetector(
                              onTap: () async {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const NetworkPlayer()));

                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                preferences.setString(
                                    "link_movie", widget.link_movie!);

                                print('link_movie is : ');
                                print(preferences.getString('link_movie'));
                              },
                              child: IconPlay()),
                        )),
                      ],
                    ),
                  ),

                  //two Icons
                  Twiceicon(),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title!,
                    style: MyTextStyle.title_movie,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  InDetail(),
                  SizedBox(
                    height: 8.0,
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

              const SizedBox(
                height: 24.0,
              ),

              //description
              Container(
                  margin:
                      const EdgeInsets.only(left: 30.0, top: 4.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: MyTextStyle.title_description,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        '${widget.description}',
                        style: MyTextStyle.description_text,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )),

              //Slider Detail
              Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Epizodes',
                        style: MyTextStyle.episodes,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ImageSlider()
                    ],
                  )),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class IconPlay extends StatelessWidget {
  const IconPlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.125,
      height: MediaQuery.of(context).size.height * 0.06,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xffff3b30), borderRadius: BorderRadius.circular(45.0)),
      child: Center(
        child: Icon(
          Icons.play_arrow,
          color: MyColor.white,
        ),
      ),
    );
  }
}

class InDetail extends StatelessWidget {
  const InDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '2021',
          style: MyTextStyle.search_style,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          '|',
          style: MyTextStyle.search_style,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          'Action , Crime , Drama',
          style: MyTextStyle.search_style,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          '|',
          style: MyTextStyle.search_style,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          'Part - 1',
          style: MyTextStyle.search_style,
        ),
      ],
    );
  }
}

class Twiceicon extends StatelessWidget {
  const Twiceicon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlassContainer(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.40),
                  Colors.white.withOpacity(0.10)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.60),
                  Colors.white.withOpacity(0.10),
                  Colors.lightBlueAccent.withOpacity(0),
                  Colors.lightBlueAccent.withOpacity(0)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.39, 0.40, 1.0],
              ),
              blur: 15.0,
              borderWidth: 1.5,
              margin: EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width * 0.13,
              height: MediaQuery.of(context).size.height * 0.066,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: MyColor.white,
                ),
              )),
          GlassContainer(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.40),
                  Colors.white.withOpacity(0.10)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.60),
                  Colors.white.withOpacity(0.10),
                  Colors.lightBlueAccent.withOpacity(0),
                  Colors.lightBlueAccent.withOpacity(0)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.39, 0.40, 1.0],
              ),
              blur: 15.0,
              borderWidth: 1.5,
              margin: EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width * 0.13,
              height: MediaQuery.of(context).size.height * 0.065,
              borderRadius: BorderRadius.circular(10.0),
              child: IconButton(
                  //padding: EdgeInsetsDirectional.only(end: 0.01),
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: MyColor.white,
                  )))
        ],
      ),
    );
  }
}

class _ImageSliderState extends State<ImageSlider> {
  Future<List<NewMovie>> list_new_movie = WebService.getNewMovie();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewMovie>>(
      future: list_new_movie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailMovie(
                              title: snapshot.data![index].title,
                              image: snapshot.data![index].icon,
                              description: snapshot.data![index].description,
                              link_movie: snapshot.data![index].link,
                            ))),
                    child: Container(
                      height: 100.0,
                      width: 160.0,
                      margin: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        child: Image.network(
                          snapshot.data![index].icon!,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
