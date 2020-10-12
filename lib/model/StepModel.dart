import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pc_expert/model/Constant.dart';

class StepModel extends ChangeNotifier {
  int idDossier;
  String marqueDePc;
  String referanceDePc;
  String totalReferanceDePc = '';
  String serieDePc;
  String composantDePc;
  String descriptionDeComposant = "";
  String userName;
  String numberPhone;
  String dateRequette;
  bool isVisibleMarque = false;
  bool isVisiblePhoto = false;
  Color selectUncomposant;
  bool modeSms = false;
  String imagePath;
  String imageString;
  String imagePathComposant;

  List<String> referanceList = [];

  File photoDePc;

  double visible1 = 1.0;
  double visible2 = 1.0;
  double visible3 = 1.0;
  double visible4 = 1.0;
  double visible5 = 1.0;
  double visible6 = 1.0;
  double visible7 = 1.0;
  double visible8 = 1.0;
  double visible9 = 1.0;
  double visible10 = 1.0;
  double visible11 = 1.0;
  double visible12 = 1.0;

  double visibleC1 = 1.0;
  double visibleC2 = 1.0;
  double visibleC3 = 1.0;
  double visibleC4 = 1.0;
  double visibleC5 = 1.0;
  double visibleC6 = 1.0;
  double visibleC7 = 1.0;
  double visibleC8 = 1.0;
  double visibleC9 = 1.0;
  double visibleC10 = 1.0;
  double visibleC11 = 1.0;
  double visibleC12 = 1.0;

  selectReferance(String referance) {
    referanceDePc = referance;

    notifyListeners();
  }

  selectSerieDePc(String referance) {
    serieDePc = referance;
    notifyListeners();
  }

  funSelectUncomposant() {
    selectUncomposant = Colors.red;
    notifyListeners();
  }

  funModeSms(bool referance) {
    modeSms = true;
    notifyListeners();
  }

  selectComposant(String referance) {
    composantDePc = referance;
    notifyListeners();
  }

  selectMarque(String marque) {
    switch (marque) {
      case "acer":
        {
          marqueDePc = "Acer";
          imagePath = "acer.png";
          referanceList = acer;
          allInVisible();
          visible5 = 1;
        }
        break;
      case "apple":
        {
          marqueDePc = "Apple";
          imagePath = "apple.jpg";
          referanceList = apple;
          allInVisible();
          visible1 = 1;
        }
        break;
      case "autre":
        {
          isVisibleMarque = true;
          allInVisible();
          visible12 = 1;
        }
        break;
      case "dell":
        {
          marqueDePc = "Dell";
          imagePath = "dell.png";
          referanceList = dell;
          allInVisible();
          visible3 = 1;
        }
        break;
      case "asus":
        {
          marqueDePc = "asus";
          imagePath = "asus.png";
          referanceList = asus;
          allInVisible();
          visible10 = 1;
        }
        break;
      case "hp":
        {
          marqueDePc = "Hp";
          imagePath = "hp.png";
          referanceList = hp;
          allInVisible();
          visible2 = 1;
        }
        break;
      case "lenovo":
        {
          marqueDePc = "Lenovo";
          imagePath = "lenovo.png";
          referanceList = lenovo;
          allInVisible();
          visible4 = 1;
        }
        break;
      case "msi":
        {
          marqueDePc = "Msi";
          imagePath = "msi.jpg";
          referanceList = msi;
          allInVisible();
          visible7 = 1;
        }
        break;
      case "samsung":
        {
          marqueDePc = "Samsung";
          imagePath = "samsung.png";
          referanceList = samsung;
          allInVisible();
          visible8 = 1;
        }
        break;
      case "sony":
        {
          marqueDePc = "Sony";
          imagePath = "sony.png";
          referanceList = sony;
          allInVisible();
          visible9 = 1;
        }
        break;
      case "surface":
        {
          marqueDePc = "Surface";
          imagePath = "surface.jpg";
          referanceList = surface;
          allInVisible();
          visible11 = 1;
        }
        break;
      case "toshiba":
        {
          marqueDePc = "Toshiba";
          imagePath = "toshiba.png";
          referanceList = toshiba;
          allInVisible();
          visible6 = 1;
        }
        break;

        break;
      default:
        {
          marqueDePc = marque;
          referanceList = autreMarque;
          imagePath = "autre.png";
        }
    }
    notifyListeners();
  }

