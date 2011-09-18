package yahtzee.test

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

import yahtzee.main.scala._

class NumberedRuleTest extends FunSuite with ShouldMatchers {

  private var yahtzeeRule: Rule = _

  test("NR4 scores 4+4 on 1,1,2,4,4") {
    yahtzeeRule = new NumberedRule(4)
    yahtzeeRule.score(1,1,2,4,4) should be (4+4)
  }

  test("NR4 scores 4+4+4 on 1,2,4,4,4") {
    yahtzeeRule = new NumberedRule(4)
    yahtzeeRule.score(1,2,4,4,4) should be (4+4+4)
  }

  test("NR3 scores 3+3 on 1,3,3,4,4") {
    yahtzeeRule = new NumberedRule(3)
    yahtzeeRule.score(1,3,3,4,4) should be (3+3)
  }

}
