
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CNetworkImage extends StatelessWidget {
  String url;
  double size;
  double height;
  double width;
  Widget placeholderAndErrorWidget;
  Widget placeholderWidget;
  Widget errorWidget;
  BoxFit fit;
  bool showProgress;
  bool hasOutline;

  CNetworkImage({
    @required this.url,
    this.size,
    this.height,
    this.width,
    this.placeholderAndErrorWidget = const Icon(
      Icons.image_outlined,
      color: Colors.grey,
    ),
    this.placeholderWidget,
    this.errorWidget,
    this.fit = BoxFit.contain,
    this.showProgress = true,
    this.hasOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: hasOutline ? BoxDecoration(
        color:Colors.amber,
        shape: BoxShape.circle,
        border: Border.all(color:Color(0xffE7E7F7), width: 1)
      ) : null,
      child: CachedNetworkImage(
        imageUrl: "$url",
        // placeholder: (_, __) => Container(
        //   height: height ?? size,
        //   width: width ?? size,
        //   child: placeholderWidget ?? placeholderAndErrorWidget,
        // ),
        errorWidget: (_, __, ___) => Container(
          height: height ?? size,
          width: width ?? size,
          child: placeholderWidget ?? placeholderAndErrorWidget,
        ),
        progressIndicatorBuilder: (_, __, downloadProgress) {
          return Container(
            height: height ?? size,
            width: width ?? size,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: this.showProgress ? CircularProgressIndicator() : SizedBox(),
            ),
          );
        },
        height: height ?? size,
        width: width ?? size,
        fit: this.fit,
      ),
    );
  }
}
