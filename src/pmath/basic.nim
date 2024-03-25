## The basic arithmetic operations for PNum


import core/types
import std/math
# export types




from pmath/core/utils import pmathBigInts
when pmathBigInts:
  import bigints
  {.hint[DuplicateModuleImport]: off.}
  import pmath/core/utils
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