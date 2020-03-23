class PredictCar {
  String bodyStyle;
  String confidence;
  String make;
  String model;
  String modelYear;

  PredictCar(
      {this.bodyStyle, this.confidence, this.make, this.model, this.modelYear});

  PredictCar.fromJson(Map<String, dynamic> json) {
    bodyStyle = json['body_style'];
    confidence = json['confidence'];
    make = json['make'];
    model = json['model'];
    modelYear = json['model_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body_style'] = this.bodyStyle;
    data['confidence'] = this.confidence;
    data['make'] = this.make;
    data['model'] = this.model;
    data['model_year'] = this.modelYear;
    return data;
  }
}
