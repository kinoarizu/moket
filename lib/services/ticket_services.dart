part of 'services.dart';

class TicketServices {
  /// -------------------------------------------------------
  /// [Ticket Services Class]
  /// This class is used to handling ticketing data firestore
  /// -------------------------------------------------------

  //* Instancing firestore ticket collection
  static CollectionReference ticketCollection = Firestore.instance.collection('tickets');

  //* Method to saving ticket data to firestore
  static Future<void> saveTicket(String id, Ticket ticket) async {
    await ticketCollection.document().setData({
      'movieID': ticket.movieDetail.id,
      'userID': id ?? "",
      'theaterName': ticket.theater.name,
      'time': ticket.time.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice,
    });
  }

  //* Method to getting ticket data from firestore
  static Future<List<Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.getDocuments();

    var documents = snapshot.documents.where((document) => document.data['userID'] == userId);

    List<Ticket> tickets = [];

    for (var document in documents) {
      MovieDetail movieDetail = await MovieServices.getDetails(null, movieID: document.data['movieID']);
      tickets.add(
        Ticket(
          movieDetail,
          Theater(document.data['theaterName']),
          DateTime.fromMillisecondsSinceEpoch(document.data['time']),
          document.data['bookingCode'],
          document.data['seats'].toString().split(','),
          document.data['name'],
          document.data['totalPrice'],
        ),
      );
    }

    return tickets;
  }
}