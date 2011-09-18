package yahtzee.test

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

import yahtzee.main.scala._

class PairRuleTest extends FunSuite with ShouldMatchers {

  private var yahtzeeRule: Rule = _

  test("Pair scores 8 on 1,2,2,4,4") {
    yahtzeeRule = new PairRule
    yahtzeeRule.score(1,2,2,4,4) should be (8)
  }

  test("Pair scores 10 on 1,2,2,5,5") {
    yahtzeeRule = new PairRule
    yahtzeeRule.score(1,2,2,5,5) should be (10)
  }

  test("Pair scores 0 on 1,2,3,4,5") {
    yahtzeeRule = new PairRule
    yahtzeeRule.score(1,2,3,4,5) should be (0)
  }
}

