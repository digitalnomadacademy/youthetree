import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class TreeService {
  var _storage = FirebaseStorage.instance;
  var _firestore = Firestore.instance;



  Future<void> createTreeWithImage(File image) async {
    try {
      Uri url = await _uploadImage(image);
      // create the document in firestore for that tree with url of the image

      await _firestore.collection("trees").add(
        {"photoUrl": url.toString()},
      );
      print("tree created in firestore");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> updateTreeImage(File image, String treeId) async {
    try {
      Uri url = await _uploadImage(image);
      // create the document in firestore for that tree with url of the image

      await _firestore.collection("trees").document(treeId).updateData(
        {"photoUrl": url.toString()},
      );
      print("tree created in firestore");
    } catch (e) {
      print(e);
      throw e;
    }
  }

//  PRIVATE METHODS

  Future<Uri> _uploadImage(File image) async {
    print("creating new tree with image");
    // upload the image
    var photosReference = _storage.ref().child("/tree_images");
    StorageTaskSnapshot complete =
        await photosReference.putFile(image).onComplete;
    print("image upload is complete");
    var url = complete.uploadSessionUri;
    print("url is $url");
    return url;
  }
}
