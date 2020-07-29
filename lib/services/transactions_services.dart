part of 'services.dart';

class TransactionsServices {
  /// ---------------------------------------------------------
  /// [Transaction Services Class]
  /// This class is used to handling transaction data firestore
  /// ---------------------------------------------------------

  //* Instancing firestore transaction collection
  static CollectionReference transactionCollection = Firestore.instance.collection('transactions');

  //* Method to saving transaction data to firestore
  static Future<void> saveTransaction(Transactions transactions) async {
    await transactionCollection.document().setData({
      'userID': transactions.userID,
      'title': transactions.title,
      'subtitle': transactions.subtitle,
      'time': transactions.time,
      'amount': transactions.amount,
      'picture': transactions.picture,
    });
  }

  //* Method to getting transaction data from firestore
  static Future<List<Transactions>> getTransaction(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.getDocuments();

    var documents = snapshot.documents.where((document) => document.data['userID'] == userID);

    return documents.map((e) => Transactions(
      userID: e.data['userID'],
      title: e.data['title'],
      subtitle: e.data['subtitle'],
      time: e.data['time'].toDate(),
      amount: e.data['amount'],
      picture: e.data['picture'],
    )).toList();
  }
}