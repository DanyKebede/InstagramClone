class UserProfile {
  final String username;
  final String profileImage;
  final List<String> posts;
  final String bio;
  final List<String> following;
  final List<String> follower;

  UserProfile({
    required this.username,
    required this.profileImage,
    required this.posts,
    required this.bio,
    required this.following,
    required this.follower,
  });
}
