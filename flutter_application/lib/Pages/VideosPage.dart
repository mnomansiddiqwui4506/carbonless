import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoItem {
  final String title;
  final String url; // YouTube ID or MP4 URL
  final bool isYouTube;

  VideoItem({
    required this.title,
    required this.url,
    required this.isYouTube,
  });
}

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
final videos = [
  VideoItem(title: '🌱 Green Energy (Explained)', url: 'l5LXvaoOd5c', isYouTube: true),
  VideoItem(title: '🌿 Save Trees & Earth', url: 'ulhbHzSRcFQ', isYouTube: true),
  VideoItem(title: '☀️ Solar Power Impact', url: '3rX4lXAEN2A', isYouTube: true),
  VideoItem(title: '🌎 Earth Day for Kids', url: 'wefswCPT7B4', isYouTube: true),
  // (Optional extras)
  VideoItem(title: '🔋 How green is energy revolution?', url: 'E39neWnw9AA', isYouTube: true),
  VideoItem(title: 'Renewable Energy 101 | National Geographic', url: '1kUE0BZtTRc', isYouTube: true),  // basics of renewable energy :contentReference[oaicite:0]{index=0}
  VideoItem(title: 'Solar Trees: Clean Energy Without Cutting Forests', url: 'l1K19mBf5I0', isYouTube: true),  // combining solar + trees :contentReference[oaicite:1]{index=1}
  VideoItem(title: 'New solar trees could be future of renewable energy', url: 'YZOa8dGARr4', isYouTube: true),  // innovative solar concept :contentReference[oaicite:2]{index=2}
  VideoItem(title: 'This Solar Trick Lets You Save Your Trees!', url: 'NDQA9cS2V_U', isYouTube: true),  // vertical solar + trees idea :contentReference[oaicite:3]{index=3}
  VideoItem(title: 'Renewable Energy For Kids', url: 'rK5f8KEKrwc', isYouTube: true),
];


   return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Educational Videos 🎬',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: videos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 16 / 9,
          ),
          itemBuilder: (context, index) {
            final video = videos[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VideoPlayerScreen(video: video),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(color: Colors.black12),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.play_circle_fill,
                            size: 48,
                            color: Colors.green,
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              video.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// 🎥 Video Player Page
class VideoPlayerScreen extends StatefulWidget {
  final VideoItem video;

  const VideoPlayerScreen({super.key, required this.video});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _videoController;
  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    super.initState();

    if (widget.video.isYouTube) {
      String? videoId =
          YoutubePlayerController.convertUrlToId(widget.video.url);
      _youtubeController = YoutubePlayerController.fromVideoId(
        videoId: videoId ?? '',
        autoPlay: true,
        params: const YoutubePlayerParams(
          showFullscreenButton: true,
          enableCaption: false,
          showControls: true,
        ),
      );
    } else {
      _videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.video.url))
            ..initialize().then((_) {
              setState(() {});
              _videoController?.play();
            }).catchError((e) {
              debugPrint('Error loading MP4: $e');
            });
      _videoController?.setLooping(true);
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _youtubeController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.title),
        backgroundColor: Colors.green.shade700,
      ),
      body: Center(
        child: widget.video.isYouTube
            ? YoutubePlayerScaffold(
                controller: _youtubeController!,
                builder: (context, player) => Center(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: player,
                  ),
                ),
              )
            : (_videoController != null &&
                    _videoController!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoController!.value.aspectRatio,
                    child: VideoPlayer(_videoController!),
                  )
                : const CircularProgressIndicator()),
      ),
      floatingActionButton: widget.video.isYouTube
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                setState(() {
                  if (_videoController!.value.isPlaying) {
                    _videoController!.pause();
                  } else {
                    _videoController!.play();
                  }
                });
              },
              child: Icon(
                _videoController != null && _videoController!.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
            ),
    );
  }
}
