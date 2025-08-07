object Hamming {
  def distance(dnaStrandOne: String, dnaStrandTwo: String): Option[Int] =
    if (dnaStrandOne.length() != dnaStrandTwo.length()) None
    else
      Some(dnaStrandOne.zip(dnaStrandTwo).count({ case (c1, c2) => c1 != c2 }))
}
