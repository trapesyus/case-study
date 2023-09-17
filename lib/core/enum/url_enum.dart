enum UrlEnum {
  firebaseDbUrl(
      'https://firestore.googleapis.com/v1/projects/case-study-88de7/databases/(default)/documents/userInfo'),
  getNoteUrl(
      'https://firestore.googleapis.com/v1/projects/case-study-88de7/databases/(default)/documents/users/');

  const UrlEnum(this.url);
  final String url;
}
