enum Bearing:
  case North, East, South, West

type Position = (Int, Int)

case class Robot(val bearing: Bearing, val coordinates: Position) {
  def turnRight = copy(bearing =
    Bearing.fromOrdinal((bearing.ordinal + 1) % Bearing.values.length)
  )
  def turnLeft = turnRight.turnRight.turnRight
  def advance = bearing match
    case Bearing.North =>
      copy(coordinates = (coordinates._1, coordinates._2 + 1))
    case Bearing.East =>
      copy(coordinates = (coordinates._1 + 1, coordinates._2))
    case Bearing.South =>
      copy(coordinates = (coordinates._1, coordinates._2 - 1))
    case Bearing.West =>
      copy(coordinates = (coordinates._1 - 1, coordinates._2))
  def simulate(actions: String): Robot =
    if actions.isEmpty()
    then this
    else
      (actions.head match
        case 'A' => advance
        case 'L' => turnLeft
        case 'R' => turnRight
        case _   => this
      ).simulate(actions.tail)

}
