case class Triangle(a: Double, b: Double, c: Double) {
  private def valid =
    a > 0 && b > 0 && c > 0 && a + b > c && a + c > b && b + c > a
  def equilateral = valid && a == b && b == c
  def isosceles = valid && (a == b || a == c || b == c)
  def scalene = valid && a != b && a != c && b != c
}
