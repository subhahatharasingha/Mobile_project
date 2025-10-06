class StepModel {
  final int stepNumber;
  final String description;

  StepModel({required this.stepNumber, required this.description});

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      StepModel(stepNumber: json['stepNumber'] as int, description: json['description'] as String);

  Map<String, dynamic> toJson() => {'stepNumber': stepNumber, 'description': description};
}
