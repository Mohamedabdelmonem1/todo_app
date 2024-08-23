import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_route/model/task_model.dart';

class FirestoreUtils {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection("TasksCollection")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromFirestore(snapshot.data()!),
          toFirestore: (value, _) => value.toFirestore(),
        );
  }

  static Future<void> addDataToFirestore(TaskModel taskModel) {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc();

    taskModel.id = docRef.id;

    return docRef.set(taskModel);
  }

  static Future<void> deleteDataFromFirestore(TaskModel model) {
    var collectionRef = getCollection();
    return collectionRef.doc(model.id).delete();
  }

  static Future<List<TaskModel>> getDataFromFirestore() async {
    var snapshot = await getCollection().get();
    return snapshot.docs.map((element) => element.data()).toList();
  }

  static Stream<QuerySnapshot<TaskModel>> getRealTimeDataFromFirestore(
      DateTime dateTime) {
    var snapshot = getCollection()
        .where("dateTime",
            isEqualTo: DateTime(
              dateTime.year,
              dateTime.month,
              dateTime.day,
            ).millisecondsSinceEpoch)
        .snapshots();
    return snapshot;
  }
}
