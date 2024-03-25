## =================================
## PMath (Perfect and Precise Math)
## =================================
##
## Introduction
## ===============
##
## PMath is meant to be a library that resolves the inaccuracies of normal float math. 
## PMath **does not use any floats**, and retains the most accurate format of a given number.
## 
## **Remember:**
## * PMath is focused on accuracy, not speed or size
## * All numbers must be converted to PNum before they are used, and all PNum numbers are accurate
## * Currently, to do certain actions, like add radicals, you will have to convert to float. 
##   You will loose accuracy becuase you are using float math.
##
##
##
## Module Division
## =================
##
## * PMath (Main Module): Basic math ops, eg. add, subtract, multiply, divide...
## * Types: Automatically imported, holds the ``PNum`` type and it's utils, eg. simplify, copyToRef, newPNum, $
## * Expanded (Coming Soon): Other math functions like log, cos, sin, tan, etc.
## * Constants: Contains math constants like i and PI.
##
##
## Support
## ===============
##
## .. raw:: html
##
##    <table style="border-collapse:collapse;border-spacing:0" class="tg"><thead><tr><th style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Feature</th><th style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Radical Support</th><th style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Fraction Support</th><th style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Future Support</th><th style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Notes</th></tr></thead><tbody><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Radicals</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅ (All)</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Fractions</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅ (All)</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Additive Groups</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Goes with irrational numbers and adds support for adding and subtracting radicals.</td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Irrational Numbers</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">E, PI, etc.</td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">BigInt Support</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅ (All)</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Imaginary Numbers</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅ (All)</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Addition</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Subtraction </td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Multiplication</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Division </td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Exponents</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Roots</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Equals Operator</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Comparison Operators</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal"></td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">Shortcuts</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">✅</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:top;word-break:normal">+=, *=, inc, etc.</td></tr></tbody></table>
##
## Examples
## ==========
##
## Examples of the PMath library.
##
##
## Basic Example
## ---------------
##
## .. code:: nim
##
##   import pmath
##
##   ## `!!` means that all math inside of the parentheses is PMath
##
##   echo !!(((1 / 3) + (5 / 4)) / 2 == (1 / 24) + (18 / 24)) 
## 
##   echo !!(sqrt(5) * sqrt(3) == sqrt(15))
##
##   echo !!((1 / 4) * 3 - 5)
##
##
## BigInt Examples (Calculating PI)
## ---------------------------------
##
## Please enable the ``-d:pmathBigInts`` flag to use bigints.
## 
## .. code:: nim
##
##   import pmath 
##
##   ## Leibniz’s formula
##
##   var pi = !0
##   var k = !1
##
##   for i in !!(0..(10 ^ 3)):
## 
##     if i mod 2 == 0:
##       pi += !!(4 / k)
##     else:
##       pi -= !!(4 / k)
##
##     k += 2
##
##   echo pi
## 
##   proc readableFloat(pn: PNum): BiggestFloat =
##     return BiggestFloat(pn * (10 ^ 8)) / BiggestFloat(10 ^ 8) 
##
##   echo readableFloat(pi * 8) # Circumference of a circle with a diameter of 8. Should ~= 25
##
##
## Accuracy Example
## ------------------
##
## .. code:: nim
##
##   import pmath
##
##   var meters = 0.0
##   for _ in 1..100000000:
##     meters += 0.01
##
##   echo meters
##   echo meters == 1000000 # false
##
##
##   let change = newPNum(1, 100) # Declared as let for speed
##   var meters2 = !0
##
##   for _ in 1..100000000:
##     meters2 += change
##
##   echo meters2
##   echo meters2 == !1000000 # true
##
##





import pmath/types
import std/math
export types

when defined(nimdoc):
  import pmath/[templates, constants]


from pmath/private/utils import pmathBigInts
when pmathBigInts:
  import bigints
  {.hint[DuplicateModuleImport]: off.}
  import pmath/private/utils
  {.hint[DuplicateModuleImport]: on.}

# Math ops

proc `*`*(a: PNum, b: PNum): PNum =
  ## Multiply ``a`` and ``b``
  if a.isInt and b.isInt: # Intmath
    return newPNum(a.n * b.n)

  if a.kind == pnkRadical or b.kind == pnkRadical: # Rootmath
    var ar = ensureRadical(a)
    var br = ensureRadical(b)
    let dom = max(ar.power, br.power)

    ar = ar.adjustRadical(dom)
    br = br.adjustRadical(dom)

    result = newRadical(ar.base[] * br.base[], ar.power, ar.negative xor br.negative)
    result.simplify()
    return

  result = newPNum(a.n * b.n, a.d * b.d) # Multiply numerators and denominators
  result.simplify()


proc `/`*(a: PNum, b: PNum): PNum =
  ## Divide ``a`` and ``b``  
  # No intmath for div, result will usally be fraction

  if a.kind == pnkRadical or b.kind == pnkRadical: # Rootmath
    var ar = ensureRadical(a)
    var br = ensureRadical(b)
    let dom = max(ar.power, br.power)

    ar = ar.adjustRadical(dom)
    br = br.adjustRadical(dom)

    result = newRadical(ar.base[] / br.base[], ar.power, ar.negative xor br.negative)
    result.simplify()
    return

  result = newPNum(a.n * b.d, a.d * b.n) # Cross Multiply n/d * d/n
  result.simplify()


