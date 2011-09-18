package yahtzee.test

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

import yahtzee.main.scala._

class YahtzeeTest extends FunSuite with ShouldMatchers {

  private var yahtzee: Yahtzee = _

  test("Game is empty when just created") {
    yahtzee = new Yahtzee
  }

}
