import 'package:flutter/material.dart';
import 'package:id_scanner/src/models/person_model.dart';

class PersonCard extends StatelessWidget {

  late final Future<Person> futureData;

  PersonCard({
    required this.futureData
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Person>(
      future: futureData,
      builder: (context, snapshot){
        if(!snapshot.hasData)
          return CircularProgressIndicator(color: Colors.white, backgroundColor: Colors.lightBlue);

        if(snapshot.hasData) 
          return _CustomCard(personData: snapshot.requireData);

        return Container();
      }
    );
  }
}

class _CustomCard extends StatelessWidget {

  late final Person personData;

  _CustomCard({
    required this.personData
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 7),
              blurRadius: 10,
            )
          ]
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _CardImage(imageUrl: personData.foto),
            _CardDetails(
              name: personData.nombres, 
              id: personData.cedula,
              lastnames: [
                personData.apellido1,
                personData.apellido2
              ],
              birthdate: personData.fechaNacimiento,
              birthplace: personData.lugarNacimiento,
              sex: personData.idSexo,
            ),
          ],
        ),
      ), 
    );
  }
}

class _CardDetails extends StatelessWidget {

  late final String name;
  late final String id;
  late final List<String> lastnames;
  late final DateTime birthdate;
  late final String birthplace;
  late final String sex;

  _CardDetails({
    required this.name,
    required this.id,
    required this.lastnames,
    required this.birthdate,
    required this.birthplace,
    required this.sex
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$name ${lastnames[0]} ${lastnames[1]}', 
            style: TextStyle(
              fontSize: 20, 
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Cédula: $id', 
            style: TextStyle(
              fontSize: 18, 
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'Lugar de nacimiento: $birthplace', 
            style: TextStyle(
              fontSize: 18, 
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'Fecha de nacimiento: ${birthdate.toString().replaceAll('00:00:00.000', '')}', 
            style: TextStyle(
              fontSize: 18, 
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'Sexo: $sex', 
            style: TextStyle(
              fontSize: 18, 
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}

class _CardImage extends StatelessWidget {

  late final String imageUrl;

  _CardImage({
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 660,
        child: FadeInImage(
          placeholder: NetworkImage('https://i.stack.imgur.com/y9DpT.jpg'), 
          image: NetworkImage(imageUrl), 
          fit: BoxFit.cover
        ),
      ),
    );
  }
}