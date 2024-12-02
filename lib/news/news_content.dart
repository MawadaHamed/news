import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_theme.dart';
import 'package:flutter_application_1/widget/loading_indicator.dart';
import 'package:url_launcher/link.dart';

class NewsContent extends StatelessWidget {
  NewsContent(
      {required this.content,
      required this.imageURL,
      required this.name,
      required this.title,
      required this.url});
  String imageURL;
  String title;
  String name;
  String content;
  String url;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;

    return Container(
        decoration: BoxDecoration(
            color: AppTheme.white,
            image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'News Title',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: imageURL ??
                        'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
                    height: MediaQuery.sizeOf(context).height * .25,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (_, __) => LoadingIndicator(),
                    errorWidget: (_, __, ___) =>
                        Icon(Icons.image_not_supported_outlined),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  name,
                  style: titleSmallStyle?.copyWith(
                      fontSize: 10, color: AppTheme.gray),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  title,
                  style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  content,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppTheme.gray),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse(url),
                    builder: (context, followLink) => TextButton(
                      child: Text(
                        'Follow The Article',
                        style: titleSmallStyle?.copyWith(
                            fontSize: 13, color: AppTheme.gray),
                      ),
                      onPressed: followLink,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
