class BannerEntity {
  final int id;
  final String imageUrl;
  BannerEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['image'];
}
