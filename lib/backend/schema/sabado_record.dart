import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SabadoRecord extends FirestoreRecord {
  SabadoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Exercicio" field.
  List<String>? _exercicio;
  List<String> get exercicio => _exercicio ?? const [];
  bool hasExercicio() => _exercicio != null;

  // "Repeticoes" field.
  int? _repeticoes;
  int get repeticoes => _repeticoes ?? 0;
  bool hasRepeticoes() => _repeticoes != null;

  void _initializeFields() {
    _exercicio = getDataList(snapshotData['Exercicio']);
    _repeticoes = castToType<int>(snapshotData['Repeticoes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Sabado');

  static Stream<SabadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SabadoRecord.fromSnapshot(s));

  static Future<SabadoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SabadoRecord.fromSnapshot(s));

  static SabadoRecord fromSnapshot(DocumentSnapshot snapshot) => SabadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SabadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SabadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SabadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SabadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSabadoRecordData({
  int? repeticoes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Repeticoes': repeticoes,
    }.withoutNulls,
  );

  return firestoreData;
}

class SabadoRecordDocumentEquality implements Equality<SabadoRecord> {
  const SabadoRecordDocumentEquality();

  @override
  bool equals(SabadoRecord? e1, SabadoRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.exercicio, e2?.exercicio) &&
        e1?.repeticoes == e2?.repeticoes;
  }

  @override
  int hash(SabadoRecord? e) =>
      const ListEquality().hash([e?.exercicio, e?.repeticoes]);

  @override
  bool isValidKey(Object? o) => o is SabadoRecord;
}
