## The PNum Type
import utils
  
when pmathBigInts:
  import bigints
else:
  import std/math

when defined(nimdoc):
  import bigints

when defined(enablePMathComplexConversion) or defined(nimdoc):
  from std/complex import Complex, complex

type 
  PNumKind* = enum pnkFraction, pnkRadical # Add PI and I
  PNumRef* = ref PNum
  PNum* = object 
    ## Perfect Number
    isInt*: bool # Whole number shortcut

    # Decimal / Floats are innacurate. Fractions and roots are the main number format
    case kind*: PNumKind
    of pnkFraction:
      when pmathBigInts:
        n*: BigInt
        d*: BigInt
      else:
        n*: BiggestInt # numerator
        d*: BiggestInt # denominator

    of pnkRadical:
      negative*: bool
      base*: PNumRef 
      power*: int








# Forward decl

proc copyToRef*(pn: PNum): PNumRef
  ## Copy a ``PNum`` to a ``PNumRef`` object for recursion

proc simplify*(pn: var PNum)
  ## Simplify a fraction or radical ``PNum``. This makes it so that the numbers don't endlessly get bigger, and keeps things clean.

proc isImaginary*(pn: PNum): bool
  ## Checks whether a PNum is imaginary

proc setNegative*(pn: var PNum, n: bool)
  ## Sets if a PNum is negative or not



# Basic Utils section

proc newRadical*(radicand: PNum, power: int, negative=false): PNum = 
  ## Create new radical as ``nthRoot(radicand, power)``

  result = PNum(kind: pnkRadical, negative: negative)
  result.base = radicand.copyToRef()
  result.power = power
  # No Simplify for mid-process reasons

proc newPNum*(i: SomeFloat): PNum =
  ## Create new perfect number from a nim float. This is automatically converted to a fraction. 
  ##
  ## **Notice:** This is a inaccurate conversion and issues with float can affect the resulting fraction. (.0159999999 issues)

  let fl = BiggestFloat(i)
  let frac = decimalToFraction(fl)

  when pmathBigInts:
    result = PNum(kind: pnkFraction, n: initBigInt(frac[0]), d: initBigInt(frac[1]))
  else:
    result = PNum(kind: pnkFraction, n: frac[0], d: frac[1])

  result.simplify()

proc newPNum*(i: SomeInteger): PNum =
  ## Create new perfect number from a nim int. This is automatically converted to a integer type fraction.
  when pmathBigInts:
    result = PNum(kind: pnkFraction, n: initBigInt(i), d: initBigInt(1))
  else:
    result = PNum(kind: pnkFraction, n: BiggestInt(i), d: 1)
  result.isInt = true

proc newPNum*(a: SomeInteger, b: SomeInteger): PNum =
  ## Create a new fraction ``PNum`` as ``a / b``.
  when pmathBigInts:
    result = PNum(kind: pnkFraction, n: initBigInt(a), d: initBigInt(b))
  else:
    result = PNum(kind: pnkFraction, n: BiggestInt(a), d: BiggestInt(b))

  result.simplify()


when pmathBigInts or defined(nimdoc):
  proc newPNum*(a: BigInt, b: BigInt): PNum =
    result = PNum(kind: pnkFraction, n: a, d: b)
    result.simplify()

  proc newPNum*(a: BigInt): PNum =
    result = PNum(kind: pnkFraction, n: a, d: initBigInt(1))
    result.isInt = true

converter toPNum*(n: SomeNumber): PNum = 
  ## Convert ``n`` to pnum
  return newPNum(n)

proc `$`*(p: PNum): string =
  ## Convert ``p`` to string
  var pn = p
  pn.simplify()

  if pn.kind == pnkFraction: 
    if pn.isInt:
      return $pn.n
    result = $pn.n & " / " & $pn.d
  elif pn.kind == pnkRadical:
    var bse = deepCopy(pn.base[])

    if pn.negative:
      result = "-"

    if pn.isImaginary:
      bse.setNegative(false)

      if bse.kind == pnkFraction:
        let simp = simplifyRadicalFrac(bse.n, bse.d, pn.power)
        if simp != (-1, -1):
          if simp[1] == 1:
            if simp[0] == 1:
              result &= "i"
            else:
              result &= $simp[0] & "i"
          else:
            result &= $simp[0] & "/" & $simp[1] & "i"
          return


      result &= "i*nthRoot(" & $bse & ", " & $pn.power & ")" 
      # Saying the root of i is meaningless becuase in the process of multiplying it is applied anyway


    else: 
      result &= "nthRoot(" & $bse & ", " & $pn.power & ")"


when pmathBigInts:
  converter toBigInt*(pn: PNum): BigInt =
    ## Convert whole number ``pn`` to BigInt
    doAssert pn.isInt
    return pn.n

else:
  converter toInt*(pn: PNum): int =
    ## Convert whole number ``pn`` to nim int
    doAssert pn.isInt
    return pn.n

