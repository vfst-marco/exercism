object Etl {
  def transform(scoreMap: Map[Int, Seq[String]]): Map[String, Int] =
    for {
      (score, chars) <- scoreMap
      letter <- chars
    } yield letter.toLowerCase() -> score
}
