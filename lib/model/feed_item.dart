import 'package:locals_demo/model/base_model.dart';
import 'package:locals_demo/model/json_mixin.dart';

abstract class _FeedItemJsonKeys {
  static const String authorAvatarExtension = 'author_avatar_extension';
  static const String authorAvatarUrl = 'author_avatar_url';
  static const String authorId = 'author_id';
  static const String authorName = 'author_name';
  static const String bookmarked = 'bookmarked';
  static const String commentedByUs = 'commented_by_us';
  static const String communityId = 'community_id';
  static const String id = 'id';
  static const String isBlured = 'is_blured';
  static const String likedByUs = 'liked_by_us';
  static const String timestamp = 'timestamp';
  static const String text = 'text';
  static const String title = 'title';
  static const String totalPostViews = 'total_post_views';
}

class FeedItem extends BaseModel with JsonSerializable {
  final String authorAvatarExtension;
  final String authorAvatarUrl;
  final int authorId;
  final String authorName;
  final bool bookmarked;
  final bool commentedByUs;
  final int communityId;
  final int id;
  final bool isBlured;
  final bool likedByUs;
  final DateTime timestamp;
  final String text;
  final String title;
  final int totalPostViews;

  FeedItem({
    required this.authorAvatarExtension,
    required this.authorAvatarUrl,
    required this.authorId,
    required this.authorName,
    required this.bookmarked,
    required this.commentedByUs,
    required this.communityId,
    required this.id,
    required this.isBlured,
    required this.likedByUs,
    required this.timestamp,
    required this.text,
    required this.title,
    required this.totalPostViews,
  });

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    return FeedItem(
      authorAvatarExtension: json[_FeedItemJsonKeys.authorAvatarExtension] as String,
      authorAvatarUrl: json[_FeedItemJsonKeys.authorAvatarUrl] as String,
      authorId: json[_FeedItemJsonKeys.authorId] as int,
      authorName: json[_FeedItemJsonKeys.authorName] as String,
      bookmarked: json[_FeedItemJsonKeys.bookmarked] as bool,
      commentedByUs: json[_FeedItemJsonKeys.commentedByUs] as bool,
      communityId: json[_FeedItemJsonKeys.communityId] as int,
      id: json[_FeedItemJsonKeys.id] as int,
      isBlured: json[_FeedItemJsonKeys.isBlured] as bool,
      likedByUs: json[_FeedItemJsonKeys.likedByUs] as bool,
      timestamp: DateTime.fromMillisecondsSinceEpoch((json[_FeedItemJsonKeys.timestamp] as int) * 1000),
      text: json[_FeedItemJsonKeys.text] as String,
      title: json[_FeedItemJsonKeys.title] as String,
      totalPostViews: json[_FeedItemJsonKeys.totalPostViews] as int,
    );
  }

  @override
  int get hashCode =>
      authorAvatarExtension.hashCode ^
      authorAvatarUrl.hashCode ^
      authorId.hashCode ^
      authorName.hashCode ^
      bookmarked.hashCode ^
      commentedByUs.hashCode ^
      communityId.hashCode ^
      id.hashCode ^
      isBlured.hashCode ^
      likedByUs.hashCode ^
      timestamp.hashCode ^
      text.hashCode ^
      title.hashCode ^
      totalPostViews.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (other is FeedItem) {
      return identical(this, other) ||
          (authorAvatarExtension == other.authorAvatarExtension &&
              authorAvatarUrl == other.authorAvatarUrl &&
              authorId == other.authorId &&
              authorName == other.authorName &&
              bookmarked == other.bookmarked &&
              commentedByUs == other.commentedByUs &&
              communityId == other.communityId &&
              id == other.id &&
              isBlured == other.isBlured &&
              likedByUs == other.likedByUs &&
              timestamp == other.timestamp &&
              text == other.text &&
              title == other.title &&
              totalPostViews == other.totalPostViews);
    }
    return false;
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      _FeedItemJsonKeys.authorAvatarExtension: authorAvatarExtension,
      _FeedItemJsonKeys.authorAvatarUrl: authorAvatarUrl,
      _FeedItemJsonKeys.authorId: authorId,
      _FeedItemJsonKeys.authorName: authorName,
      _FeedItemJsonKeys.bookmarked: bookmarked,
      _FeedItemJsonKeys.commentedByUs: commentedByUs,
      _FeedItemJsonKeys.communityId: communityId,
      _FeedItemJsonKeys.id: id,
      _FeedItemJsonKeys.isBlured: isBlured,
      _FeedItemJsonKeys.likedByUs: likedByUs,
      _FeedItemJsonKeys.text: text,
      _FeedItemJsonKeys.timestamp: timestamp.millisecondsSinceEpoch ~/ 1000,
      _FeedItemJsonKeys.title: title,
      _FeedItemJsonKeys.totalPostViews: totalPostViews,
    };
  }
}
