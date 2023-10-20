class Patient {
  String name;
  int age;
  String cpf;
  String rg;
  String birthDate;
  String gender;
  String zodiacSign;
  String motherName;
  String fatherName;
  String email;
  // String password;
  String cep;
  String address;
  int houseNumber;
  String neighborhood;
  String city;
  String state;
  String landlinePhone;
  String mobilePhone;
  String height;
  int weight;
  String bloodType;
  String color;

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
}
