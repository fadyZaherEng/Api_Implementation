class PayslipModel {
  double salary, basicSalary, hour, additions, decuted;

  PayslipModel({
    required this.salary,
    required this.basicSalary,
    required this.hour,
    required this.additions,
    required this.decuted,
  });

  Map<String, dynamic> toMap() {
    return {
      'salary': salary,
      'basicSalary': basicSalary,
      'hour': hour,
      'additions': additions,
      'decuted': decuted,
    };
  }

  factory PayslipModel.fromMap(Map<String, dynamic> map) {
    return PayslipModel(
      salary: map['salary'],
      basicSalary: map['basicSalary'],
      hour: map['hour'],
      additions: map['additions'],
      decuted: map['decuted'],
    );
  }
}
