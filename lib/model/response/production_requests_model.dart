class ProductionRequestsModel {
  ProductionRequestsModel({
    required this.backWood,
    required this.handType,
    required this.naceg,
    required this.methodInstallingHands,
    required this.glassHole,
    required this.cupboardHeight,
    required this.upperCupboardHeight,
    required this.pits,
    required this.upperKaraneshHeight,
    required this.stairsType,
    required this.fysalaType,
    required this.magla,
    required this.maglaHole,
    required this.shafat,
    required this.banel,
    required this.granet,
    required this.topColor,
    required this.glassesColor,
    required this.message,
    required this.innerColor,
    required this.shutterWood,
    required this.isSucsseded,
    required this.status,
  });

  final String message;
  final List<RequestModel> innerColor;
  final List<RequestModel> shutterWood;
  final List<RequestModel> handType;
  final List<RequestModel> naceg;
  final List<RequestModel> methodInstallingHands;
  final List<RequestModel> glassHole;
  final List<RequestModel> cupboardHeight;
  final List<RequestModel> upperCupboardHeight;
  final List<RequestModel> pits;
  final List<RequestModel> upperKaraneshHeight;
  final List<RequestModel> stairsType;
  final List<RequestModel> fysalaType;
  final List<RequestModel> magla;
  final List<RequestModel> maglaHole;
  final List<RequestModel> shafat;
  final List<RequestModel> banel;
  final List<RequestModel> granet;
  final List<RequestModel> topColor;
  final List<RequestModel> glassesColor;
  final List<RequestModel> backWood;
  final bool isSucsseded;
  final int status;

  factory ProductionRequestsModel.fromJson(Map<String, dynamic> map) => ProductionRequestsModel(
        message: map['message'],
        innerColor: map['data']['innerColor']['statuses'] == null
            ? []
            : List.from(
                map['data']['innerColor']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        shutterWood: map['data']['shutterWood']['statuses'] == null
            ? []
            : List.from(
                map['data']['shutterWood']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        backWood: map['data']['backWood']['statuses'] == null
            ? []
            : List.from(
                map['data']['backWood']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        banel: map['data']['banel']['statuses'] == null
            ? []
            : List.from(
                map['data']['banel']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        cupboardHeight: map['data']['cupboardHeight']['statuses'] == null
            ? []
            : List.from(
                map['data']['cupboardHeight']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        fysalaType: map['data']['fysalaType']['statuses'] == null
            ? []
            : List.from(
                map['data']['fysalaType']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        glassesColor: map['data']['glassesColor']['statuses'] == null
            ? []
            : List.from(
                map['data']['glassesColor']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        glassHole: map['data']['glassHole']['statuses'] == null
            ? []
            : List.from(
                map['data']['glassHole']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        granet: map['data']['granet']['statuses'] == null
            ? []
            : List.from(
                map['data']['granet']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        handType: map['data']['handType']['statuses'] == null
            ? []
            : List.from(
                map['data']['handType']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        magla: map['data']['magla']['statuses'] == null
            ? []
            : List.from(
                map['data']['magla']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        maglaHole: map['data']['maglaHole']['statuses'] == null
            ? []
            : List.from(
                map['data']['maglaHole']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        methodInstallingHands: map['data']['methodInstallingHands']['statuses'] == null
            ? []
            : List.from(
                map['data']['methodInstallingHands']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        naceg: map['data']['naceg']['statuses'] == null
            ? []
            : List.from(
                map['data']['naceg']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        pits: map['data']['pits']['statuses'] == null
            ? []
            : List.from(
                map['data']['pits']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        shafat: map['data']['shafat']['statuses'] == null
            ? []
            : List.from(
                map['data']['shafat']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        stairsType: map['data']['stairsType']['statuses'] == null
            ? []
            : List.from(
                map['data']['stairsType']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        topColor: map['data']['topColor']['statuses'] == null
            ? []
            : List.from(
                map['data']['topColor']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        upperCupboardHeight: map['data']['upperCupboardHeight']['statuses'] == null
            ? []
            : List.from(
                map['data']['upperCupboardHeight']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        upperKaraneshHeight: map['data']['upperKaraneshHeight']['statuses'] == null
            ? []
            : List.from(
                map['data']['upperKaraneshHeight']['statuses'].map(
                  (e) => RequestModel.fromJson(e),
                ),
              ),
        isSucsseded: map['isSucsseded'],
        status: map['status'],
      );
}

class RequestModel {
  RequestModel(
      {required this.defaultDesc,
      required this.description,
      required this.price,
      required this.statusId});

  final String defaultDesc;
  final String description;
  final int price;
  final int statusId;

  factory RequestModel.fromJson(Map<String, dynamic> map) => RequestModel(
        defaultDesc: map['defaultDesc'],
        description: map['description'],
        price: map['price'],
        statusId: map['statusId'],
      );
}
