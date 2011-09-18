package yahtzee.main.scala

class NOfAKindRule(N : Int) extends Rule {
  def score(rolls: Int*) : Int = {
    val list = rolls.toList
    val uniq = list.distinct.sort(_ > _)

    uniq.foldLeft(0){(memo, elem) =>
      if(list.count(elem == _) >= N && elem*N > memo)
        elem*N
      else
        memo
    }
  }
}
