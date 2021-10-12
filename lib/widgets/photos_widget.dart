import 'package:flutter/material.dart';
import 'package:homefort/commons/text_style_defination.dart';
import 'package:homefort/model/core/photo.dart';
import 'package:homefort/widgets/shimmers.dart';

class PhotosWidget extends StatelessWidget {
  final Function onTap;
  final Photo photo;
  const PhotosWidget({Key? key, required this.onTap, required this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Text(
                      photo.id!.toString(),
                      style: TextStyleDefination.heading(),
                    )),
                SizedBox(width: 18),
                Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("AlbumId: ${photo.albumId}",
                            style: TextStyleDefination.heading(fontSize: 15.5)),
                        Text(
                          photo.title!,
                          style: TextStyleDefination.body(),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                  height: 150,
                  width: 150,
                  child: Image.network(photo.thumbnailUrl!)))
        ],
      ),
    );
  }
}

class PhotoShimmer extends StatelessWidget {
  const PhotoShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Row(
              children: [
                Flexible(flex: 1, child: BlockShimmer(height: 40, width: 30)),
                SizedBox(width: 18),
                Flexible(
                    flex: 2,
                    child: BlockShimmer(height: 50, width: double.infinity))
              ],
            ),
          ),
          Flexible(flex: 1, child: BlockShimmer(width: 50, height: 50))
        ],
      ),
    );
  }
}
