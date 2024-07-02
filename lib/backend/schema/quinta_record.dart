import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuintaRecord extends FirestoreRecord {
  QuintaRecord._(
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
      FirebaseFirestore.instance.collection('Quinta');

  static Stream<QuintaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuintaRecord.fromSnapshot(s));

  static Future<QuintaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuintaRecord.fromSnapshot(s));

  static QuintaRecord fromSnapshot(DocumentSnapshot snapshot) => QuintaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuintaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuintaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuintaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuintaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuintaRecordData({
  int? repeticoes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Repeticoes': repeticoes,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuintaRecordDocumentEquality implements Equality<QuintaRecord> {
  const QuintaRecordDocumentEquality();

  @override
  bool equals(QuintaRecord? e1, QuintaRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.exercicio, e2?.exercicio) &&
        e1?.repeticoes == e2?.repeticoes;
  }

  @override
  int hash(QuintaRecord? e) =>
      const ListEquality().hash([e?.exercicio, e?.repeticoes]);

  @override
  bool isValidKey(Object? o) => o is QuintaRecord;
}
