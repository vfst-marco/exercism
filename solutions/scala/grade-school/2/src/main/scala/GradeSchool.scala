class School {
  type DB = Map[Int, Seq[String]]

  var d = Map[Int, Seq[String]]()

  def add(name: String, g: Int) = d =
    d + (g -> (db.getOrElse(g, Seq()) :+ name))
  def db: DB = d
  def grade(g: Int): Seq[String] = db.getOrElse(g, Seq())
  def sorted: DB =
    db.toSeq.sortBy(_._1).map(entry => entry._1 -> entry._2.sorted).toMap
}
