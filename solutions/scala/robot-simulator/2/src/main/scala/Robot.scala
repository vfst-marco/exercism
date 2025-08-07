object Bearing extends Enumeration {
  type Bearing = Value
  val North, East, South, West = Value
}

case class Robot(val bearing: Bearing.Value, val coordinates: (Int, Int)) {
  def turnRight = {
    val idx: Int = Bearing.values.toList.indexOf(bearing)
    val nextIdx: Int = (idx + 1) % Bearing.maxId
    copy(bearing = Bearing(nextIdx))
  }
  def turnLeft = turnRight.turnRight.turnRight
  def advance = bearing match {
    case Bearing.North =>
      copy(coordinates = (coordinates._1, coordinates._2 + 1))
    case Bearing.East =>
      copy(coordinates = (coordinates._1 + 1, coordinates._2))
    case Bearing.South =>
      copy(coordinates = (coordinates._1, coordinates._2 - 1))
    case Bearing.West =>
      copy(coordinates = (coordinates._1 - 1, coordinates._2))
  }
  def simulate(actions: String): Robot =
    if (actions.isEmpty())
      this
    else
      (actions.head match {
        case 'A' => advance
        case 'L' => turnLeft
        case 'R' => turnRight
        case _   => this
      }).simulate(actions.tail)

}
