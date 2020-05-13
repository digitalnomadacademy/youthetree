import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';

class TreeService {
  var _storage = FirebaseStorage.instance;
  var _firestore = Firestore.instance;
  var _geo = Geoflutterfire();

  Future<List<TreeEntity>> getTrees() async {
    var documents = await _firestore.collection("trees").getDocuments();
    List<TreeEntity> trees = documents.documents
        .map((snapshot) => TreeEntity.fromMap(snapshot.data))
        .toList();
    return trees;
  }

  Future<void> createTreeWithImage(
      File image, String uid, LocationData location) async {
    try {
      String url = await _uploadImage(image);
      // create the document in firestore for that tree with url of the image

      await _firestore.collection("trees").add(
        {
          "explorerUid": uid,
          "location": _geo.point(
              latitude: location.latitude, longitude: location.longitude),
          "photos": [
            {"authorUid": uid, "photoUrl": url}
          ]
        },
      );
      print("tree created in firestore");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> updateTreeImage(File image, String treeId, String uid) async {
    try {
      String url = await _uploadImage(image);
      // create the document in firestore for that tree with url of the image

      await _firestore.runTransaction((Transaction transaction) async {
        var document = _firestore.collection("trees").document(treeId);
        DocumentSnapshot treeSnapshot = await transaction.get(document);
        var treeData = treeSnapshot.data;
        treeData["photos"].add({"authorUid": uid, "photoUrl": url});
        await transaction.update(document, treeData);
      });
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
  final GeoPoint location;
  final double altitude;
  final String name;
  final String explorerUid;
  final List<TreePhotoEntity> photos;
  const TreeEntity(
      {this.location, this.altitude, this.name, this.photos, this.explorerUid});

  Map<String, dynamic> toMap() {
    return {
      'location': this.location,
      'altitude': this.altitude,
      'name': this.name,
      'explorerUid': this.explorerUid,
      'photos': this.photos,
    };
  }

  factory TreeEntity.fromMap(Map<String, dynamic> map) {
    return TreeEntity(
      location: map['location']["geopoint"],
      altitude: map['altitude'] as double,
      name: map['name'] as String,
      explorerUid: map['explorerUid'] as String,
      photos: map['photos']
          .map((photoMap) => TreePhotoEntity.fromMap(map))
          .toList(),
    );
  }
}

class TreeMessageEntity {
  final String message;
  final String authorUid;

  const TreeMessageEntity({
    this.message,
    this.authorUid,
  });
}

class TreePhotoEntity {
  final String photoUrl;
  final String authorUid;

  const TreePhotoEntity({
    this.photoUrl,
    this.authorUid,
  });

  Map<String, dynamic> toMap() {
    return {
      'photoUrl': this.photoUrl,
      'authorUid': this.authorUid,
    };
  }

  factory TreePhotoEntity.fromMap(Map<String, dynamic> map) {
    return TreePhotoEntity(
      photoUrl: map['photoUrl'] as String,
      authorUid: map['authorUid'] as String,
    );
  }
}
