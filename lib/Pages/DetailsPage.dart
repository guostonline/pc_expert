import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pc_expert/Pages/ComposantsPage.dart';
import 'package:pc_expert/Pages/MarquePage.dart';
import 'package:pc_expert/Pages/WelcomePage.dart';
import 'package:pc_expert/model/FireStore.dart';
import 'package:pc_expert/model/StepModel.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DatailsPage extends StatefulWidget {
  @override
  _DetailPagesState createState() => _DetailPagesState();
}

final userNameController = TextEditingController();
final numberPhoneController = TextEditingController();
bool userNameValidate = false;
bool numberPhoneValidate = false;
String myTest;
String formattedDate = DateFormat('d/MM/yy').format(DateTime.now());

class _DetailPagesState extends State<DatailsPage> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Scaffold(
      //backgroundColor: Color(0xff242A36),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            ReferanceSelect(),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [Icon(Icons.send), Text(" Envoyer")],
        ),
        onPressed: () {
          setState(() {
            userNameController.text.isEmpty
                ? userNameValidate = true
                : userNameValidate = false;
            numberPhoneController.text.isEmpty
                ? numberPhoneValidate = true
                : numberPhoneValidate = false;
          });

          if (provider.referanceDePc != 'Choisir' &&
              provider.serieDePc != null &&
              provider.composantDePc != null &&
              userNameValidate == false &&
              numberPhoneValidate == false) {
            //uploadImage(context, provider.userName, provider.photoDePc);

            showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                      title: new Text("Dernier étap"),
                      content: new Text(
                        "Vous demander ${provider.composantDePc} (${provider.descriptionDeComposant}) de la marque ${provider.marqueDePc} referance ${provider.referanceDePc} ${provider.serieDePc} ",
                      ),
                      actions: <Widget>[
                        OutlineButton(
                          child: Text('Envoyer et nouveau demande'),
                          onPressed: () {
                            MyFireStore().setdataOnFireStore(
                                provider.photoDePc == null ? false : true,
                                provider.userName,
                                "+212${provider.numberPhone}",
                                provider.marqueDePc,
                                provider.referanceDePc,
                                provider.serieDePc,
                                provider.composantDePc,
                                provider.descriptionDeComposant,
                                formattedDate,
                                "date de livraison",
                                "prix",
                                "nouveau",
                                "photoUrl",
                                "autre1",
                                "autre2",
                                "autre3",
                                provider.photoDePc);
                            provider.composantDePc = null;
                            provider.referanceDePc = "Choisir";
                            provider.serieDePc = "";
                            provider.photoDePc = null;

                            Fluttertoast.showToast(
                              msg:
                                  "Votre demande est bien envoyer. veillez attendez notre reponce ",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MarquePage()),
                            );
                          },
                        ),
                        OutlineButton(
                          child: Text('Envoyer'),
                          onPressed: () {
                            MyFireStore().setdataOnFireStore(
                                provider.photoDePc == null ? false : true,
                                provider.userName,
                                "+212${provider.numberPhone}",
                                provider.marqueDePc,
                                provider.referanceDePc,
                                provider.serieDePc,
                                provider.composantDePc,
                                provider.descriptionDeComposant,
                                formattedDate,
                                "date de livraison",
                                "prix",
                                "nouveau",
                                "photoUrl",
                                "autre1",
                                "autre2",
                                "autre3",
                                provider.photoDePc);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeHome()),
                            );
                            Fluttertoast.showToast(
                              msg:
                                  "Votre demande est bien envoyer. veillez attendez notre reponce ",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                            );
                          },
                        ),
                      ],
                    ));
          } else {
            Fluttertoast.showToast(
              msg: "Veillez remplire tous les champs ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
            );
          }

          if (provider.composantDePc == null)
            Fluttertoast.showToast(
              msg: "Veillez séléctionee un composant ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
            );
        },
      ),
    );
  }

  void myToast(String mytext) {
    Fluttertoast.showToast(
      msg: mytext,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          Text(
            provider.marqueDePc,
            style: TextStyle(fontSize: 20),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage("images/${provider.imagePath}"),
            ),
          )
        ],
      ),
    );
  }
}

class ReferanceSelect extends StatefulWidget {
  ReferanceSelect({Key key}) : super(key: key);

  @override
  _ReferanceListState createState() => _ReferanceListState();
}

class _ReferanceListState extends State<ReferanceSelect> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1 Saisie La referance. '),
              DropdownButton<String>(
                items: provider.referanceList.map((String value) {
                  return new DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                hint: Text(provider.referanceDePc),
                onChanged: (value1) {
                  provider.selectReferance(value1);
                },
              ),
            ],
          ),
          TextField(
            onChanged: (value) => provider.selectSerieDePc(value),
            decoration: InputDecoration(
                labelText: provider.serieDePc == null
                    ? '2 Serial number. '
                    : provider.serieDePc,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("3 Prendre une photo de pc"),
              Row(
                children: [
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
          Divider(),
          Visibility(
            visible: provider.isVisiblePhoto,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.width / 1.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              // width: MediaQuery.of(context).size.width / 1.6,
              child: provider.photoDePc == null
                  ? null
                  : Image.file(
                      provider.photoDePc,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("4 Séléctioné un(e) composant(e)"),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ComposantsPage()),
                ),
                child: Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: provider.imagePathComposant == null
                        ? AssetImage("images/matherboard.jpg")
                        : AssetImage("images/${provider.imagePathComposant}"),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          provider.composantDePc == null
              ? Text(
                  "Selectionné un composant",
                  style: TextStyle(color: provider.selectUncomposant),
                )
              : Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.blue,
                  ),
                  child: AutoSizeText(
                      // "edfdf",
                      "Vous demander ${provider.composantDePc} (${provider.descriptionDeComposant}) de la marque ${provider.marqueDePc} referance ${provider.referanceDePc} ${provider.serieDePc} ",
                      maxLines: 2,
                      style: TextStyle(color: Colors.white)),
                ),
          Divider(),
          SizedBox(height: 15),
          TextField(
            controller: userNameController,
            onChanged: (value) {
              provider.funUserName(value);
              userNameValidate = false;
            },
            decoration: InputDecoration(
                errorText: userNameValidate ? "Entree votre prenom SVP" : null,
                prefixIcon: Icon(Icons.account_circle),
                labelText: 'Votre nom SVP.',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 15),
          TextField(
            controller: numberPhoneController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              provider.funNumberPhoneFormat(value);
              numberPhoneValidate = false;
            },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.sms),
                helperText: "Entree votre whatapp numero pour vous contacté",
                labelText: 'Numero WhatsApp',
                errorText:
                    numberPhoneValidate ? "Entree votre Whatsapp SVP" : null,
                prefix: Text("+212"),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
