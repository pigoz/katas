package yahtzee.main.scala

class TwoPairsRule extends Rule {
  def score(rolls: Int*) : Int = {
    val list = rolls.toList
    val uniq = list.distinct.sort(_ < _)

    val doubles = uniq.foldLeft(Nil:List[Int]){(memo, elem) =>
      list.count(elem == _ ) match {
        case 0 => memo
        case 1 => memo
        case _ => elem :: memo
      }
    }

    if(doubles.length > 1)
      doubles.apply(0)*2 + doubles.apply(1)*2
    else
      0
  }
}
