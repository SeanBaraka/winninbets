class Prediction{
  String home;
  String away;
  String pick;
  String pickOdds;
  String result;
  bool isWon;

  Prediction(String home, String away, String pick, String pickOdds, String result, bool isWon) {
    this.home = home;
    this.away = away;
    this.pick = pick;
    this.pickOdds = pickOdds;
    this.result = result;
    this.isWon = isWon;
  }
}