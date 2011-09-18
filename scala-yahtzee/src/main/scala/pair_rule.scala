package yahtzee.main.scala

class PairRule extends Rule {
  def score(rolls: Int*) : Int = {
    val sorted = rolls.toList.sort{_ > _}
    if(sorted.apply(0) == sorted.apply(1)) sorted.apply(0) * 2 else 0
  }
}
