import '../../../models/journal.dart';
import 'journal_card.dart';

List<JournalCard> generateListJournalCards(
    {required int windowPage,
    required DateTime currentDay,
    required Map<String, Journal> database,
    required Function refreshFunction,
    required int userId,
    required String token}) {

  // Cria uma lista de Cards vazios
  List<JournalCard> list = List.generate(
    windowPage + 1,
    (index) => JournalCard(
      showedDate: currentDay.subtract(Duration(days: (windowPage) - index)),
      refreshFunction: refreshFunction,
      userId: userId,
      token: token,
    ),
  );

  //Preenche os espaços que possuem entradas no banco
  database.forEach((key, value) {
    if (value.createdAt
        .isAfter(currentDay.subtract(Duration(days: windowPage)))) {
      int difference = value.createdAt
          .difference(currentDay.subtract(Duration(days: windowPage)))
          .inDays
          .abs();

      list[difference] = JournalCard(
        showedDate: list[difference].showedDate,
        journal: value,
        refreshFunction: refreshFunction,
        userId: userId,
        token: token,
      );
    }
  });
  return list;
}
