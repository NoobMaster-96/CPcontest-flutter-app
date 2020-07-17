import 'dart:convert';
import 'package:http/http.dart' as http;

class Platform {
  String name;
  String url;
  String imgurl;
  List data;

  Platform({
    this.name,
    this.url,
    this.imgurl,
  });

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(this.url), headers: {"Accept": "application/json"});
    this.data = jsonDecode(response.body);
    convert(data);
    print(data);
    return "Succes";
  }

  void convert(List temp) {
    var now = new DateTime.now();
    now = now.toLocal();
    int n = temp.length;
    for (int i = 0; i < n; i++) {
      var start = DateTime.parse(temp[i]["start_time"]);
      var end = DateTime.parse(temp[i]["end_time"]);
      start = start.toLocal();
      end = end.toLocal();
      int diff = end.difference(now).inMinutes;
      temp[i]["start_time"] = start.toString();
      temp[i]["end_time"] = end.toString();
      if (diff < 0) {
        temp[i]["status"] = "Over";
      } else if (temp[i]["status"] == "CODING") {
        temp[i]["status"] = "Ongoing";
      } else {
        temp[i]["status"] = "Upcoming";
      }
    }
  }
}

List<Platform> platforms = [
  Platform(
    name: 'CodeForces',
    url: 'https://www.kontests.net/api/v1/codeforces',
    imgurl: 'assets/images/codeforces.jpg',
  ),
  Platform(
    name: 'TopCoder',
    url: 'https://www.kontests.net/api/v1/top_coder',
    imgurl: 'assets/images/topcoder.jpg',
  ),
  Platform(
    name: 'AtCoder',
    url: 'https://www.kontests.net/api/v1/at_coder',
    imgurl: 'assets/images/atcoder.jpg',
  ),
  Platform(
    name: 'CodeChef',
    url: 'https://www.kontests.net/api/v1/code_chef',
    imgurl: 'assets/images/codechef.jpg',
  ),
  Platform(
    name: 'CS Academy',
    url: 'https://www.kontests.net/api/v1/cs_academy',
    imgurl: 'assets/images/csacademy.jpg',
  ),
  Platform(
    name: 'HackerRank',
    url: 'https://www.kontests.net/api/v1/hacker_rank',
    imgurl: 'assets/images/hackerrank.jpg',
  ),
  Platform(
    name: 'HackerEarth',
    url: 'https://www.kontests.net/api/v1/hacker_earth',
    imgurl: 'assets/images/hackerearth.jpg',
  ),
  Platform(
    name: 'Kick Start',
    url: 'https://www.kontests.net/api/v1/kick_start',
    imgurl: 'assets/images/kickstart.JPG',
  ),
  Platform(
    name: 'LeetCode',
    url: 'https://www.kontests.net/api/v1/leet_code',
    imgurl: 'assets/images/leetcode.jpg',
  ),
];
