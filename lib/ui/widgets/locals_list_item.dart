import 'package:flutter/material.dart';
import 'package:locals_demo/model/feed_item.dart';
import 'package:locals_demo/utils/locals_date_time_formatter.dart';

class LocalsListItem extends StatelessWidget {
  const LocalsListItem({required this.feedItem, Key? key}) : super(key: key);

  final FeedItem feedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff252525),
      ),
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 40,
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        feedItem.authorAvatarUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            feedItem.authorName,
                            style: TextStyle(
                              color: Colors.red[800]!,
                            ),
                          ),
                          Text(
                            '@${feedItem.authorId}',
                            style: const TextStyle(
                              color: Color(0xff999999),
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.bookmark,
                            color: Colors.red[800]!,
                          ),
                        ],
                      ),
                      Text(
                        LocalsDateTimeFormatter.naturalTimeInThePast(feedItem.timestamp),
                        style: const TextStyle(
                          color: Color(0xff999999),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 40,
            ),
            child: Text(
              feedItem.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 40,
            ),
            child: Text(
              feedItem.text,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            color: Color(0xff999999),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 40,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.thumb_up,
                  color: Color(0xff999999),
                ),
                const SizedBox(width: 8),
                Text(
                  '${feedItem.totalPostViews}',
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
