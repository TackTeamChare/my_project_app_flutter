import 'dart:convert';

import 'package:blog_app/constants/constants.dart';
import 'package:blog_app/models/post.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class PostController extends GetxController {
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllPosts();
    super.onInit();
  }

  Future getAllPosts() async {
    try {
      posts.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}posts'), headers: {
        'Accept': 'application/json',
// 'Authorization':'Bearer ${box.read('token)}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(response.body)['posts'];
        for (var item in content) {
          posts.value.add(PostModel.fromJson(item));
        }
        print(content);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
