import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/models/photo/photo.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/photo_gallery/photo_view_screen.dart';

class PhotosGallery extends StatelessWidget {
  const PhotosGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      child: BackgroundVideo(
        backgroundWidget: Container(),
        child: Photo.allPhotos.isEmpty
            ? Center(
                child: Text(
                  "Your Photos will be shown here",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.extent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    for (var i = 0; i < Photo.allPhotos.length; i++)
                      _PhotoGalleryTile(
                        hasFocus: i == 0,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PhotoViewScreen(
                                photo: Photo.allPhotos[i],
                              ),
                            ),
                          );
                        },
                        photo: Photo.allPhotos[i],
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
  final Photo photo;
  final bool hasFocus;
  const _PhotoGalleryTile({
    required this.onTap,
    this.hasFocus = false,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      hasFocus: hasFocus,
      focusGroup: 'photo_gallery',
      borderRadius: 20,
      onTap: onTap,
      child: Hero(
        tag: photo.url,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(photo.url),
              fit: BoxFit.cover,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.topRight,
          padding: const EdgeInsets.all(10),
          child: Icon(
            photo.liked
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: photo.liked ? Colors.red : Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
