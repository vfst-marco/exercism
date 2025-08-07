object Etl {
  def transform(scoreMap: Map[Int, Seq[String]]): Map[String, Int] =
    // scoreMap
    // .flatMap({ case (score, chars) => chars.map(_.toLowerCase -> score) })
    for {
      (score, chars) <- scoreMap
      letter <- chars
    } yield letter.toLowerCase() -> score
}