  Future pickImage(bool camera) async {
    if (camera) {
      File image = await ImagePicker.pickImage(source: ImageSource.camera);
      photoDePc = image;
      isVisiblePhoto = true;
    } else {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);
      photoDePc = image;
      isVisiblePhoto = true;
    }
    notifyListeners();
  }

  notifyListeners();

  allInVisible() {
    visible1 = 0.3;
    visible2 = 0.3;
    visible3 = 0.3;
    visible4 = 0.3;
    visible5 = 0.3;
    visible6 = 0.3;
    visible7 = 0.3;
    visible8 = 0.3;
    visible9 = 0.3;
    visible10 = 0.3;
    visible11 = 0.3;
    visible12 = 0.3;
    notifyListeners();
  }

  allInVisibleComposant() {
    visibleC1 = 0.3;
    visibleC2 = 0.3;
    visibleC3 = 0.3;
    visibleC4 = 0.3;
    visibleC5 = 0.3;
    visibleC6 = 0.3;
    visibleC7 = 0.3;
    visibleC8 = 0.3;
    visibleC9 = 0.3;
    visibleC10 = 0.3;
    visibleC11 = 0.3;
    visibleC12 = 0.3;
    notifyListeners();
  }

  funNumberPhoneFormat(String value) {
    if (value.startsWith("0")) {
      numberPhone = value.replaceFirst(RegExp('0'), "");
    } else
      numberPhone = value;
    notifyListeners();
  }

  selectComposantDemander(String marque) {
    switch (marque) {
      case "Back":
        {
          composantDePc = "Back";
          imagePathComposant = "back.jpg";

          allInVisibleComposant();
          visibleC1 = 1;
        }
        break;
      case "Cpu":
        {
          composantDePc = "Cpu";
          imagePathComposant = "cpu.png";

          allInVisibleComposant();
          visibleC2 = 1;
        }
        break;

      case "Clavier":
        {
          composantDePc = "Clavier";
          imagePathComposant = "clavier.jpg";

          allInVisibleComposant();
          visibleC3 = 1;
        }
        break;
      case "Ecran":
        {
          composantDePc = "Ecran";
          imagePathComposant = "display.jpg";

          allInVisibleComposant();
          visibleC4 = 1;
        }
        break;
      case "Carte mère":
        {
          composantDePc = "Carte mère";
          imagePathComposant = "matherboard.jpg";

          allInVisibleComposant();
          visibleC5 = 1;
        }
        break;
      case "Trackpad":
        {
          composantDePc = "TrackPad";
          imagePathComposant = "trackpad.jpg";
          allInVisibleComposant();
          visibleC6 = 1;
        }
        break;
      case "Tapi":
        {
          composantDePc = "Tapi";
          imagePathComposant = "tapi.png";

          allInVisibleComposant();
          visibleC7 = 1;
        }
        break;
      case "Son":
        {
          composantDePc = "Son";
          imagePathComposant = "card-sound.png";

          allInVisibleComposant();
          visibleC8 = 1;
        }
        break;
      case "Resaux":
        {
          composantDePc = "Resaux";
          imagePathComposant = "card-network.png";

          allInVisibleComposant();
          visibleC9 = 1;
        }
        break;
      case "Gpu":
        {
          composantDePc = "Gpu";
          imagePathComposant = "gpu.png";

          allInVisibleComposant();
          visibleC11 = 1;
        }
        break;
      case "Cadre d'écrant":
        {
          composantDePc = "Cadre d'écrant";
          imagePathComposant = "cadre-pc.png";

          allInVisibleComposant();
          visibleC6 = 1;
        }
        break;
      case "Autre":
        {
          composantDePc = "Autre";
          imagePathComposant = "circuit.jpg";
        }
        break;

        break;
      default:
        {
          composantDePc = marque;
        }
    }
    notifyListeners();
  }

  funUserName(String name) {
    userName = name;
    notifyListeners();
  }

  funNumberPhone(String number) {
    numberPhone = number;
    notifyListeners();
  }

  funDescriptin(String description) {
    descriptionDeComposant = description;
    notifyListeners();
  }

  setdataOnFireStore(String name, int age, String time) {
    DocumentReference ds = Firestore.instance.collection("todo").document(time);

    Map<String, dynamic> task = {"name": name, "age": age};
    ds.setData(task).whenComplete(() {
      print(time);
    });
  }
}
