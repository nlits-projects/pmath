## Constants, such as E, i and PI

import types

type PMathConstants = object 
  ## Representitve object for syntax


let pmathConstants* = PMathConstants()

template i*(c: PMathConstants): untyped = newRadical(newPNum(-1), 2)
  ## Creates a imaginary number, or sqrt(-1).

template undefined*(c: PMathConstants): untyped = newPNum(0, 0)
  ## Creates a undefined number, or 0/0.