class KitchenModel {
  KitchenModel({
    this.message,
    this.data,
    this.isSucsseded,
    this.status,
  });

  KitchenModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }

  String? message;
  Data? data;
  bool? isSucsseded;
  int? status;
}

class Data {
  Data({
    this.garanet,
    this.panel,
    this.platingTopWall,
    this.handType,
    this.thickeningTop,
    this.corniche,
    this.lighting,
    this.magla,
    this.maglaHole,
    this.outerStrop,
    this.shafat,
    this.batery,
    this.healthLinking,
    this.accessories,
    this.unites,
  });

  Data.fromJson(dynamic json) {
    garanet =
        json['garanet'] != null ? Garanet.fromJson(json['garanet']) : null;
    panel = json['panel'] != null ? Panel.fromJson(json['panel']) : null;
    platingTopWall = json['platingTopWall'] != null
        ? PlatingTopWall.fromJson(json['platingTopWall'])
        : null;
    handType =
        json['handType'] != null ? HandType.fromJson(json['handType']) : null;
    thickeningTop = json['thickeningTop'] != null
        ? ThickeningTop.fromJson(json['thickeningTop'])
        : null;
    corniche =
        json['corniche'] != null ? Corniche.fromJson(json['corniche']) : null;
    lighting =
        json['lighting'] != null ? Lighting.fromJson(json['lighting']) : null;
    magla = json['magla'] != null ? Magla.fromJson(json['magla']) : null;
    maglaHole = json['maglaHole'] != null
        ? MaglaHole.fromJson(json['maglaHole'])
        : null;
    outerStrop = json['outerStrop'] != null
        ? OuterStrop.fromJson(json['outerStrop'])
        : null;
    shafat = json['shafat'] != null ? Shafat.fromJson(json['shafat']) : null;
    batery = json['batery'] != null ? Batery.fromJson(json['batery']) : null;
    healthLinking = json['healthLinking'] != null
        ? HealthLinking.fromJson(json['healthLinking'])
        : null;
    accessories = json['accessories'] != null
        ? Accessories.fromJson(json['accessories'])
        : null;
    unites = json['unites'] != null ? Unites.fromJson(json['unites']) : null;
  }

  Garanet? garanet;
  Panel? panel;
  PlatingTopWall? platingTopWall;
  HandType? handType;
  ThickeningTop? thickeningTop;
  Corniche? corniche;
  Lighting? lighting;
  Magla? magla;
  MaglaHole? maglaHole;
  OuterStrop? outerStrop;
  Shafat? shafat;
  Batery? batery;
  HealthLinking? healthLinking;
  Accessories? accessories;
  Unites? unites;
}

class Unites {
  Unites({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  Unites.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class Accessories {
  Accessories({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  Accessories.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class HealthLinking {
  HealthLinking({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  HealthLinking.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class Batery {
  Batery({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  Batery.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class Shafat {
  Shafat({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  Shafat.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class OuterStrop {
  OuterStrop({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  OuterStrop.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class MaglaHole {
  MaglaHole({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  MaglaHole.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class Magla {
  Magla({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  Magla.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class Lighting {
  Lighting({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  Lighting.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class Corniche {
  Corniche({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  Corniche.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class ThickeningTop {
  ThickeningTop({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  ThickeningTop.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class HandType {
  HandType({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  HandType.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class PlatingTopWall {
  PlatingTopWall({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  PlatingTopWall.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class Panel {
  Panel({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  Panel.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class Garanet {
  Garanet({
    this.statusCategoryId,
    this.defaultDesc,
    this.statuses,
  });

  Garanet.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null && json['statuses'] != []) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    } else {
      statuses = [];
    }
  }

  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;
}

class Statuses {
  Statuses({
    this.defaultDesc,
    this.description,
    this.descriptionEn,
    this.statusId,
    this.price,
  });

  Statuses.fromJson(dynamic json) {
    defaultDesc = json['defaultDesc'];
    description = json['description'] ?? json['defaultDesc'];
    descriptionEn = json['descriptionEn'];
    statusId = json['statusId'];
    price = json['price'];
  }

  String? defaultDesc;
  String? description;
  dynamic descriptionEn;
  int? statusId;
  dynamic price;
}
