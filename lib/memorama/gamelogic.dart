class Game {
  final String hiddenCardpath = "assets/images/chatbot.png";
  List<String>? gameIng;
  final List<String> cards_list = [
    "assets/images/rompe4.jpg",
    "assets/images/do-magic.png",
    "assets/images/rompe5.jpg",
    "assets/images/rompe1.jpg",
    "assets/images/grateful.png",
    "assets/images/creativity.png",
    "assets/images/rompe6.jpg",
    "assets/images/rompe7.jpg",
    "assets/images/do-magic.png",
    "assets/images/rompe4.jpg",
    "assets/images/creativity.png",
    "assets/images/rompe5.jpg",
    "assets/images/creativity2.png",
    "assets/images/rompe6.jpg",
    "assets/images/rompe7.jpg",
    "assets/images/grateful.png",
    "assets/images/creativity2.png",
    "assets/images/rompe1.jpg",
  ];
  List<Map<int, String>> matchCheck = [];

  final int cardCount = 18;

  void initGame() {
    gameIng = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
