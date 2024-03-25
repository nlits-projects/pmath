import pmath except toPNum
import unittest

test "first example":
  echo !!(((1 / 3) + (5 / 4)) / 2 == (1 / 24) + (18 / 24))
  
  echo !!(sqrt(5) * sqrt(3) == sqrt(15))

  echo !!((1 / 4) * 3 - 5)

test "accuracy example":
  var meters = 0.0
  for _ in 1..100000000:
    meters += 0.01

  echo meters
  echo meters == 1000000

  let change = newPNum(1, 100) # Declared as let for speed
  var meters2 = !0

  for _ in 1..100000000:
    meters2 += change


  echo meters2
  echo meters2 == !1000000