import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

class Person {
  Person({
    required this.cedula,
    required this.nombres,
    required this.apellido1,
    required this.apellido2,
    required this.fechaNacimiento,
    required this.lugarNacimiento,
    required this.idCategoria,
    required this.idSexo,
    required this.idEstadoCivil,
    required this.idOcupacion,
    required this.idNacionalidad,
    required this.idMunicipio,
    required this.idColegio,
    required this.idCausaCancelacion,
    required this.idEstatus,
    required this.estatusCedulaAzul,
    required this.cedulaAnterior,
    required this.munCed,
    required this.seqCed,
    required this.verCed,
    required this.v2004,
    required this.v2008,
    required this.v2012,
    required this.v2016,
    required this.pld,
    required this.prd,
    required this.prsc,
    required this.prm,
    required this.multiplicadorNombreCompleto,
    required this.multiplicadorCedula,
    required this.simpatiaDescripcion,
    required this.ilocalizable,
    required this.apodo,
    required this.padronLf,
    required this.ok,
    required this.foto,
  });

  final String cedula;
  final String nombres;
  final String apellido1;
  final String apellido2;
  final DateTime? fechaNacimiento;
  final String lugarNacimiento;
  final int idCategoria;
  final String idSexo;
  final String idEstadoCivil;
  final int idOcupacion;
  final int idNacionalidad;
  final int idMunicipio;
  final int idColegio;
  final dynamic idCausaCancelacion;
  final String idEstatus;
  final dynamic estatusCedulaAzul;
  final dynamic cedulaAnterior;
  final String munCed;
  final String seqCed;
  final String verCed;
  final dynamic v2004;
  final dynamic v2008;
  final dynamic v2012;
  final dynamic v2016;
  final dynamic pld;
  final dynamic prd;
  final dynamic prsc;
  final dynamic prm;
  final dynamic multiplicadorNombreCompleto;
  final dynamic multiplicadorCedula;
  final dynamic simpatiaDescripcion;
  final dynamic ilocalizable;
  final dynamic apodo;
  final dynamic padronLf;
  final bool ok;
  final String foto;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    cedula: json["Cedula"] == null ? "" : json["Cedula"],
    nombres: json["Nombres"] == null ? "" : json["Nombres"],
    apellido1: json["Apellido1"] == null ? "" : json["Apellido1"],
    apellido2: json["Apellido2"] == null ? "" : json["Apellido2"],
    fechaNacimiento: json["FechaNacimiento"] == null ? DateTime.now() : DateTime.parse(json["FechaNacimiento"]),
    lugarNacimiento: json["LugarNacimiento"] == null ? "" : json["LugarNacimiento"],
    idCategoria: json["IDCategoria"] == null ? 0 : json["IDCategoria"],
    idSexo: json["IdSexo"] == null ? "" : json["IdSexo"],
    idEstadoCivil: json["IdEstadoCivil"] == null ? "" : json["IdEstadoCivil"],
    idOcupacion: json["IdOcupacion"] == null ? 0 : json["IdOcupacion"],
    idNacionalidad: json["IDNacionalidad"] == null ? 0 : json["IDNacionalidad"],
    idMunicipio: json["IDMunicipio"] == null ? 0 : json["IDMunicipio"],
    idColegio: json["IDColegio"] == null ? 0 : json["IDColegio"],
    idCausaCancelacion: json["IDCausaCancelacion"],
    idEstatus: json["IDEstatus"] == null ? "" : json["IDEstatus"],
    estatusCedulaAzul: json["EstatusCedulaAzul"],
    cedulaAnterior: json["CedulaAnterior"],
    munCed: json["mun_ced"] == null ? "" : json["mun_ced"],
    seqCed: json["seq_ced"] == null ? "" : json["seq_ced"],
    verCed: json["ver_ced"] == null ? "" : json["ver_ced"],
    v2004: json["V2004"],
    v2008: json["V2008"],
    v2012: json["V2012"],
    v2016: json["V2016"],
    pld: json["PLD"],
    prd: json["PRD"],
    prsc: json["PRSC"],
    prm: json["PRM"],
    multiplicadorNombreCompleto: json["Multiplicador_NombreCompleto"],
    multiplicadorCedula: json["Multiplicador_Cedula"],
    simpatiaDescripcion: json["Simpatia_Descripcion"],
    ilocalizable: json["Ilocalizable"],
    apodo: json["Apodo"],
    padronLf: json["PadronLF"],
    ok: json["ok"] == null ? false : json["ok"],
    foto: json["foto"] == null ? "" : json["foto"],
  );
}
