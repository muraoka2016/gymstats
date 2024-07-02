import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SegundaRecord extends FirestoreRecord {
  SegundaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Repeticoes" field.
  int? _repeticoes;
  int get repeticoes => _repeticoes ?? 0;
  bool hasRepeticoes() => _repeticoes != null;

  // "Exercicio" field.
  String? _exercicio;
  String get exercicio => _exercicio ?? '';
  bool hasExercicio() => _exercicio != null;

  void _initializeFields() {
    _repeticoes = castToType<int>(snapshotData['Repeticoes']);
    _exercicio = snapshotData['Exercicio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Segunda');

  static Stream<SegundaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SegundaRecord.fromSnapshot(s));

  static Future<SegundaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SegundaRecord.fromSnapshot(s));

  static SegundaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SegundaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SegundaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SegundaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SegundaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SegundaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSegundaRecordData({
  int? repeticoes,
  String? exercicio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Repeticoes': repeticoes,
      'Exercicio': exercicio,
    }.withoutNulls,
  );

  return firestoreData;
}

class SegundaRecordDocumentEquality implements Equality<SegundaRecord> {
  const SegundaRecordDocumentEquality();

  @override
  bool equals(SegundaRecord? e1, SegundaRecord? e2) {
    return e1?.repeticoes == e2?.repeticoes && e1?.exercicio == e2?.exercicio;
  }

  @override
  int hash(SegundaRecord? e) =>
      const ListEquality().hash([e?.repeticoes, e?.exercicio]);

  @override
  bool isValidKey(Object? o) => o is SegundaRecord;
}
