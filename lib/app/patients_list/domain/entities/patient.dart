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

  factory Patient.fromMap(Map<String, dynamic> json) {
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

  static List<Patient> fromMapList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => Patient.fromMap(json as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'Nome': name,
      'Idade': age,
      'CPF': cpf,
      'RG': rg,
      'Data de nascimento': birthDate,
      'Gênero': gender,
      'Signo do zodíaco': zodiacSign,
      'Nome da mãe': motherName,
      'Nome do pai': fatherName,
      'Email': email,
      'CEP': cep,
      'Endereço': address,
      'Número da casa': houseNumber,
      'Bairro': neighborhood,
      'Cidade': city,
      'Estado': state,
      'Telefone fixo': landlinePhone,
      'Celular': mobilePhone,
      'Altura': height,
      'Peso': '$weight kg',
      'Tipo sanguíneo': bloodType,
      'Cor': color,
    };
  }
}
