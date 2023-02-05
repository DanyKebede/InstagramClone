class FeedModel {
  final String fname;
  final String city;
  final String country;
  final String profileImageurl;
  final List<String> bodyImageurl;
  final List<String> likes;
  final String discription;
  final List<String> comments;
  final DateTime postDate;
  bool favorite;

  FeedModel({
    required this.fname,
    required this.city,
    required this.country,
    required this.profileImageurl,
    required this.bodyImageurl,
    required this.likes,
    required this.comments,
    required this.discription,
    required this.postDate,
    this.favorite = false,
  });
}
