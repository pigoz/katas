package yahtzee.main.scala

class StraightRule(initial:Int) extends Rule {
  def score(rolls: Int*) : Int = {
    val list = rolls.toList

    list.foldLeft((initial, 0)){(memo, elem) =>
      // ensure they are ordered, and precompute sum
      if(elem == memo._1)
        (memo._1 + 1, memo._2 + elem)
      else
        (initial, 0)
    }._2
  }
}
