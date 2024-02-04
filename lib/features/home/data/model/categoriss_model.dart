class CategorissModel {
  num? categoriesId;
  num? categorieStatus;
  String? categorie;

  CategorissModel({
    this.categoriesId,
    this.categorieStatus,
    this.categorie,
  });

  factory CategorissModel.fromJson(Map<String, dynamic> json) {
    return CategorissModel(
      categoriesId: num.tryParse(json['categories_id'].toString()),
      categorieStatus: num.tryParse(json['categorie_status'].toString()),
      categorie: json['categorie']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (categoriesId != null) 'categories_id': categoriesId,
        if (categorieStatus != null) 'categorie_status': categorieStatus,
        if (categorie != null) 'categorie': categorie,
      };
}
