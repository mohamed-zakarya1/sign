class SwaggerModel {
  List model;
  SwaggerModel({required this.model});
  factory SwaggerModel.fromJson(List json) {
    return SwaggerModel(model: json);
  }
}