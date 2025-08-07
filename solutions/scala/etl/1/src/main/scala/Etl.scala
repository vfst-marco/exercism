object Etl {
  def transform(scoreMap: Map[Int, Seq[String]]): Map[String, Int] =
    scoreMap.toSeq
      .flatMap({ case (value, chars) => chars.map(_.toLowerCase -> value) })
      .toMap
}
