import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:id_scanner/src/providers/person_provider.dart';
import 'package:id_scanner/src/widgets/person_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget { 
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String _barcodeData;
  late String _data;

  @override
  void initState() { 
    super.initState();
    _data = "Presione el botón para escaner el código de barras que contenga la cédula.";
    _barcodeData = "";
  }

  Future<void> scanBarCode(BuildContext context) async {
    try{
      _barcodeData = await FlutterBarcodeScanner.scanBarcode(
        '#FFFFFF', 
        'Cancelar lectura', 
        false, 
        ScanMode.BARCODE
      );

      if(!mounted) return;

      setState(() => _data = _barcodeData.replaceAll('-', ''));
    }
    on PlatformException {
      _data = 'Ha ocurrido un error al escanear el codigo de barras';
    }
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<PersonProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade700,
        appBar: AppBar(
          title: Text('Escaner de código de barras'),
          backgroundColor: Colors.blue.shade700,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade500,
          foregroundColor: Colors.white,
          elevation: 0,
          child: Icon(Icons.filter_center_focus),
          onPressed: () => scanBarCode(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: _barcodeData == "" 
            ? Text(
              _data,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            )
            : Text(_data) // PersonCard(futureData: provider.fetchPersonData(_data))
          ),
        ),
      ),
    );
  }
}