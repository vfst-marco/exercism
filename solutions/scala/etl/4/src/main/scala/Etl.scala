object Etl {

  type LettersPerScore = Map[Int, Seq[String]]
  type ScorePerLetter = Map[String, Int]

  def transform(scoreMap: LettersPerScore): ScorePerLetter =
    for {
      (score, letters) <- scoreMap
      letter <- letters
    } yield letter.toLowerCase() -> score
}
