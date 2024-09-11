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
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: GridView.extent(
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      for (var i = 0; i < Photo.allPhotos.length; i++)
                        _PhotoGalleryTile(
                          hasFocus: i == 0,
                          photo: Photo.allPhotos[i],
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class _PhotoGalleryTile extends StatefulWidget {
  final Photo photo;
  final bool hasFocus;
  const _PhotoGalleryTile({
    this.hasFocus = false,
    required this.photo,
  });

  @override
  State<_PhotoGalleryTile> createState() => _PhotoGalleryTileState();
}

class _PhotoGalleryTileState extends State<_PhotoGalleryTile> {
  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      hasFocus: widget.hasFocus,
      focusGroup: 'photo_gallery',
      borderRadius: 20,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PhotoViewScreen(
              photo: widget.photo,
              onPhotoLiked: (liked) {
                setState(() {
                  widget.photo.liked = liked;
                });
              },
            ),
          ),
        );
      },
      child: Hero(
        tag: widget.photo.url,
        child: Material(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(widget.photo.url),
                fit: BoxFit.cover,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(2),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.photo.liked = !widget.photo.liked;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 8,
                  right: 5,
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.photo.liked
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: widget.photo.liked ? Colors.red : Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
