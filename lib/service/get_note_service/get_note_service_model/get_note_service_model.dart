class GetNoteServiceModel {
  List<Documents>? documents;

  GetNoteServiceModel({this.documents});

  GetNoteServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  String? name;
  Fields? fields;
  String? createTime;
  String? updateTime;

  Documents({this.name, this.fields, this.createTime, this.updateTime});

  Documents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    data['createTime'] = createTime;
    data['updateTime'] = updateTime;
    return data;
  }
}

class Fields {
  Latitude? latitude;
  Image? image;
  Image? title;
  Image? content;
  Latitude? longitude;
  Image? clock;

  Fields(
      {this.latitude,
      this.image,
      this.title,
      this.content,
      this.longitude,
      this.clock});

  Fields.fromJson(Map<String, dynamic> json) {
    latitude =
        json['latitude'] != null ? Latitude.fromJson(json['latitude']) : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    title = json['title'] != null ? Image.fromJson(json['title']) : null;
    content = json['content'] != null ? Image.fromJson(json['content']) : null;
    longitude =
        json['longitude'] != null ? Latitude.fromJson(json['longitude']) : null;
    clock = json['clock'] != null ? Image.fromJson(json['clock']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (latitude != null) {
      data['latitude'] = latitude!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (content != null) {
      data['content'] = content!.toJson();
    }
    if (longitude != null) {
      data['longitude'] = longitude!.toJson();
    }
    if (clock != null) {
      data['clock'] = clock!.toJson();
    }
    return data;
  }
}

class Latitude {
  double? doubleValue;

  Latitude({this.doubleValue});

  Latitude.fromJson(Map<String, dynamic> json) {
    doubleValue = json['doubleValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doubleValue'] = doubleValue;
    return data;
  }
}

class Image {
  String? stringValue;

  Image({this.stringValue});

  Image.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    return data;
  }
}
