import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TutorialesPA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tutoriales Primeros Auxilios',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF005954), // Color 1
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: musicVideos.length,
          itemBuilder: (context, index) {
            return VideoCard(
              video: musicVideos[index],
            );
          },
        ),
      ),
    );
  }
}

class VideoPA {
  final String videoId;
  final String title;

  VideoPA({required this.videoId, required this.title});
}

final List<VideoPA> musicVideos = [
  VideoPA(
    videoId: 'omEfz360ujY',
    title: 'Aprende RCP y Atragantamiento',
  ),
  VideoPA(
    videoId: 'TV3lnITz_Mk',
    title: 'Primeros Auxilios: RCP (Reanimación cardiopulmonar) en bebés y niños',
  ),
  VideoPA(
    videoId: 'FEayzgNGGBQ',
    title: 'Primeros Auxilios: RCP (Reanimación cardiopulmonar) en adultos',
  ),
  VideoPA(
    videoId: 'JAgB5RVgHNk',
    title: 'Primeros Auxilios - Valoración Primaria y Conducta PAS',
  ),
  VideoPA(
    videoId: 'aShm8qshKDY',
    title: 'RCP básica en NIÑOS y BEBÉS. Primeros auxilios en pediatría: reanimación cardiopulmonar',
  ),
];

class VideoCard extends StatelessWidget {
  final VideoPA video;

  VideoCard({required this.video});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _launchYouTubeVideo(video.videoId);
              },
              child: AspectRatio(
                aspectRatio: 16 / 9, // Cambia la relación de aspecto aquí
                child: Image.network(
                  'https://img.youtube.com/vi/${video.videoId}/0.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                video.title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchYouTubeVideo(String videoId) async {
    final url = 'https://www.youtube.com/watch?v=$videoId';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
