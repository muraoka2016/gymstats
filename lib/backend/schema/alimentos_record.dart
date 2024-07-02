import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlimentosRecord extends FirestoreRecord {
  AlimentosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Cafe" field.
  String? _cafe;
  String get cafe => _cafe ?? '';
  bool hasCafe() => _cafe != null;

  // "Almoco" field.
  String? _almoco;
  String get almoco => _almoco ?? '';
  bool hasAlmoco() => _almoco != null;

  // "Jantar" field.
  String? _jantar;
  String get jantar => _jantar ?? '';
  bool hasJantar() => _jantar != null;

  void _initializeFields() {
    _cafe = snapshotData['Cafe'] as String?;
    _almoco = snapshotData['Almoco'] as String?;
    _jantar = snapshotData['Jantar'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Alimentos');

  static Stream<AlimentosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlimentosRecord.fromSnapshot(s));

  static Future<AlimentosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlimentosRecord.fromSnapshot(s));

  static AlimentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlimentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlimentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlimentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlimentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlimentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlimentosRecordData({
  String? cafe,
  String? almoco,
  String? jantar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Cafe': cafe,
      'Almoco': almoco,
      'Jantar': jantar,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlimentosRecordDocumentEquality implements Equality<AlimentosRecord> {
  const AlimentosRecordDocumentEquality();

  @override
  bool equals(AlimentosRecord? e1, AlimentosRecord? e2) {
    return e1?.cafe == e2?.cafe &&
        e1?.almoco == e2?.almoco &&
        e1?.jantar == e2?.jantar;
  }

  @override
  int hash(AlimentosRecord? e) =>
      const ListEquality().hash([e?.cafe, e?.almoco, e?.jantar]);

  @override
  bool isValidKey(Object? o) => o is AlimentosRecord;
}
