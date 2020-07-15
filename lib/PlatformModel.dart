class Platform {
  String name;
  String url;
  String imgurl;

  Platform({
    this.name,
    this.url,
    this.imgurl,
  });
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
