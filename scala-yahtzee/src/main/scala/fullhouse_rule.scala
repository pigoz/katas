package yahtzee.main.scala

class FullhouseRule extends Rule {
  def score(rolls: Int*) : Int = {
    val list = rolls.toList
    if(list.distinct.length == 2)
      list.sum
    else
      0
  }
}
