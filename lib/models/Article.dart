

class Article {

  String id;
  String cat_id;
  String mp3_type;
  String mp3_title;
  String mp3_url;
  String mp3_thumbnail_b;
  String mp3_thumbnail_s;
  String mp3_duration;
  String mp3_artist;
  String mp3_description;

  Article({
      this.id,
      this.cat_id,
      this.mp3_type,
      this.mp3_title,
      this.mp3_url,
      this.mp3_thumbnail_b,
      this.mp3_thumbnail_s,
      this.mp3_duration,
      this.mp3_artist,
      this.mp3_description});


  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      cat_id: json['cat_id'],
      mp3_type: json['mp3_type'],
      mp3_title: json['mp3_title'],
      mp3_url: json['mp3_url'],
      mp3_thumbnail_b: json['mp3_thumbnail_b'],
      mp3_thumbnail_s: json['mp3_thumbnail_s'],
      mp3_duration: json['mp3_duration'],
      mp3_artist: json['mp3_artist'],
      mp3_description: json['mp3_description'],
    );
  }

}