class Note {
  String? title;
  String? content;
  String? clock;
  double? latitude;
  double? longitude;
  String? image;
  String? currentAdress;

  Note(
      {this.title,
      this.content,
      this.clock,
      this.latitude,
      this.longitude,
      this.currentAdress,
      this.image});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'clock': clock,
      'latitude': latitude,
      'longitude': longitude,
      'image': image,
      'currentAdress': currentAdress
    };
  }
}
