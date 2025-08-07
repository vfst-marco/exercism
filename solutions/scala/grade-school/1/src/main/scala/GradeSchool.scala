class School {
  type DB = collection.mutable.Map[Int, Seq[String]]

  val d = collection.mutable.Map[Int, Seq[String]]()

  def add(name: String, g: Int) =
    db(g) = (db.getOrElseUpdate(g, Seq()) :+ name)

  def db: DB = d

  def grade(g: Int): Seq[String] = db.getOrElse(g, Seq())
  def sorted: DB = db.mapValuesInPlace((k, v) => v.sorted)
}
