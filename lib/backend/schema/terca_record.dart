import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TercaRecord extends FirestoreRecord {
  TercaRecord._(
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
      FirebaseFirestore.instance.collection('Terca');

  static Stream<TercaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TercaRecord.fromSnapshot(s));

  static Future<TercaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TercaRecord.fromSnapshot(s));

  static TercaRecord fromSnapshot(DocumentSnapshot snapshot) => TercaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TercaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TercaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TercaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TercaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTercaRecordData({
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

class TercaRecordDocumentEquality implements Equality<TercaRecord> {
  const TercaRecordDocumentEquality();

  @override
  bool equals(TercaRecord? e1, TercaRecord? e2) {
    return e1?.repeticoes == e2?.repeticoes && e1?.exercicio == e2?.exercicio;
  }

  @override
  int hash(TercaRecord? e) =>
      const ListEquality().hash([e?.repeticoes, e?.exercicio]);

  @override
  bool isValidKey(Object? o) => o is TercaRecord;
}
