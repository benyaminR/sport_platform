import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostSlide extends StatefulWidget {
  @override
  _PostSlideState createState() => _PostSlideState();
}

class _PostSlideState extends State<PostSlide> {

  List<String> imgList = [
    'https://www.fitforfun.de/files/images/201712/1/istock-628092286,276242_m_n.jpg',
    'https://styla-prod-us.imgix.net/7c88c350-4bec-441e-af4e-5e16ec16a0ef/c3ef87b2-a406-452f-a33b-627f8d8ddfe1?auto=format%2Ccompress&w=955.5&h=637.875&fit=crop&crop=faces%2Cedges',
  ];

  @override
  Widget build(BuildContext context) {
      return Builder(
        builder: (context) {
          // final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              // height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
              enableInfiniteScroll: false,
            ),
            items: imgList.map((item) => Container(
              child: Container(
                height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(item, fit: BoxFit.cover, height: 300, width: MediaQuery.of(context).size.width)
              ),
            )).toList(),
          );
        },
      );
  }
}