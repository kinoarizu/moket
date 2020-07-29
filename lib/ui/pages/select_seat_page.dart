part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final Ticket ticket;

  SelectSeatPage(this.ticket);

  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSelectSchedulePage(widget.ticket.movieDetail));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: accentColor1,
            ),
            SafeArea(
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: defaultMargin,
                                top: 36,
                              ),
                              padding: EdgeInsets.all(1),
                              child: GestureDetector(
                                onTap: () {
                                  context.bloc<PageBloc>().add(GoToSelectSchedulePage(widget.ticket.movieDetail));
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, right: defaultMargin),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      widget.ticket.movieDetail.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.end,
                                      style: blackTextFont.copyWith(
                                        fontSize: 20,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          imageBaseURL + 'w154' + widget.ticket.movieDetail.posterPath,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 277,
                          height: 84,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/screen.png"),
                            ),
                          ),
                        ),
                        generateSeats(),
                        Container(
                          margin: EdgeInsets.only(
                            left: 54,
                            right: 54,
                            top: 7,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SelectableBox(
                                    "",
                                    width: 20,
                                    height: 20
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Available",
                                    style: greyTextFont.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SelectableBox(
                                    "",
                                    width: 20,
                                    height: 20,
                                    isEnabled: false,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Booked",
                                    style: greyTextFont.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SelectableBox(
                                    "",
                                    width: 20,
                                    height: 20,
                                    isSelected: true,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Selected",
                                    style: greyTextFont.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: selectedSeats.length > 0 ? mainColor : Color(0xFFE4E4E4),
                            child: Icon(
                              Icons.arrow_forward,
                              color: selectedSeats.length > 0 ? Colors.white : Color(0xFFBEBEBE),
                            ),
                            onPressed: selectedSeats.length > 0 ? () {
                              context.bloc<PageBloc>().add(
                                GoToCheckoutPage(
                                  widget.ticket.copyWith(seats: selectedSeats),
                                ),
                              );
                            } : null,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column generateSeats() {
    List<int> numberOfSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            numberOfSeats[i], (index) => Padding(
              padding: EdgeInsets.only(
                right: index < numberOfSeats[i] - 1 ? 16 : 0,
                bottom: 16,
              ),
              child: SelectableBox(
                "${String.fromCharCode(i + 65)}${index + 1}",
                width: 40,
                height: 40,
                textStyle: whiteNumberFont.copyWith(color: Colors.black),
                isSelected: selectedSeats.contains("${String.fromCharCode(i + 65)}${index + 1}"),
                isEnabled: index != 0,
                onTap: () {
                  String seatNumber = "${String.fromCharCode(i + 65)}${index + 1}";
                  setState(() {
                    if (selectedSeats.contains(seatNumber)) {
                      selectedSeats.remove(seatNumber);
                    }
                    else {
                      selectedSeats.add(seatNumber);
                    }
                  });
                },
              ),
            )
          ),
        ),
      );
    }

    return Column(
      children: widgets,
    );
  }
}