proc `+`*(a: PNum, b: PNum): PNum =
  ## Add ``a`` and ``b``
  if a.isInt and b.isInt: # Intmath
    return newPNum(a.n + b.n)

  if a.kind == pnkRadical or b.kind == pnkRadical: # Rootmath
    raise ValueError.newException("PNum radical groups are not currently supported, and radicals cannot be accurately added or subtracted.")

  if a.d == b.d:
    result = newPNum(a.n + b.n, a.d)
  else:
    let denominator = lcm(a.d, b.d)
    result = newPNum((a.n * (denominator div a.d)) + (b.n * (denominator div b.d)), denominator) # Adjust and add

  result.simplify()

proc nthRoot*(a: PNum, n: PNum): PNum
  ## ``n``th root of ``a``

proc `^`*(a: PNum, p: PNum): PNum =
  ## Raise ``a`` to the ``p`` power
  doAssert p.kind == pnkFraction # No rasing to radical power
  var pow = p
  if p.isNegative:
    pow = pow * -1

  if pow.isInt and a.kind == pnkFraction:

    when pmathBigInts:
      result = newPNum(a.n ^ pow.toBigInt, a.d ^ pow.toBigInt)
    else:
      result = newPNum(a.n ^ pow.toInt, a.d ^ pow.toInt)

  elif a.kind == pnkRadical: # Rootmath
    #[
    var neg = a.negative

    if a.isImaginary:
      neg = (-1 ^ (floorDiv(pow.n, 2) + 2)) < 0 # Calculates i dynamics
    elif pow.n mod 2 == 0:
      neg = false
    ]#

    let base = a.base[]
    
    result = nthRoot(base, newPNum(a.power) / pow)

    # result.setNegative(neg)

  else:
    result = nthRoot(newPNum(a.n ^ pow.n, a.d ^ pow.n), newPNum(pow.d)) # nthRoot(num ^ n, d)


  if p.isNegative:
    result = result.flip()
  result.simplify()



proc nthRoot(a: PNum, n: PNum): PNum =
  doAssert n.kind == pnkFraction

  when pmathBigInts:
    result = newRadical(a ^ newPNum(n.d), toIntC[int](n.n))
  else:
    result = newRadical(a ^ newPNum(n.d), n.n) 

  if a.isNegative and ((n.d + 1) mod 4 == 0): # i stuff
    result.setNegative(true)

  result.simplify()


proc sqrt*(a: PNum): PNum = 
  ## Sqaure root of ``a``

  result = newRadical(a, 2)
  result.simplify()


proc cbrt*(a: PNum): PNum = 
  ## Cube root of ``a``

  result = newRadical(a, 3)
  result.simplify()

template `-`*(a: PNum): PNum = (a * newPNum(-1))
  ## Negative of ``a``

template `-`*(a, b: PNum): PNum = a + -b
  ## Subtraction of ``b`` from ``a``. Expands to ``a + -b``

proc `mod`*(a, b: PNum): PNum =
  ## Get the remainder of ``a / b``
  if a.isInt and b.isInt:
    result = newPNum(a.n mod b.n) 
  else:
    let r = a / b
    result = newPNum(r.n mod r.d)



# Set and Bool ops

proc `==`*(a: PNum, b: PNum): bool =
  ## Compare ``a`` and ``b``
  if a.kind == pnkFraction and b.kind == pnkFraction:
    return a.n == b.n and a.d == b.d
  else:
    var ar = ensureRadical(a)
    var br = ensureRadical(b)
    return ar.power == br.power and ar.negative == br.negative and ar.base[] == br.base[]

proc `>`*(a: PNum, b: PNum): bool =
  ## Sees if ``a`` is greater than ``b``
  if a.kind == pnkFraction and b.kind == pnkFraction:
    let denominator = lcm(a.d, b.d)
    return (a.n * (denominator div a.d)) > (b.n * (denominator div b.d))
  else:
    var ar = ensureRadical(a)
    var br = ensureRadical(b)    
    let dom = max(ar.power, br.power)

    ar = ar.adjustRadical(dom)
    br = br.adjustRadical(dom)
    return ar.base[] > br.base[]
   

template `<`*(a: PNum, b: PNum): untyped = b > a
  ## Shortcut for ``b > a`` 

template `>=`*(a: PNum, b: PNum): untyped = a == b or a > b
  ## Shortcut for ``a == b or a > b``

template `<=`*(a: PNum, b: PNum): untyped = a == b or a < b
  ## Shortcut for ``a == b or a < b``
   

template `+=`*(a: var PNum, b: PNum): untyped = 
  ## Shortcut for ``a = a + b``
  a = a + b

template `-=`*(a: var PNum, b: PNum): untyped = 
  ## Shortcut for ``a = a - b``
  a = a - b

template `*=`*(a: var PNum, b: PNum): untyped = 
  ## Shortcut for ``a = a * b``
  a = a * b

template `/=`*(a: var PNum, b: PNum): untyped = 
  ## Shortcut for ``a = a / b``
  a = a / b

template `^=`*(a: var PNum, b: PNum): untyped = 
  ## Shortcut for ``a = a ^ b``
  a = a ^ b

template inc*(a: var PNum): untyped = a += 1
  ## Shortcut for ``a += 1``