import 'package:flutter/material.dart';


class TutorialesPA extends StatelessWidget {
  late PageController _pageController = PageController();

  List<String> videoUrls = [
    "https://www.youtube.com/watch?v=aShm8qshKDY",
    "https://www.youtube.com/watch?v=TV3lnITz_Mk",
    "https://www.youtube.com/watch?v=FEayzgNGGBQ",
    "https://www.youtube.com/watch?v=JAgB5RVgHNk",
    "https://www.youtube.com/watch?v=omEfz360ujY",
  ];

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Videos'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            child: AnimatedVideoCard(
              videoUrl: videoUrls[index],
              pageIndex: index,
              pageController: _pageController,
            ),
          );
        },
      ),
    );
  }
}

class AnimatedVideoCard extends StatelessWidget {
  final String videoUrl;
  final int pageIndex;
  final PageController pageController;

  const AnimatedVideoCard({
    Key? key,
    required this.videoUrl,
    required this.pageIndex,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoId = videoUrl.substring(videoUrl.indexOf('=') + 1);
    String thumbnailUrl = 'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            // You can add functionality to open the video here
          },
          child: Stack(
            children: [
              Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: Icon(Icons.play_circle_filled, size: 50, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
