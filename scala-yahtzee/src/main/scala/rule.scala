package yahtzee.main.scala

trait Rule {
  def score(rolls: Int*) : Int
}
