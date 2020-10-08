import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

String myTest;
String formattedDate = DateFormat('d-MM-yy').format(DateTime.now());

class MyFireStore {
  setdataOnFireStore(
    bool isPhotoDePcExiste,
    String userName,
    String numberPhone,
    String marqueDePc,
    String referanceDePc,
    String serieDePc,
    String composantDePc,
    String descriptionDeComposant,
    String dateRequette,
    String dateLivraison,
    String prix,
    String statut,
    String photoUrl,
    String autre1,
    String autre2,
    String autre3,
    File photoDePc,

    //12
  ) {
    uploadImage(userName + numberPhone, photoDePc).whenComplete(() {
      DocumentReference ds = Firestore.instance
          .collection("demandes")
          .document(userName + marqueDePc + serieDePc);

      Map<String, dynamic> task = {
        "userName": userName,
        "numberPhone": numberPhone,
        "marqueDePc": marqueDePc,
        "referanceDePc": referanceDePc,
        "serieDePc": serieDePc,
        "composantDePc": composantDePc,
        "descriptionDeComposant": descriptionDeComposant,
        "dateRequette": dateRequette,
        "dateLivraison": dateLivraison,
        "prix": prix,
        "statut": statut,
        "photoDePc": isPhotoDePcExiste ? myTest : null,
        "autre1": autre1,
        "autre2": autre2,
        "autre3": autre3,
      };

      ds.setData(task).whenComplete(() {
        print("firestore is ok");
      });
    });
  }
}

Future uploadImage(String photoName, File photoDepc) async {
  try {
    FirebaseStorage firebaseStorage =
        FirebaseStorage(storageBucket: "gs://flutter-ae3ac.appspot.com");
    StorageReference storageReference =
        firebaseStorage.ref().child("$formattedDate/$photoName.jpg");
    StorageUploadTask storageUploadTask = storageReference.putFile(photoDepc);
    StorageTaskSnapshot storageTaskSnapshot =
        await storageUploadTask.onComplete;

    String urldePhoto = await storageTaskSnapshot.ref.getDownloadURL();
    myTest = urldePhoto;
    print("Photo de pc :" + myTest);
  } catch (ex) {
    print(ex.message);
  }
}
