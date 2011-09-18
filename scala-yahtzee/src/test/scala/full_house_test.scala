package yahtzee.test

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

import yahtzee.main.scala._

class FullhouseRuleTest extends FunSuite with ShouldMatchers {

  private var yahtzeeRule: Rule = _

  test("Fullhouse returns the sum of all dice if input is 1,1,2,2,2") {
    yahtzeeRule = new FullhouseRule
    yahtzeeRule.score(1,1,2,2,2) should be (1+1+2+2+2)
  }

  test("Fullhouse returns 0 if input is 2,2,2,2,2") {
    yahtzeeRule = new FullhouseRule
    yahtzeeRule.score(2,2,2,2,2) should be (0)
  }
}
