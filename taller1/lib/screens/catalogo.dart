import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(Catalogo());
}

class Catalogo extends StatelessWidget {
  const Catalogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData(
        primaryColor: Colors.deepPurple,
        secondaryHeaderColor: Colors.amber,        
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CatalogoScreen(),
    );
  }
}

class CatalogoScreen extends StatelessWidget {
  final List<String> peliculas = [
    'https://lumiere-a.akamaihd.net/v1/images/image_26964b90.jpeg',
    'https://spoilertime.com/wp-content/uploads/2024/04/deadpool-and-wolverine.jpg',
    'https://depor.com/resizer/bAtqEG24xDGK3I3qOG-zHNlGKhE=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/M2QN4B5GWZEV5NVV4DLLGRBYMI.png',
    'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2024/04/garfield-3305422.jpg?tf=3840x',
    'https://es.web.img3.acsta.net/pictures/24/02/12/14/09/5012504.jpg',
    'https://m.media-amazon.com/images/S/pv-target-images/1b8f63edc66fc25e4f14d5cd4cc2473a9c099e44eb7edaa6cdfa99ccb5eaff2f.jpg',
    'https://i.ytimg.com/vi/lziHAdN_7k8/maxresdefault.jpg'
  ];

  final List<String> videos = [
    '9bol4Yyx9Gs',
    'UzFZR2dRsSY',
    'O5BOxn8Go8U',
    'IeFWNtMo1Fs',
    'raYE6Ild7a4',
    '2I5NBRmK5K4',
    'gYApro2YXQQ',
  ];

  void reproducirPelicula(int index, BuildContext context) {
    String videoId = videos[index];

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black,
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: peliculas.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => reproducirPelicula(index, context),
            child: Card(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    peliculas[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 50,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
