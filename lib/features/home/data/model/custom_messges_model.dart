class CustomMessgesModel {
  num? messageId;
  String? message;
  num? messageStatus;
  num? isNew;
  num? spical;
  num? idCategorie;
  num? categoriesId;
  num? categorieStatus;
  String? categorie;
  num? faviorte_id;
  num? isFaviorte;

  CustomMessgesModel(
      {this.messageId,
      this.message,
      this.messageStatus,
      this.isNew,
      this.spical,
      this.idCategorie,
      this.categoriesId,
      this.categorieStatus,
      this.categorie,
      this.faviorte_id,
      this.isFaviorte});

  factory CustomMessgesModel.fromJson(Map<String, dynamic> json) {
    return CustomMessgesModel(
      messageId: num.tryParse(json['message_id'].toString()),
      message: json['message']?.toString(),
      messageStatus: num.tryParse(json['message_status'].toString()),
      isNew: num.tryParse(json['is_new'].toString()),
      spical: num.tryParse(json['spical'].toString()),
      idCategorie: num.tryParse(json['id_categorie'].toString()),
      categoriesId: num.tryParse(json['categories_id'].toString()),
      categorieStatus: num.tryParse(json['categorie_status'].toString()),
      categorie: json['categorie']?.toString(),
      faviorte_id: num.tryParse(json['faviorte_id'].toString()),
      isFaviorte: num.tryParse(json['isFaviorte'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        if (messageId != null) 'message_id': messageId,
        if (message != null) 'message': message,
        if (messageStatus != null) 'message_status': messageStatus,
        if (isNew != null) 'is_new': isNew,
        if (spical != null) 'spical': spical,
        if (idCategorie != null) 'id_categorie': idCategorie,
        if (categoriesId != null) 'categories_id': categoriesId,
        if (categorieStatus != null) 'categorie_status': categorieStatus,
        if (categorie != null) 'categorie': categorie,
      };
}
