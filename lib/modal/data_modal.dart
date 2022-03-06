class ApiDataModal {
  int userId;
  int id;
  String title;
  String? body;

  ApiDataModal({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  factory ApiDataModal.fromJson(Map<String, dynamic> json) {
    return ApiDataModal(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
