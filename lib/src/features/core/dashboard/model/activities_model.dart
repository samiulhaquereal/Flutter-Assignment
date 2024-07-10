class ActivitiesModel {
  List<Data>? data;

  ActivitiesModel({this.data});

  ActivitiesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? date;
  String? name;
  String? category;
  String? location;

  Data({this.date, this.name, this.category, this.location});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    name = json['name'];
    category = json['category'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['name'] = this.name;
    data['category'] = this.category;
    data['location'] = this.location;
    return data;
  }
}
