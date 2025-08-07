sealed trait Bearing {
  def right: Bearing
}

object Bearing {
  case object North extends Bearing { val right = East }
  case object East extends Bearing { val right = South }
  case object South extends Bearing { val right = West }
  case object West extends Bearing { val right = North }
}

case class Robot(val bearing: Bearing, val coordinates: (Int, Int)) {
  def turnRight = {
    copy(bearing = bearing.right)
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
