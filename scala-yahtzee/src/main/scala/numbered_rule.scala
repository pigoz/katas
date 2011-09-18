package yahtzee.main.scala

class NumberedRule(Query : Int) extends Rule {
  def score(rolls: Int*) : Int = {
    rolls.foldLeft(0){(memo, elem) =>
      elem match {
        case Query => memo + elem
        case _ => memo
      }
    }
  }
}
