class MessagesModel {
  num? messageId;
  String? message;
  num? messageStatus;
  num? isNew;
  num? spical;
  num? idCategorie;

  MessagesModel({
    this.messageId,
    this.message,
    this.messageStatus,
    this.isNew,
    this.spical,
    this.idCategorie,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
        messageId: num.tryParse(json['message_id'].toString()),
        message: json['message']?.toString(),
        messageStatus: num.tryParse(json['message_status'].toString()),
        isNew: num.tryParse(json['is_new'].toString()),
        spical: num.tryParse(json['spical'].toString()),
        idCategorie: num.tryParse(json['id_categorie'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (messageId != null) 'message_id': messageId,
        if (message != null) 'message': message,
        if (messageStatus != null) 'message_status': messageStatus,
        if (isNew != null) 'is_new': isNew,
        if (spical != null) 'spical': spical,
        if (idCategorie != null) 'id_categorie': idCategorie,
      };
}
