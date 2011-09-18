package yahtzee.test

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

import yahtzee.main.scala._

class NOfAKindRuleTest extends FunSuite with ShouldMatchers {

  private var yahtzeeRule: Rule = _

  test("3 Of A Kind return 3+3+3 on 3,3,3,4,5") {
    yahtzeeRule = new NOfAKindRule(3)
    yahtzeeRule.score(3,3,3,4,5) should be (3+3+3)
  }

  test("3 Of A Kind return 4+4+4 on 3,4,4,4,5") {
    yahtzeeRule = new NOfAKindRule(3)
    yahtzeeRule.score(3,4,4,4,5) should be (4+4+4)
  }

  test("4 Of A Kind return 4+4+4+4 on 4,4,4,4,5") {
    yahtzeeRule = new NOfAKindRule(4)
    yahtzeeRule.score(4,4,4,4,5) should be (4+4+4+4)
  }

}

