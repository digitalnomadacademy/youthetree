import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';
import 'package:youthetree/logger/logger.dart';

class TreeService {
  var _storage = FirebaseStorage.instance;
  var _firestore = Firestore.instance;
  var _geo = Geoflutterfire();

  Future<List<TreeEntity>> getTrees() async {
    var documents = await _firestore.collection("trees").getDocuments();
    List<TreeEntity> trees = documents.documents
        .map((snapshot) =>
            TreeEntity.fromMap(snapshot.data, snapshot.documentID))
        .toList();
    l.info(trees.first);
    return trees;
  }

  Future<void> createTreeWithImage(
      File image, String uid, LocationData location) async {
    try {
      l.info("uploading image");
      String url = await _uploadImage(image);
      l.info("image uploaded. url is $url");
      // create the document in firestore for that tree with url of the image

      var point = _geo.point(
              latitude: location.latitude, longitude: location.longitude);
      var documentReference = await _firestore.collection("trees").add(
        {
          "explorerUid": uid,
          "location": point.data,
          "photos": [
            {"authorUid": uid, "photoUrl": url}
          ]
        },
      );
      l.info("tree created in firestore for id ${documentReference.documentID}");
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
  final String treeId;
  final GeoPoint location;
  final double altitude;
  final String name;
  final String explorerUid;
  final List<TreePhotoEntity> photos;
  const TreeEntity(
      {this.location,
      this.altitude,
      this.name,
      this.photos,
      this.explorerUid,
      this.treeId});

  Map<String, dynamic> toMap() {
    return {
      'location': this.location,
      'altitude': this.altitude,
      'name': this.name,
      'explorerUid': this.explorerUid,
      'photos': this.photos,
    };


  }

  @override
  String toString() {
    return 'TreeEntity{treeId: $treeId, location: $location, explorerUid: $explorerUid, photos: $photos}';
  }

  factory TreeEntity.fromMap(Map<String, dynamic> map, String treeId) {
    var treeEntity = TreeEntity(
      location: map['location']["geopoint"],
      altitude: map['altitude'] as double,
      treeId: treeId,
      name: map['name'] as String,
      explorerUid: map['explorerUid'] as String,
      photos: map['photos']
          .map<TreePhotoEntity>((photoMap) => TreePhotoEntity.fromMap(photoMap))
          .toList(),
    );
    return treeEntity;
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


  factory TreePhotoEntity.fromMap(Map<String, dynamic> map) {
    return TreePhotoEntity(
      photoUrl: map['photoUrl'] as String,
      authorUid: map['authorUid'] as String,
    );
  }

  @override
  String toString() {
    return 'TreePhotoEntity{photoUrl: $photoUrl, authorUid: $authorUid}';
  }
}
