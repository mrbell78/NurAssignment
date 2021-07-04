class ResponseDomainlist {
  String context;
  List<HydraMember> hydraMember;
  int hydraTotalItems;

  ResponseDomainlist({this.context, this.hydraMember, this.hydraTotalItems});

  ResponseDomainlist.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    if (json['hydra:member'] != null) {
      hydraMember = new List<HydraMember>();
      json['hydra:member'].forEach((v) {
        hydraMember.add(new HydraMember.fromJson(v));
      });
    }
    hydraTotalItems = json['hydra:totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    if (this.hydraMember != null) {
      data['hydra:member'] = this.hydraMember.map((v) => v.toJson()).toList();
    }
    data['hydra:totalItems'] = this.hydraTotalItems;
    return data;
  }
}

class HydraMember {
  String id;
  String domain;
  bool isActive;
  bool isPrivate;
  String createdAt;
  String updatedAt;

  HydraMember(
      {this.id,
        this.domain,
        this.isActive,
        this.isPrivate,
        this.createdAt,
        this.updatedAt});

  HydraMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    isActive = json['isActive'];
    isPrivate = json['isPrivate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['domain'] = this.domain;
    data['isActive'] = this.isActive;
    data['isPrivate'] = this.isPrivate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
