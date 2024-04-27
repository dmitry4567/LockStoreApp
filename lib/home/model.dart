class Project {
  final String description;
  final List<Photo> photos;
  final Author author;

  Project({
    required this.description,
    required this.photos,
    required this.author,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        description: json['description'],
        photos: List<Photo>.from(
          json['photoItems'].map((photo) => Photo.fromJson(photo)),
        ),
        author: Author.fromJson(json['author']),
      );
}

class Photo {
  final int id;
  final String fileName;

  Photo({
    required this.id,
    required this.fileName,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json['id'],
        fileName: json['fileName'],
      );
}

class Author {
  final String nickname;
  final String avatarUrl;

  Author({
    required this.nickname,
    required this.avatarUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        nickname: json['nickname'],
        avatarUrl: json['avatarUrl'],
      );
}
