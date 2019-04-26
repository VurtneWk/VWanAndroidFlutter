class ArticleList {
  final Data data;
  final int errorCode;
  final String errorMsg;

  ArticleList.fromJsonMap(Map<String, dynamic> map)
      : data = Data.fromJsonMap(map["data"]),
        errorCode = map["errorCode"],
        errorMsg = map["errorMsg"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['data'] = data == null ? null : data.toJson();
    data1['errorCode'] = errorCode;
    data1['errorMsg'] = errorMsg;
    return data1;
  }
}

class Data {
  final int curPage;
  final List<Article> datas;
  final int offset;
  final bool over;
  final int pageCount;
  final int size;
  final int total;

  Data.fromJsonMap(Map<String, dynamic> map)
      : curPage = map["curPage"],
        datas =
            List<Article>.from(map["datas"].map((it) => Article.fromJsonMap(it))),
        offset = map["offset"],
        over = map["over"],
        pageCount = map["pageCount"],
        size = map["size"],
        total = map["total"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curPage'] = curPage;
    data['datas'] =
        datas != null ? this.datas.map((v) => v.toJson()).toList() : null;
    data['offset'] = offset;
    data['over'] = over;
    data['pageCount'] = pageCount;
    data['size'] = size;
    data['total'] = total;
    return data;
  }
}

class Article {
  final String apkLink;
  final String author;
  final int chapterId;
  final String chapterName;
  final bool collect;
  final int courseId;
  final String desc;
  final String envelopePic;
  final bool fresh;
  final int id;
  final String link;
  final String niceDate;
  final String origin;
  final String prefix;
  final String projectLink;
  final int publishTime;
  final int superChapterId;
  final String superChapterName;
  final List<Object> tags;
  final String title;
  final int type;
  final int userId;
  final int visible;
  final int zan;

  Article.fromJsonMap(Map<String, dynamic> map)
      : apkLink = map["apkLink"],
        author = map["author"],
        chapterId = map["chapterId"],
        chapterName = map["chapterName"],
        collect = map["collect"],
        courseId = map["courseId"],
        desc = map["desc"],
        envelopePic = map["envelopePic"],
        fresh = map["fresh"],
        id = map["id"],
        link = map["link"],
        niceDate = map["niceDate"],
        origin = map["origin"],
        prefix = map["prefix"],
        projectLink = map["projectLink"],
        publishTime = map["publishTime"],
        superChapterId = map["superChapterId"],
        superChapterName = map["superChapterName"],
        tags = map["tags"],
        title = map["title"],
        type = map["type"],
        userId = map["userId"],
        visible = map["visible"],
        zan = map["zan"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apkLink'] = apkLink;
    data['author'] = author;
    data['chapterId'] = chapterId;
    data['chapterName'] = chapterName;
    data['collect'] = collect;
    data['courseId'] = courseId;
    data['desc'] = desc;
    data['envelopePic'] = envelopePic;
    data['fresh'] = fresh;
    data['id'] = id;
    data['link'] = link;
    data['niceDate'] = niceDate;
    data['origin'] = origin;
    data['prefix'] = prefix;
    data['projectLink'] = projectLink;
    data['publishTime'] = publishTime;
    data['superChapterId'] = superChapterId;
    data['superChapterName'] = superChapterName;
    data['tags'] = tags;
    data['title'] = title;
    data['type'] = type;
    data['userId'] = userId;
    data['visible'] = visible;
    data['zan'] = zan;
    return data;
  }
}
