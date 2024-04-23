import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/photo_gallery/photo_view_screen.dart';
import 'package:pocmytv/screens/shorex/shorex.dart';

class PhototGallery extends StatelessWidget {
  const PhototGallery({super.key});
  List<Map<String, dynamic>> get data => ShorexScreen.exsData;

  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      child: BackgroundVideo(
        backgroundWidget: Container(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.extent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              for (var i = 0; i < data.length; i++)
                _PhotoGalleryTile(
                  hasFocus: i == 0,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PhotoViewScreen(
                          data: data[i],
                        ),
                      ),
                    );
                  },
                  data: data[i],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhotoGalleryTile extends StatelessWidget {
  final Function() onTap;
  final Map<String, dynamic> data;
  final bool hasFocus;
  const _PhotoGalleryTile({
    required this.onTap,
    required this.data,
    this.hasFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      hasFocus: hasFocus,
      focusGroup: 'photo_gallery',
      borderRadius: 20,
      onTap: onTap,
      child: Hero(
        tag: data['image'],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(data['image']),
              fit: BoxFit.cover,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
