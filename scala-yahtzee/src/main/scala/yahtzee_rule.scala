package yahtzee.main.scala

class YahtzeeRule extends Rule {
  def score(rolls: Int*) : Int = {
    rolls.toList.reduce{(memo, elem) =>
      elem match {
        case `memo` => elem
        case _ => 0
      }
    } match {
      case 0 => 0
      case _ => 50
    }
  }
}
