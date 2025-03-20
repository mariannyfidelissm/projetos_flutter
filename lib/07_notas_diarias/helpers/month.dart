/// Gera mês do ano em português
class Month {
  DateTime date;
  late String short;
  late String long;

  Month(this.date) {
    int month = date.month;
    switch (month) {
      case 1:
        short = "jan";
        long = "Janeiro";
        break;
      case 2:
        short = "fev";
        long = "Fevereiro";
        break;
      case 3:
        short = "mar";
        long = "Março";
        break;
      case 4:
        short = "abr";
        long = "Abril";
        break;
      case 5:
        short = "mai";
        long = "Maio";
        break;
      case 6:
        short = "jun";
        long = "Junho";
        break;
      case 7:
        short = "jul";
        long = "Julho";
        break;
      case 8:
        short = "ago";
        long = "Agosto";
        break;
      case 9:
        short = "set";
        long = "Setembro";
        break;
      case 10:
        short = "out";
        long = "Outubro";
        break;
      case 11:
        short = "nov";
        long = "Novembro";
        break;
      case 12:
        short = "dez";
        long = "Dezembro";
        break;

    }
  }
}
