import 'dart:convert';
import 'package:api/models/post.dart';
import 'package:api/utils/endpoint.dart';
import 'package:api/utils/request_helper.dart';
import 'package:http/http.dart' as http;

class PostServices {
  Future<http.Response> fetch() async {
    String endPoint = EndPoint.post;
    Uri url = Uri.parse(endPoint);
    return await http.get(
      url,
      headers: ReequestHelper.basicHeader(),
    );
  }

  Future<http.Response> fetchComments(int id) async {
    String endPoint = "${EndPoint.post}/$id/comments";
    Uri url = Uri.parse(endPoint);

    return await http.get(
      url,
      headers: ReequestHelper.basicHeader(),
    );
  }

  Future<http.Response> create(Post post) async {
    String endPoint = EndPoint.post;
    Uri url = Uri.parse(endPoint);
    var jsonBody = post.toMap();

    return await http.post(
      url,
      body: jsonEncode(jsonBody),
      headers: ReequestHelper.basicHeader(),
    );
  }

  Future<http.Response> put(Post post) async {
    String endPoint = "${EndPoint.post}/${post.id}";
    Uri url = Uri.parse(endPoint);
    var jsonBody = post.toMap();

    return await http.put(
      url,
      body: jsonEncode(jsonBody),
      headers: ReequestHelper.basicHeader(),
    );
  }

  Future<http.Response> patch({
    required int id,
    String? tittle,
    String? body,
  }) async {
    String endPoint = "${EndPoint.post}/$id";
    Uri url = Uri.parse(endPoint);

    Map<String, dynamic> jsonBody = {};
    if (tittle != null) {
      jsonBody["title"] = "tittle";
    }
    if (body != null) {
      jsonBody["body"] = "body";
    }

    return await http.patch(
      url,
      body: jsonEncode(jsonBody),
      headers: ReequestHelper.basicHeader(),
    );
  }

  Future<http.Response> delete(int id) async {
    String endPoint = "${EndPoint.post}/$id";
    Uri url = Uri.parse(endPoint);

    return await http.delete(
      url,
      headers: ReequestHelper.basicHeader(),
    );
  }

  fetchPhotos(int id) {}
}
