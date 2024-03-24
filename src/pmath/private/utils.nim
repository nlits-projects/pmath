import std/math

proc nthRoot*(a: BiggestFloat, n: BiggestFloat): BiggestFloat =
  ## nthRoot code modified from https://rosettacode.org/wiki/Nth_root#Nim
  if a < 0:
    return NaN

  result = a
  var x = a / n 
  while abs(result-x) > 1e-15:
    x = result
    result = (1/n) * (((n-1)*x) + (a / pow(x, (n-1))))


proc decimalToFraction*(d: BiggestFloat): (BiggestInt, BiggestInt) =
  ## Converts decimals to unsimplified fractions
  var a = d
  var b = BiggestInt(1)
  while trunc(a) != a:

    a *= 10
    b *= 10

  return (BiggestInt(a), b)

proc simplifyRadical(r: int, pow: int): int = 
  let rt = nthRoot(BiggestFloat(r), BiggestFloat(pow)) 
  result = -1
  if round(rt) == rt:
    result = int(rt)

proc simplifyRadicalFrac*(n: BiggestInt, d: BiggestInt, pow: int): (int, int) =

  let nres = simplifyRadical(n, pow)
  let dres = simplifyRadical(d, pow)

  if nres != -1 and dres != -1:
    return (nres, dres)
  return (-1, -1)
