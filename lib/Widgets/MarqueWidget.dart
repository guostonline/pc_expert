import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pc_expert/Pages/DetailsPage.dart';
import 'package:pc_expert/model/Constant.dart';
import 'package:pc_expert/model/StepModel.dart';
import 'package:provider/provider.dart';

class MarqueGridList extends StatelessWidget {
  const MarqueGridList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            alignment: Alignment.center,
            height: 80,
            child: FadeAnimatedTextKit(
              text: titleMarque,
              textStyle: TextStyle(fontSize: 20, color: Colors.white),
            )),
        MarqueDePc(),
        MyTextField(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: FloatingActionButton.extended(
            label: Text(
              "vous avez selectioné " + provider.marqueDePc,
            ),
            isExtended: true,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DatailsPage()),
              );
            },
          ),
        )
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
                  onTap: () => provider.selectMarque("apple"),
                  child: Opacity(
                    opacity: provider.visible1,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/apple.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectMarque("hp"),
                  child: Opacity(
                    opacity: provider.visible2,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/hp.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectMarque("dell"),
                  child: Opacity(
                    opacity: provider.visible3,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/dell.png",
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
                  onTap: () => provider.selectMarque("lenovo"),
                  child: Opacity(
                    opacity: provider.visible4,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/lenovo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectMarque("acer"),
                  child: Opacity(
                    opacity: provider.visible5,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/acer.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectMarque("toshiba"),
                  child: Opacity(
                    opacity: provider.visible6,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/toshiba.png",
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
                  onTap: () => provider.selectMarque("msi"),
                  child: Opacity(
                    opacity: provider.visible7,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/msi.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectMarque("samsung"),
                  child: Opacity(
                    opacity: provider.visible8,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/samsung.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectMarque("sony"),
                  child: Opacity(
                    opacity: provider.visible9,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/sony.png",
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
                  onTap: () => provider.selectMarque("asus"),
                  child: Opacity(
                    opacity: provider.visible10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/asus.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectMarque("surface"),
                  child: Opacity(
                    opacity: provider.visible11,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/surface.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.selectMarque("autre"),
                  child: Opacity(
                    opacity: provider.visible12,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/autre.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]));
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<StepModel>();
    return Container(
      child: Visibility(
        visible: provider.isVisibleMarque,
        child: TextField(
          onSubmitted: (value) => provider.selectMarque(value),
          style: myStyle,
          decoration: InputDecoration(
            labelText: "Saisie votre marque de pc, puis clique entree",
            labelStyle: myStyle, //hintText: "Saisie votre marque de pc",
            hintStyle: myStyle,
          ),
        ),
      ),
    );
  }
}
