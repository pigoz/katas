package yahtzee.test

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

import yahtzee.main.scala._

class YahtzeeRuleTest extends FunSuite with ShouldMatchers {

  private var yahtzeeRule: Rule = _

  test("YR returns 50 if all numbers are 1") {
    yahtzeeRule = new YahtzeeRule
    yahtzeeRule.score(1,1,1,1,1) should be (50)
  }

  test("YR returns 50 if all numbers are 2") {
    yahtzeeRule = new YahtzeeRule
    yahtzeeRule.score(2,2,2,2,2) should be (50)
  }

  test("YR returns 0 if not all numbers are equals") {
    yahtzeeRule = new YahtzeeRule
    yahtzeeRule.score(1,2,1,2,2) should be (0)
  }

}
