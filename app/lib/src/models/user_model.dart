class BaseUserModel {
  final int id;
  final String name;
  final String email;
  final String? avatar;

  BaseUserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });
}

class AdmUserModel extends BaseUserModel {
  final List<String>? workDays;
  final List<int>? workHours;

  AdmUserModel(
      {this.workDays,
      this.workHours,
      super.avatar,
      required super.id,
      required super.name,
      required super.email});

  factory AdmUserModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
      } =>
        AdmUserModel(
          id: id,
          name: name,
          email: email,
          avatar: json['avatar'],
          workHours: json['work_hours']?.cast<int>(),
          workDays: json['work_days']?.cast<String>(),
        ),
      _ => throw ArgumentError('Invalid Json')
    };
  }
}

class EmployeeUserModel extends BaseUserModel {
  final List<String> workDays;
  final List<int> workHours;
  final int barbershopId;

  EmployeeUserModel(
      {required super.id,
      required super.name,
      required super.email,
      required this.barbershopId,
      required this.workDays,
      required this.workHours,
      super.avatar});

  factory EmployeeUserModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
        'barbershop_id': final int barbershopId,
        'work_days': final List workDays,
        'work_hours': final List workHours,
      } =>
        EmployeeUserModel(
          id: id,
          name: name,
          email: email,
          barbershopId: barbershopId,
          avatar: json['avatar'],
          workDays: workDays.cast<String>(),
          workHours: workHours.cast<int>(),
        ),
      _ => throw ArgumentError('Invalid Json')
    };
  }
}
