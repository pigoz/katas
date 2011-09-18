package yahtzee.test

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

import yahtzee.main.scala._

class StraightRuleTest extends FunSuite with ShouldMatchers {

  private var yahtzeeRule: Rule = _

  test("Small Straight returns 1+2+3+4+5 on 1,2,3,4,5") {
    yahtzeeRule = new StraightRule(1)
    yahtzeeRule.score(1,2,3,4,5) should be (1+2+3+4+5)
  }

  test("Small Straight returns 0 on 1,2,2,4,5") {
    yahtzeeRule = new StraightRule(1)
    yahtzeeRule.score(1,2,2,4,5) should be (0)
  }

  test("Large Straight returns 2+3+4+5+6 on 2,3,4,5,6") {
    yahtzeeRule = new StraightRule(2)
    yahtzeeRule.score(2,3,4,5,6) should be (2+3+4+5+6)
  }

}
