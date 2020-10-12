import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pc_expert/model/Constant.dart';
import 'package:pc_expert/model/StepModel.dart';
import 'package:provider/provider.dart';

class DetailsPage2 extends StatefulWidget {
  DetailsPage2({Key key}) : super(key: key);

  @override
  _DetailsPage2State createState() => _DetailsPage2State();
}

class _DetailsPage2State extends State<DetailsPage2> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 90,
                    color: Colors.deepPurpleAccent,
                  ),
                  MyForm(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 40,
            right: 40,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black12,
                        offset: Offset(10.0, 10.0))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(provider.marqueDePc,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      provider.referanceDePc != null
                          ? Text(provider.referanceDePc,
                              style: GoogleFonts.aBeeZee(fontSize: 14))
                          : Text(""),
                      provider.serieDePc != null
                          ? Text(provider.serieDePc,
                              style: GoogleFonts.aBeeZee(fontSize: 14))
                          : Text(""),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("images/${provider.imagePath}"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget marqueInfo(String desc, String name) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        desc,
        style: GoogleFonts.abel(fontSize: 20, fontWeight: FontWeight.w900),
      ),
      Text(
        name,
        style: GoogleFonts.abel(fontSize: 22),
      ),
    ],
  );
}

class MyForm extends StatefulWidget {
  MyForm({Key key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Text(
            "Saisie les informations de votre pc.",
            style: GoogleFonts.abel(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 15),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DropdownButton<String>(
                    items: provider.referanceList.map((String value) {
                      return new DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    hint: Text("Referance de pc"),
                    isExpanded: true,
                    onChanged: (value1) {
                      provider.selectReferance(value1);
                    },
                  ),
                  TextField(
                      onChanged: (value) => provider.selectSerieDePc(value),
                      decoration: InputDecoration(
                          labelText: "Numero de Serial",
                          helperText: "Example: t460, 840 G4, E7240",
                          helperStyle: TextStyle(color: Colors.blue)))
                ],
              ),
            ),
          ),
          Text(
            "Choisir votre composant.",
            style: GoogleFonts.abel(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 15),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                        items: lesComposant.map((String value) {
                          return new DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        hint: provider.composantDePc == null
                            ? Text("Composant demandé")
                            : Text(provider.composantDePc),
                        onChanged: (value1) {
                          provider.selectComposantDemander(value1);
                        },
                      ),
                      Container(
                        height: 60,
                        child: provider.imagePathComposant == null
                            ? null
                            : Image.asset(
                                "images/${provider.imagePathComposant}",
                                fit: BoxFit.cover,
                              ),
                      )
                    ],
                  ),
                  TextField(
                      onChanged: (value) => provider.selectComposant(value),
                      decoration: InputDecoration(
                        labelText: "Autres informations",
                      )),
                  Row(
                    children: [
                      Text("Envoyer une photo si vous voulez"),
                      Spacer(),
                      IconButton(
                        onPressed: () => provider.pickImage(true),
                        icon: Icon(
                          Icons.camera,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () => provider.pickImage(false),
                        icon: Icon(
                          Icons.image,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            "Votre informations.",
            style: GoogleFonts.abel(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                      onChanged: (value) => provider.funUserName(value),
                      decoration: InputDecoration(
                        labelText: "Nom",
                      )),
                  TextField(
                      onChanged: (value) =>
                          provider.funNumberPhoneFormat(value),
                      decoration: InputDecoration(
                          labelText: "WhatsApp",
                          helperText:
                              "Votre real numero de whatsapp pour vouz contacter",
                          helperStyle: TextStyle(color: Colors.blue))),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 60),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white)),
                color: Colors.blue,
                elevation: 5,
                child: Text(
                  "Envoyer le demande",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {}),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
