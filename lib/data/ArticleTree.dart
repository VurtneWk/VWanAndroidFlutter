class ArticleTree {
  final List<ArticleTreeData> data;
  final int errorCode;
  final String errorMsg;

  ArticleTree.fromJsonMap(Map<String, dynamic> map)
      : data = List<ArticleTreeData>.from(map["data"].map((it) => ArticleTreeData.fromJsonMap(it))),
        errorCode = map["errorCode"],
        errorMsg = map["errorMsg"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] =
        data != null ? this.data.map((v) => v.toJson()).toList() : null;
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    return data;
  }
}

class Children {
  final List<Object> children;
  final int courseId;
  final int id;
  final String name;
  final int order;
  final int parentChapterId;
  final bool userControlSetTop;
  final int visible;

  Children.fromJsonMap(Map<String, dynamic> map)
      : children = map["children"],
        courseId = map["courseId"],
        id = map["id"],
        name = map["name"],
        order = map["order"],
        parentChapterId = map["parentChapterId"],
        userControlSetTop = map["userControlSetTop"],
        visible = map["visible"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['children'] = children;
    data['courseId'] = courseId;
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['parentChapterId'] = parentChapterId;
    data['userControlSetTop'] = userControlSetTop;
    data['visible'] = visible;
    return data;
  }

  @override
  String toString() {
    return 'Children{children: $children, courseId: $courseId, id: $id, name: $name, order: $order, parentChapterId: $parentChapterId, userControlSetTop: $userControlSetTop, visible: $visible}';
  }

}

class ArticleTreeData {
  final List<Children> children;
  final int courseId;
  final int id;
  final String name;
  final int order;
  final int parentChapterId;
  final bool userControlSetTop;
  final int visible;

  ArticleTreeData.fromJsonMap(Map<String, dynamic> map)
      : children = List<Children>.from(
            map["children"].map((it) => Children.fromJsonMap(it))),
        courseId = map["courseId"],
        id = map["id"],
        name = map["name"],
        order = map["order"],
        parentChapterId = map["parentChapterId"],
        userControlSetTop = map["userControlSetTop"],
        visible = map["visible"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['children'] =
        children != null ? this.children.map((v) => v.toJson()).toList() : null;
    data['courseId'] = courseId;
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['parentChapterId'] = parentChapterId;
    data['userControlSetTop'] = userControlSetTop;
    data['visible'] = visible;
    return data;
  }
}
