import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:homefort/model/core/photo.dart';
import 'package:homefort/providers/photos_provider.dart';
import 'package:homefort/widgets/no_content.dart';
import 'package:homefort/widgets/photos_widget.dart';
import 'package:homefort/widgets/snackbar.dart';
import 'package:provider/provider.dart';

class AllPhotoScreen extends StatefulWidget {
  const AllPhotoScreen({Key? key}) : super(key: key);

  @override
  _AllPhotoScreenState createState() => _AllPhotoScreenState();
}

class _AllPhotoScreenState extends State<AllPhotoScreen> {
  int nextAlbumId = 1;
  bool loading = true;
  List<Photo> allPhotos = [];

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    fetchPhotos();
    super.initState();
    scrollController.addListener(pagination);
  }

  void pagination() async {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !loading)) {
      fetchPhotos();
    }
  }

  void fetchPhotos() async {
    if (mounted) setState(() => this.loading = true);
    PhotoProvider photoProvider =
        Provider.of<PhotoProvider>(context, listen: false);
    try {
      await photoProvider.getPhoto(albumId: nextAlbumId);
      setState(() => nextAlbumId++);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar(
        message: "$e",
        context: context,
        isError: true,
        snackBarAction:
            SnackBarAction(label: "Retry", onPressed: () => fetchPhotos()),
      ));
    }
    if (mounted) setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    PhotoProvider photoProvider = Provider.of<PhotoProvider>(context);
    allPhotos = photoProvider.allPhotos;

    Size size = MediaQuery.of(context).size;
    double top = MediaQuery.of(context).padding.top;
    double actualHeight = size.height - top - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("All Photos"),
        backgroundColor: Colors.black.withOpacity(.83),
      ),
      body: SingleChildScrollView(
          controller: scrollController,
          child: loading && allPhotos.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: .5, right: .5, top: 20),
                  child: Container(
                    height: actualHeight * 0.9,
                    child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return PhotoShimmer();
                        },
                        itemCount: 12),
                  ),
                )
              : allPhotos.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NoContent(
                          btn: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => fetchPhotos(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22.0)),
                                  color: Colors.black.withOpacity(.83)),
                              child: Text(
                                "Retry",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 32.5, bottom: 5),
                          child: buildListBuilderView(),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Container(child: PhotoShimmer()),
                        )
                      ],
                    )),
    );
  }

  Widget buildListBuilderView() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: allPhotos.length,
      shrinkWrap: true,
      itemBuilder: (context, int i) {
        return PhotosWidget(onTap: () {}, photo: allPhotos[i]);
      },
      separatorBuilder: (context, int index) {
        return SizedBox(height: 2);
      },
    );
  }
}
