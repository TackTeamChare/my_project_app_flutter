import 'package:blog_app/models/user.dart';


class Thread {
  final String id;
  final String title;
  final String content;
  final User user;
  final String category;

  Thread({
    required this.id,
    required this.title,
    required this.content,
    required this.user,
    required this.category,
  });
}
