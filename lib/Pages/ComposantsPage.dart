import 'package:flutter/material.dart';
import 'package:pc_expert/Pages/DetailsPage.dart';

import 'package:pc_expert/model/StepModel.dart';
import 'package:provider/provider.dart';

class ComposantsPage extends StatelessWidget {
  const ComposantsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Scaffold(
      //backgroundColor: Color(0xff242A36),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ComposantsPage2(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Text(
              "vous avez selectioné ",
            ),
            provider.imagePathComposant == null
                ? Text("")
                : Container(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("images/${provider.imagePathComposant}"),
                    ),
                  )
          ],
        ),
        isExtended: true,
        elevation: 20,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DatailsPage()),
          );
        },
      ),
    );
  }
}

class ComposantsPage2 extends StatelessWidget {
  const ComposantsPage2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            alignment: Alignment.center,
            height: 80,
            child: provider.composantDePc == null
                ? Text("Séléctioné votre composant")
                : Text(
                    provider.composantDePc,
                    style: TextStyle(fontSize: 25),
                  )),
        MarqueDePc(),
        SizedBox(height: 15),
        MyTextField(),
      ],
    );
  }
}

class MarqueDePc extends StatelessWidget {
  const MarqueDePc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectComposantDemander("back"),
                  child: Opacity(
                    opacity: provider.visibleC1,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/back.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectComposantDemander("circuit"),
                  child: Opacity(
                    opacity: provider.visibleC2,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/circuit.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectComposantDemander("clavier"),
                  child: Opacity(
                    opacity: provider.visibleC3,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/clavier.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectComposantDemander("ecran"),
                  child: Opacity(
                    opacity: provider.visibleC4,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/display.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectComposantDemander("matherboard"),
                  child: Opacity(
                    opacity: provider.visibleC5,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/matherboard.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectComposantDemander("trackpad"),
                  child: Opacity(
                    opacity: provider.visibleC6,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/trackpad.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Container(
      child: TextField(
        onChanged: (value) => provider.funDescriptin(value),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.note_add,
              color: Colors.black,
            ),
            labelText: 'Remarque',
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }
}
