

import unittest

import pmath, pmath/templates
  
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


import std/random
test "can random":
  randomize()
  let num = !rand(200) - 100
  echo num
  echo num + 5
  echo num / 10
  echo num * 15
  echo num - 45
  echo num ^ 2

test "can radicals":
  echo sqrt(9)
  let a = !!(2 ^ (3 / 4)) # 2 to the 3/4 power
  echo a
  let b = nthRoot(!2, !!(3 / 4))
  echo b
  let c = !!((4 / 3) ^ (3 / 4))
  echo c
  try:
    echo a + b - c
  except ValueError as e:
    echo e.msg

  echo a.toFloat
  echo b.toFloat
  echo c.toFloat

  var f = !!(3 / 4)
  echo f
  echo f.ensureRadical()

  echo -sqrt(5) * sqrt(6)
  echo -sqrt(5) / -sqrt(6) 

  echo sqrt(sqrt(5))
  echo nthRoot(nthRoot(4, 4), 4)

  echo nthRoot(4, 3) ^ (3 / 4)

test "can negative":
  echo !!(-5 * 6)
  echo !!(-5 * -6)
  echo !!(5 * 6)
  # Fractions
  echo !!(-(5 / 3) * (6 / 3))
  echo !!((-5 / 3) * (6 / 3))
  echo !!((-5 / 3) * (-6 / 3))
  echo !!((5 / -3) * (6 / 3))
  echo !!((5 / -3) * (6 / -3))
  echo !!(-5 / -3)
  echo !!(-(5 / 3) * -(6 / 3))
  echo !!((5 / 3) * (6 / 3))
  # Roots
  echo sqrt(-5) * sqrt(6)
  echo -sqrt(5) * sqrt(6)
  echo sqrt(-5) * sqrt(-6)
  echo -sqrt(5) * -sqrt(6)
  echo sqrt(-5) * -sqrt(6)
  echo -sqrt(-5) * -sqrt(-6)

test "can negative radicals":
  echo 5 ^ -3
  echo nthRoot(5, -6)

test "can compare":
  check !!(9 == 18 / 2)
  check !!(nthRoot(16, 3) == 4 ^ (2 / 3))
  check !!(4 != 3)
  check !!(4 > 3)

  for i in !!(0..15):
    echo i


import pmath/constants
from math import isNaN

test "can imaginary":
  let i = pmathConstants.i
  echo i.isImaginary
  for n in !!(0..5):
    echo "i ^ ", n, " == ", i ^ n


  let i2 = nthRoot(-5, 4)
  for n in !!(0..5):
    echo "i2 ^ ", n, " == ", i2 ^ n

  check float(i).isNaN