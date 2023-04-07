class Usuario {
  String? nome;
  String? sobrenome;
  String? telefone;
  String? email;
  String? cpf;

  Usuario({this.nome, this.sobrenome, this.telefone, this.email, this.cpf});

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    sobrenome = json['sobrenome'];
    telefone = json['telefone'];
    email = json['email'];
    cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['sobrenome'] = this.sobrenome;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['cpf'] = this.cpf;
    return data;
  }
}
