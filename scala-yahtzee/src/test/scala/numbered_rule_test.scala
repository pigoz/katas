package yahtzee.test

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

import yahtzee.main.scala._

class NumberedRuleTest extends FunSuite with ShouldMatchers {

  private var yahtzeeRule: Rule = _

  test("NR4 scores 8 on 1,1,2,2,4,4") {
    yahtzeeRule = new NumberedRule(4)
    yahtzeeRule.score(1,1,2,2,4,4) should be (8)
  }

  test("NR4 scores 12 on 1,1,2,4,4,4") {
    yahtzeeRule = new NumberedRule(4)
    yahtzeeRule.score(1,1,2,4,4,4) should be (12)
  }

  test("NR3 scores 6 on 1,1,3,3,4,4") {
    yahtzeeRule = new NumberedRule(3)
    yahtzeeRule.score(1,1,3,3,4,4) should be (6)
  }

}
