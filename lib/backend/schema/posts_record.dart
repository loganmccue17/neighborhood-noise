import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postedByBand" field.
  DocumentReference? _postedByBand;
  DocumentReference? get postedByBand => _postedByBand;
  bool hasPostedByBand() => _postedByBand != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "numberOfLikes" field.
  int? _numberOfLikes;
  int get numberOfLikes => _numberOfLikes ?? 0;
  bool hasNumberOfLikes() => _numberOfLikes != null;

  // "bandPostedName" field.
  String? _bandPostedName;
  String get bandPostedName => _bandPostedName ?? '';
  bool hasBandPostedName() => _bandPostedName != null;

  // "imageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  bool hasImageURL() => _imageURL != null;

  void _initializeFields() {
    _postedByBand = snapshotData['postedByBand'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _numberOfLikes = castToType<int>(snapshotData['numberOfLikes']);
    _bandPostedName = snapshotData['bandPostedName'] as String?;
    _imageURL = snapshotData['imageURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  DocumentReference? postedByBand,
  String? description,
  int? numberOfLikes,
  String? bandPostedName,
  String? imageURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postedByBand': postedByBand,
      'description': description,
      'numberOfLikes': numberOfLikes,
      'bandPostedName': bandPostedName,
      'imageURL': imageURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    return e1?.postedByBand == e2?.postedByBand &&
        e1?.description == e2?.description &&
        e1?.numberOfLikes == e2?.numberOfLikes &&
        e1?.bandPostedName == e2?.bandPostedName &&
        e1?.imageURL == e2?.imageURL;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postedByBand,
        e?.description,
        e?.numberOfLikes,
        e?.bandPostedName,
        e?.imageURL
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
