part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final Transactions transaction;

  SuccessPage(this.ticket, this.transaction);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
          future: ticket != null ? processingTicketOrder(context) : processingTopUp(context),
          builder: (_, snapshot) => (snapshot.connectionState == ConnectionState.done) ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 43,
              ),
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(bottom: 70),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      ticket != null ? "assets/ill_top_up.png" : "assets/ill_tickets.png",
                    ),
                  ),
                ),
              ),
              Text(
                (ticket == null) ? "Emmm Yummy!" : "Happy Watching",
                style: blackTextFont.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                (ticket == null) ? "You have successfully\ntop up the wallet" : "You have successfully\nbought the ticket",
                textAlign: TextAlign.center,
                style: greyTextFont.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  height: 1.4,
                ),
              ),
              Container(
                height: 45,
                width: 250,
                margin: EdgeInsets.only(
                  top: 70,
                  bottom: 20,
                ),
                child: RaisedButton(
                  elevation: 0,
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    (ticket == null) ? "My Wallet" : "My Tickets",
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                  onPressed: () {
                    if (ticket == null) {
                      context.bloc<PageBloc>().add(GoToWalletPage(GoToMainPage()));
                    } else {
                      context.bloc<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 1, isExpired: ticket.time.isBefore(DateTime.now())));
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Discover new movie? ",
                    style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    child: Text(
                      "Back to Home",
                      style: purpleTextFont,
                    ),
                    onTap: () {
                      context.bloc<PageBloc>().add(GoToMainPage());
                    },
                  ),
                ],
              ),
              Spacer(
                flex: 35,
              ),
            ],
          ) : Center(
            child: SpinKitFadingCircle(
              color: mainColor,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(ticket.totalPrice));
    context.bloc<TicketBloc>().add(BuyTicket(transaction.userID, ticket));

    await TransactionsServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp(BuildContext context) async {
    context.bloc<UserBloc>().add(TopUp(transaction.amount));

    await TransactionsServices.saveTransaction(transaction);
  }
}
