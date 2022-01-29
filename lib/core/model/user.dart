class User {
  final String name;
  final String image;
  final bool isOnline;
  User({
    required this.name,
    required this.image,
    this.isOnline = true,
  });
}
