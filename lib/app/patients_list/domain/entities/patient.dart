class Patient {
  final String name;
  final int age;
  final String cpf;
  final String rg;
  final String birthDate;
  final String gender;
  final String zodiacSign;
  final String motherName;
  final String fatherName;
  final String email;
  // final String password;
  final String cep;
  final String address;
  final int houseNumber;
  final String neighborhood;
  final String city;
  final String state;
  final String landlinePhone;
  final String mobilePhone;
  final String height;
  final int weight;
  final String bloodType;
  final String color;

  Patient({
    required this.name,
    required this.age,
    required this.cpf,
    required this.rg,
    required this.birthDate,
    required this.gender,
    required this.zodiacSign,
    required this.motherName,
    required this.fatherName,
    required this.email,
    // required this.password,
    required this.cep,
    required this.address,
    required this.houseNumber,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.landlinePhone,
    required this.mobilePhone,
    required this.height,
    required this.weight,
    required this.bloodType,
    required this.color,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      name: json['nome'],
      age: json['idade'],
      cpf: json['cpf'],
      rg: json['rg'],
      birthDate: json['data_nasc'],
      gender: json['sexo'],
      zodiacSign: json['signo'],
      motherName: json['mae'],
      fatherName: json['pai'],
      email: json['email'],
      // password: json['senha'],
      cep: json['cep'],
      address: json['endereco'],
      houseNumber: json['numero'],
      neighborhood: json['bairro'],
      city: json['cidade'],
      state: json['estado'],
      landlinePhone: json['telefone_fixo'],
      mobilePhone: json['celular'],
      height: json['altura'],
      weight: json['peso'],
      bloodType: json['tipo_sanguineo'],
      color: json['cor'],
    );
  }

  static List<Patient> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => Patient.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
