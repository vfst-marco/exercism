object Bob {

  private def isQuestion(statement: String): Boolean = statement.last == '?'
  private def isYelled(statement: String): Boolean =
    statement == statement.toUpperCase() && hasLetters(statement)
  private def hasLetters(statement: String): Boolean =
    statement.exists(p => p.isLetter)

  def response(statement: String): String = statement.trim match {
    case x if x == "" => "Fine. Be that way!"
    case x if (isQuestion(x) && isYelled(x)) =>
      "Calm down, I know what I'm doing!"
    case x if (isQuestion(x)) => "Sure."
    case x if (isYelled(x))   => "Whoa, chill out!"
    case _                    => "Whatever."
  }
}
