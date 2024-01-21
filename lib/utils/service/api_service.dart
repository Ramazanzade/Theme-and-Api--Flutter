import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:them/utils/constasan/api_constans.dart';
import 'package:them/utils/models/comments_model.dart';

class ApiService {
  Future<List<Commentmodel>> getcomment() async {
    final res = await http.get(Uri.parse(url));

    List<Commentmodel> coments = [];
    List<dynamic> resnponselist = jsonDecode(res.body);
    for (var i = 0; i < resnponselist.length; i++) {
      coments.add(Commentmodel.fromJson(resnponselist[i]));
    }
    return coments;
  }
}
