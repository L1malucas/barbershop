class BarbershopModel {
  final int id;
  final String name;
  final String email;
  final List<String> openingDays;
  final List<int> openingHours;

  BarbershopModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.openingDays,
      required this.openingHours});

      factory BarbershopModel.fromMap(Map<String, dynamic> json){
        return switch (json){
          'id': final int id,
          'name': final String name,
          'email': final String email,
          'opening_days': final List openingDays.cast<String>(),
          'opening_hours': final List openingHours.cast<int>(),

        } => BarbershopModel(id: id, name: name, email: email, openingDays: openingDays, openingHours: openingHours), _ => throw ArgumentError('Invalid Json')
      };
}
