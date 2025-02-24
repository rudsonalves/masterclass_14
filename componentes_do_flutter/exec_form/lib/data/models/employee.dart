enum Sex { male, female }

class Employee {
  int? id;
  final String name;
  final String lastName;
  final Sex sex;
  final String designation;
  final String foneNumber;

  Employee({
    this.id,
    required this.name,
    required this.lastName,
    required this.sex,
    required this.designation,
    required this.foneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'sex': sex.name,
      'designation': designation,
      'foneNumber': foneNumber,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as int?,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      sex: Sex.values.firstWhere(
        (sex) => sex.name == (map['sex'] as String),
        orElse: () => Sex.male,
      ),
      designation: map['designation'] as String,
      foneNumber: map['foneNumber'] as String,
    );
  }
}
