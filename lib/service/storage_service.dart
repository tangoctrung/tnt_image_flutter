
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  Future<String> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);
    String newUrl = "";
    try {
      // await storage.ref('avatars/$fileName').putFile(file);
      var uploadTask = await storage.ref('avatars').putFile(file).whenComplete(() => {});
      newUrl = await uploadTask.ref.getDownloadURL();
      // final snapshot = await uploadTask.getDownloadURL(() {}); 
            // uploadTask.('state_changed', 
            //     (snapshot) => {}, 
            //     (error) => { }, 
            //     () => {
            //         // complete function ....
            //         storage.ref('avatars').child(fileName).getDownloadURL().then((url) {
            //             print(url);
            //             newUrl = url;
            //         })
            //     });
      
    } on firebase_core.FirebaseException catch (e) {
      print(e.message);
    }

    return newUrl;
  }
}