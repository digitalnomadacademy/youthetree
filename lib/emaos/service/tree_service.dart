import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class TreeService {
  var _storage = FirebaseStorage.instance;
  var _firestore = Firestore.instance;

  Future<void> createTreeWithImage(File image) async {
    try {
      String url = await _uploadImage(image);
      // create the document in firestore for that tree with url of the image

      await _firestore.collection("trees").add(
        {"photoUrl": url},
      );
      print("tree created in firestore");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> updateTreeImage(File image, String treeId) async {
    try {
      String url = await _uploadImage(image);
      // create the document in firestore for that tree with url of the image

      await _firestore.collection("trees").document(treeId).updateData(
        {"photoUrl": url},
      );
      print("tree created in firestore");
    } catch (e) {
      print(e);
      throw e;
    }
  }

//  PRIVATE METHODS

  Future<String> _uploadImage(File image) async {
    print("creating new tree with image");
    // upload the image
    var photosReference = _storage
        .ref()
        .child("/treeImages/${DateTime.now().millisecondsSinceEpoch}.jpeg");
    StorageTaskSnapshot complete =
        await photosReference.putFile(image).onComplete;
    print("image upload is complete");
    String url = complete.storageMetadata.path;
    print("url is $url");
    return url;
  }
}

class TreeEntity {
  final String photoUrl;

  TreeEntity({this.photoUrl});

  Map<String, dynamic> toMap() {
    return {
      'photoUrl': this.photoUrl,
    };
  }

  factory TreeEntity.fromMap(Map<String, dynamic> map) {
    return TreeEntity(
      photoUrl: map['photoUrl'] as String,
    );
  }
}
