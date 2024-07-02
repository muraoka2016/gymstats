import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuartaRecord extends FirestoreRecord {
  QuartaRecord._(
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
      FirebaseFirestore.instance.collection('Quarta');

  static Stream<QuartaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuartaRecord.fromSnapshot(s));

  static Future<QuartaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuartaRecord.fromSnapshot(s));

  static QuartaRecord fromSnapshot(DocumentSnapshot snapshot) => QuartaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuartaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuartaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuartaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuartaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuartaRecordData({
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

class QuartaRecordDocumentEquality implements Equality<QuartaRecord> {
  const QuartaRecordDocumentEquality();

  @override
  bool equals(QuartaRecord? e1, QuartaRecord? e2) {
    return e1?.repeticoes == e2?.repeticoes && e1?.exercicio == e2?.exercicio;
  }

  @override
  int hash(QuartaRecord? e) =>
      const ListEquality().hash([e?.repeticoes, e?.exercicio]);

  @override
  bool isValidKey(Object? o) => o is QuartaRecord;
}
