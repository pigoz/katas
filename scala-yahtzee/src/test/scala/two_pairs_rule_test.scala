package yahtzee.test

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

import yahtzee.main.scala._

class TwoPairsRuleTest extends FunSuite with ShouldMatchers {

  private var yahtzeeRule: Rule = _

  test("Two Pairs scores 8 on 1,1,5,2,3,3") {
    yahtzeeRule = new TwoPairsRule
    yahtzeeRule.score(1,1,5,2,3,3) should be (8)
  }

  test("Two Pairs scores 8 on 2,2,5,2,3,3") {
    yahtzeeRule = new TwoPairsRule
    yahtzeeRule.score(2,2,5,2,3,3) should be (10)
  }
}
