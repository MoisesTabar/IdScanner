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
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 7),
              blurRadius: 10,
            )
          ]
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _CardImage(imageUrl: personData.foto),
            _CardDetails(name: personData.nombres, id: personData.cedula)
          ],
        ),
      ), 
    );
  }
}

class _CardDetails extends StatelessWidget {

  late final String name;
  late final String id;

  _CardDetails({
    required this.name,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.blue.shade500,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), topRight: Radius.circular(25))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name, 
              style: TextStyle(
                fontSize: 20, 
                color: Colors.white, 
                fontWeight: FontWeight.bold
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              id, 
              style: TextStyle(
                fontSize: 20, 
                color: Colors.white, 
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
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
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/not-found.png'),
          image: NetworkImage(imageUrl), 
          fit: BoxFit.cover
        ),
      ),
    );
  }
}