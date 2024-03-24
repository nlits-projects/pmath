import pmath
import pmath/private/utils

import unittest

test "enabled":
  check pmathBigInts

test "can basic":
  let n = newPNum(0.68372)
  echo n

  let a = !3
  echo a
  check n * a == !2.05116

  let b = !!(1 / 3)
  echo b
  check n + b == !!(76279 / 75000)

  check !!(0.5 - 0.3 == 0.2)

  check 3 / 4 == toFloat(!3 / !4)

  check !!(3 + 4).toInt == 7

test "can big":
  ## Calculate e to the billionth
  let n = newPNum(10) ^ newPNum(4) # Acuraccy
  echo n

  let eBase = (1 + (1 / n))
  echo eBase

  let e = eBase ^ n
  let digits = newPNum(10) ^ newPNum(10) # 10 Digits
  echo BiggestFloat(e * digits) / float(digits)