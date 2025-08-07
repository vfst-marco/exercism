object BeerSong {

  val verseN =
    "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n"
  val verse2 =
    "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  val verse1 =
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  val verse0 =
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"

  def recite(start: Int, count: Int): String =
    if (count == 0) ""
    else if (count == 1) getSentence(start)
    else getSentence(start) + "\n" + recite((start + 99) % 100, count - 1)

  private def getSentence(bottles: Int) =
    bottles match {
      case 0          => verse0
      case 1          => verse1
      case 2          => verse2
      case x if x < 0 => ""
      case x          => verseN.format(x, x, x - 1)
    }

}
