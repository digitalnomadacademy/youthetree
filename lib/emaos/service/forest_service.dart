import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youthetree/emaos/service/auth_service.dart';

class ForestService {
  final AuthService _authService;
  final Firestore _firestore = Firestore.instance;

  ForestService(this._authService);

  Future<List<ForestTreeEntity>> getForest() async {
    var uid = _authService.uid;
    var forestSnapshot = await _firestore
        .collection("users")
        .document(uid)
        .collection("forest")
        .getDocuments();
    var list = forestSnapshot.documents
        .map(
          (DocumentSnapshot forestDocumentSnapshot) =>
              ForestTreeEntity(treeId: forestDocumentSnapshot.documentID),
        )
        .toList();
    return list;
  }
}

class ForestTreeEntity {
  final String treeId;

  const ForestTreeEntity({
    this.treeId,
  });
}
