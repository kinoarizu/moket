part of 'pages.dart';

class Wrapper extends StatelessWidget {

  /// ---------------------------------------
  /// [Wrapper Class]
  /// This class that used to wrap all page,
  /// handling page state of this application
  /// and handling state of firebase user.
  /// ---------------------------------------
  @override
  Widget build(BuildContext context) {

    //* Declare firebaseUser to fill state of firebase user
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    // * Check if firebase user state is null
    if (firebaseUser == null) {

      //* Check if prevPageEvent is not contain event to splash page
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(GoToSplashPage());
      }
    } else {

      //* Check if prevPageEvent is not contain event to main page
      if (!(prevPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        context.bloc<TicketBloc>().add(GetTickets(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(GoToMainPage());
      }
    }

    //* Handle building state of page
    //* and checking every page state to determine
    //* the page to display/load
    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) =>

      (pageState is OnSplashPage)
      ? SplashPage()

      : (pageState is OnLoginPage)
      ? SignInPage()

      : (pageState is OnRegistrationPage)
      ? SignUpPage(pageState.registration)

      : (pageState is OnPreferencePage)
      ? PreferencePage(pageState.registration)

      : (pageState is OnAccountConfirmationPage)
      ? AccountConfirmationPage(pageState.registration)

      : (pageState is OnMovieDetailPage)
      ? MovieDetailPage(pageState.movie)

      : (pageState is OnSelectSchedulePage)
      ? SelectSchedulePage(pageState.movieDetail)

      : (pageState is OnSelectSeatPage)
      ? SelectSeatPage(pageState.ticket)

      : (pageState is OnCheckoutPage)
      ? CheckoutPage(pageState.ticket)

      : (pageState is OnSuccessPage)
      ? SuccessPage(pageState.ticket, pageState.transaction)

      : (pageState is OnTicketDetailPage)
      ? TicketDetailPage(pageState.ticket)

      : (pageState is OnProfilePage)
      ? ProfilePage()

      : (pageState is OnTopUpPage)
      ? TopUpPage(pageState.pageEvent)

      : (pageState is OnWalletPage)
      ? WalletPage(pageState.pageEvent)

      : (pageState is OnEditProfilePage)
      ? EditProfilePage(pageState.user)

      : (pageState is OnMainPage)
      ? MainPage(bottomNavBarIndex: pageState.bottomNavBarIndex, isExpired: pageState.isExpired,)

      : Container()
    );
  }
}
