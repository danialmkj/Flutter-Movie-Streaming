import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_player/Api/webservice.dart';
import 'package:movie_player/Model/image_slider.dart';
import 'package:movie_player/Model/popular_movie.dart';
import 'package:movie_player/components/detail_movie.dart';
import 'package:movie_player/utils/my_color.dart';
import 'package:movie_player/utils/text_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  //carousel_slider
  Future<List<PopularMovie>> list_popular = WebService.getPopularMovie();

  //Get Image List from Api
  List<String> image_list = [];

  //Give Image Carousel
  List<Widget> get getImageLsit {
    List<Widget> array_image = [];

    for (var i = 0; i < image_list.length; i++) {
      ClipRRect radius = ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image(
          image: Image.network(image_list.elementAt(i)).image,
          fit: BoxFit.cover,
          width: 250,
          height: 300,
        ),
      );

      array_image.add(radius);
    }

    return array_image;
  }

  String url =
      'https://media-exp1.licdn.com/dms/image/C4D03AQEvB7Ht3tJeNw/profile-displayphoto-shrink_100_100/0/1619258362978?e=1645056000&v=beta&t=bBYnutByezrQFilKz8PbzThLyLMivmbx-Qz_8FAMU7k';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Hello',
                                  style: MyTextStyle.head_style,
                                ),
                                Text(
                                  ' Danial',
                                  style: MyTextStyle.head_style2,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Check for latest addition.',
                              style: MyTextStyle.head_style3,
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(url),
                          radius: 25.0,
                        )
                      ],
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.001,
                    ),
                    //SeachBar
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          color: MyColor.dark_opacity),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          style: MyTextStyle.search_style,
                          decoration: InputDecoration(
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  Icons.search,
                                  color: MyColor.white,
                                ),
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: MyColor.dark),
                              contentPadding:
                                  const EdgeInsets.only(right: 1.0, left: 1.0),
                              suffixIcon: SizedBox(
                                width: 2.0,
                                child: IntrinsicHeight(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    VerticalDivider(
                                      color: MyColor.white,
                                      endIndent: 8.0,
                                      indent: 8.0,
                                      thickness: 2,
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Icon(
                                      Icons.mic_none,
                                      color: MyColor.white,
                                    ),
                                  ],
                                )),
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.00001,
                    ),

                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Filters',
                            style: MyTextStyle.filter_txt_style,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          //Filter Container
                          Wrap(
                            direction: Axis.horizontal,
                            children: [
                              FilterCategory(
                                icon: Icons.dashboard,
                                text: 'Genre',
                              ),
                              const SizedBox(
                                width: 18.0,
                              ),
                              FilterCategory(
                                icon: Icons.star,
                                text: 'Top IMDB',
                              ),
                              const SizedBox(
                                width: 18.0,
                              ),
                              FilterCategory(
                                icon: Icons.language,
                                text: 'Language',
                              ),
                              const SizedBox(
                                width: 18.0,
                              ),
                              FilterCategory(
                                icon: Icons.slow_motion_video,
                                text: 'Watched',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),

                    //Featured Text
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.038),
                      child: Row(
                        children: [
                          Text(
                            'Featured',
                            style: MyTextStyle.head_style,
                          ),
                          Text(
                            ' Series',
                            style: MyTextStyle.head_style2,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //set Slider
                    FutureBuilder<List<PopularMovie>>(
                        future: list_popular,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: CircularProgressIndicator(),
                            ));
                          }

                          if (snapshot.hasData) {
                            for (var i = 0; i < snapshot.data!.length; i++) {
                              image_list.add(snapshot.data![i].icon!);
                            }
                          }

                          return Container(
                              height: 250,
                              child: ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailMovie(
                                                      title: snapshot
                                                          .data![index].title,
                                                      image: snapshot
                                                          .data![index].icon,
                                                      description: snapshot
                                                          .data![index]
                                                          .description,
                                                      link_movie: snapshot
                                                          .data![index].link,
                                                    )));
                                      },
                                      child: CarouselSlider(
                                          options: CarouselOptions(
                                            height: 250,
                                            viewportFraction: 0.8,
                                            initialPage: 5,
                                            enableInfiniteScroll: true,
                                            reverse: false,
                                            autoPlay: true,
                                            autoPlayInterval:
                                                Duration(seconds: 5),
                                            autoPlayAnimationDuration:
                                                const Duration(
                                                    milliseconds: 800),
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            enlargeCenterPage: true,
                                            scrollDirection: Axis.horizontal,
                                          ),
                                          items: getImageLsit),
                                    );
                                  }));
                          //}
                          //else {
                          //return CircularProgressIndicator();
                        }
                        //}

                        )
                  ]),
            ),
          ),
        ));
  }
}

class FilterCategory extends StatelessWidget {
  IconData? icon;
  String? text;

  FilterCategory({
    this.icon,
    this.text,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: MyColor.primary),
          child: Icon(
            icon!,
            color: MyColor.white,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(
          text!,
          style: MyTextStyle.genre_txt_style,
        )
      ],
    );
  }
}

class ImageSlider extends StatefulWidget {
  ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  Future<List<PopularMovie>> list_popular = WebService.getPopularMovie();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PopularMovie>>(
      future: list_popular,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DetailMovie(
                              title: snapshot.data![index].title,
                              image: snapshot.data![index].icon,
                              description: snapshot.data![index].description,
                              link_movie: snapshot.data![index].link,
                            ))),
                    child: Container(
                      height: 250.0,
                      width: 155.0,
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