converter toBiggestFloat*(pn: PNum): BiggestFloat =
  ## Convert fraction or radical to largest float
  if pn.kind == pnkFraction: 
    result = pn.n / pn.d
  elif pn.kind == pnkRadical:
    result = nthRoot(pn.base[].toBiggestFloat, BiggestFloat(pn.power))
    if pn.negative:
      result *= -1


when defined(enablePMathComplexConversion) or defined(nimdoc):
  converter toComplex*(pn: PNum): Complex[BiggestFloat] =
    ## Convert imaginary ``pn`` to complex. Requires ``-d:enablePMathComplexConversion`` flag.
    doAssert pn.isImaginary()
    var pnc = deepCopy(pn)
    pnc.base[].setNegative(false)
    return complex(0.0, BiggestFloat(pnc))

converter toFloat*(pn: PNum): float = 
  ## Convert ``pn`` to float
  return pn.toBiggestFloat.float









# Utils section

proc isNegative*(pn: PNum): bool =
  ## Checks whether a PNum is negative
  if pn.kind == pnkFraction:
    return pn.n < 0 xor pn.d < 0
  elif pn.kind == pnkRadical:
    return pn.negative

proc setNegative*(pn: var PNum, n: bool) =
  ## Sets if a PNum is negative or not
  if pn.kind == pnkFraction:
    if n:
      pn.n = abs(pn.n) * -1
    else:
      pn.n = abs(pn.n)

  elif pn.kind == pnkRadical:
    pn.negative = n

proc isImaginary*(pn: PNum): bool =
  ## Checks whether a PNum is imaginary
  return pn.kind == pnkRadical and pn.base[].isNegative and (pn.power mod 2 == 0)
  # Even power and negative radicand and is a radical

proc copyToRef*(pn: PNum): PNumRef =
  ## Copy a ``PNum`` to a ``PNumRef`` object for recursion
  case pn.kind
  of pnkFraction:
    result = PNumRef(kind: pnkFraction)
    result.n = pn.n
    result.d = pn.d
  of pnkRadical:
    result = PNumRef(kind: pnkRadical)
    result.base = pn.base
    result.negative = pn.negative
    result.power = pn.power



proc flip*(pn: PNum): PNum =
  ## Flip numerator and denominator of ``pn``

  if pn.kind == pnkFraction:
    return newPNum(pn.d, pn.n)
  elif pn.kind == pnkRadical:
    return pn.base[].flip()


proc simplify*(pn: var PNum) =
  ## Simplify a fraction or root ``PNum``. This makes it so that the numbers don't endlessly get bigger, and keeps things clean.
  
  if pn.kind == pnkFraction:
    let gcf = gcd(pn.n, pn.d)
    if gcf > 1:
      pn.n = pn.n div gcf
      pn.d = pn.d div gcf


    if pn.d < 0: # Negatives
      pn.d *= -1 # -5/-7 -> 5/7
      pn.n *= -1 # 3/-7 -> -3/7

    if pn.d == 1:
      pn.isInt = true
    else:
      pn.isInt = false

  elif pn.kind == pnkRadical:
    if pn.base[].kind == pnkRadical and (not pn.base[].negative):
      pn.power *= pn.base[].power
      pn.base = pn.base[].base

    if pn.power < 0:
      pn.base[] = pn.base[].flip()

    pn.base[].simplify()

    if pn.power == 1:
      pn = pn.base[]

    elif pn.base[].kind == pnkFraction and not pn.base[].isNegative: # Yeah no simplifying imaginary numbers

      let simp = simplifyRadicalFrac(pn.base[].n, pn.base[].d, pn.power)
      if simp != (-1, -1):
        pn = newPNum(simp[0], simp[1])

proc ensureRadical*(pn: PNum): PNum =
  ## Converts ``pn`` to radical if it is a fraction
  if pn.kind == pnkFraction:
    
    result = newRadical(newPNum(pn.n ^ 2, pn.d ^ 2), 2, isNegative(pn)) # Negative
  else:
    result = pn

proc adjustRadical*(pn: PNum, pow: int): PNum =
  ## Adjusts radical ``pn`` to the power ``pow``. ``simplify`` will undo this.

  doAssert pn.kind == pnkRadical
  doAssert pn.base[].kind == pnkFraction
  let diff = pow - pn.power + 1
  let base = newPNum(pn.base[].n ^ diff, pn.base[].d ^ diff) # Raise power
  result = newRadical(base, pow, pn.negative)









# Macros and Templates section
import std/macros

template `!`*(i: SomeNumber): untyped = newPNum(i)
  ## Alias for newPNum

proc recursiveConv(bd: NimNode): NimNode =
  if bd.kind in {nnkIntLit, nnkFloatLit}:
    return newCall(newIdentNode("newPNum"), bd)
  if bd.len < 1:
    return bd
  result = newNimNode(bd.kind)
  for child in bd:
    result.add recursiveConv(child)

macro `!!`*(body: untyped): untyped =
  ## Converts all numbers in ``body`` into ``PNum``.
  return recursiveConv(body)