import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_player/Model/popular_movie.dart';
import 'package:movie_player/components/detail_movie.dart';
import 'package:movie_player/utils/my_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

//Helper Class & Widgets that Help Us 
class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? SafeArea(child: Center(child: Container(alignment: Alignment.center, child: buildVideo())))
          : Container(
              height: 200,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );

  Widget buildVideo() => Stack(
        children: [
          buildVideoPlayer(),
          Positioned.fill(child: BasicOverlayWidget(controller: controller))
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: [
            //IconPlay(),
            Center(child: buildPlay()),
            Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator())
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() =>
      VideoProgressIndicator(controller, allowScrubbing: true);

  Widget buildPlay() => controller.value.isPlaying ? Container() : const IconPlay();
}



//Play Video From Asset
class PlayMovie extends StatefulWidget {
  @override
  State<PlayMovie> createState() => _PlayMovieState();
}

class _PlayMovieState extends State<PlayMovie> {
  late VideoPlayerController _controller;
  //I have to add video in asset directory & pubspec.yaml
  final myvideo = 'assets/video.mp4';


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(myvideo)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  //main method
  @override
  Widget build(BuildContext context) {
    final isMuted = _controller.value.volume == 0;

    return Column(children: [
      VideoPlayerWidget(controller: _controller),
      const SizedBox(
        height: 32,
      ),
      if (_controller != null && _controller.value.isInitialized)
        CircleAvatar(
          radius: 30.0,
          backgroundColor: MyColor.primary,
          child: IconButton(
              onPressed: () => _controller.setVolume(isMuted ? 1 : 0),
              icon: Icon(
                isMuted ? IconlyLight.volumeOff : IconlyLight.volumeUp,
                color: MyColor.white,
              )),
        )
    ]);
  }
}




//Upload Video From File
class FilePlayerWidget extends StatefulWidget {
  const FilePlayerWidget({Key? key}) : super(key: key);

  @override
  State<FilePlayerWidget> createState() => _FilePlayerWidgetState();
}

class _FilePlayerWidgetState extends State<FilePlayerWidget> {
  late VideoPlayerController controller;
  final File file = File(
      '/data/user/0/com.example.video_example/catch/file_picker/big_buckbunny_720p_10mb.mp4');

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(file)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(
        children: [
          VideoPlayerWidget(controller: controller),
          buildAddButton(),
        ],
      ));

  //addButton To Upload File
  Widget buildAddButton() => Container(
    padding: EdgeInsets.all(32.0),
    child: FloatingActionButton(
      onPressed: () async {
        final file = await pickVideoFile();

        if (file == null)  return;


        controller = VideoPlayerController.file(file);
      }),
  );       

  //choose Video From Our Category
  Future<File?> pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result == null) return null;

    return File(result.files.single.path!);
  }
}




//Play Video From Network

class NetworkPlayer extends StatefulWidget {
  const NetworkPlayer({ Key? key }) : super(key: key);

  @override
  _NetworkPlayerState createState() => _NetworkPlayerState();
}

class _NetworkPlayerState extends State<NetworkPlayer> {

  //For Fetch Video We Have to have https at first if it was http it doesn't work
  
  late VideoPlayerController controller;

  String my_url = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";

  //get Link Movie
/*
  Future<String?> getLinkMovie() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    print(
        'value of link movie player page we have : ${pref.getString('link_movie')}');

    return pref.getString('link_movie');
  }

*/

// related to url of get link movie they have problem
//for solving them we need to https instead of http link of movie   


  @override
  void initState() {
    super.initState();
    //print('initstate part 1: $getLinkMovie()');
    //getLinkMovie();
    //print('initstate part 2: $getLinkMovie()');
    controller = VideoPlayerController.network(my_url)
    ..addListener(() => setState(() {}))
    ..setLooping(true)
    ..initialize().then((_) => controller.play());
    //print('initstate part 3: $getLinkMovie()');
    
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) => Scaffold(
    
    appBar: AppBar(
      backgroundColor: MyColor.primary_dark,
      title: const Text('Play Video'),
      centerTitle: true,
    ),
    
    body: Container(
        alignment: Alignment.center,
        child: VideoPlayerWidget(controller: controller),
      ),
  );

}