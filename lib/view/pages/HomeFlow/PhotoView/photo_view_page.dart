import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/data.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({@required this.index});
  final int index;
  @override
  _PhotoViewPageState createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  PageController _pageController;
  int _currentPage;
  @override
  void initState() {
    super.initState();
    _currentPage = widget.index;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Preview',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              children: foodsImgList.map((img) {
                return Hero(
                  tag: img,
                  child: PhotoView(
                    backgroundDecoration: const BoxDecoration(
                      color: Color(0xFF25262E),
                    ),
                    imageProvider: AssetImage(img),
                  ),
                );
              }).toList(),
            ),
            Positioned(
                bottom: kPadding,
                child: SizedBox(
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < foodsImgList.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: CircleAvatar(
                            radius: _currentPage == i ? 5 : 3,
                            backgroundColor: _currentPage == i
                                ? Colors.white
                                : Colors.transparent,
                            child: CircleAvatar(
                              radius: _currentPage == i ? 4 : 3,
                              backgroundColor: _currentPage == i
                                  ? kPrimaryColor
                                  : Colors.white24,
                            ),
                          ),
                        )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
