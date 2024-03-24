import std/math

## Flags
## ======
##
## * ``-d:pmathBigIntDanger`` disable PMath BigInt danger exceptions
## * ``-d:pmathBigInts`` allows PMath BigInt exploration
## * ``-d:forcePMathBigInts`` forces use of BigInt
##

const pmathBigInts* = defined(forcePMathBigInts) or (defined(pmathBigInts) and not defined(release)) ## To force bigints on release mode, use ``-d:forcePMathBigInts``

when pmathBigInts and not defined(pmathBigIntDanger):
  type BigIntDanger* = object of ValueError
    ## Error realting to BigInt conversion or other fixable but not yet fixed issues

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
  ## Simplifies a radical fraction to a fraction if possible, eg. sqrt(9 / 4) == 3 / 2
  let nres = simplifyRadical(n, pow)
  let dres = simplifyRadical(d, pow)

  if nres != -1 and dres != -1:
    return (nres, dres)
  return (-1, -1)

when pmathBigInts or defined(nimdoc):
  import bigints
  import std/options

  proc simplifyRadicalFrac*(n: BigInt, d: BigInt, pow: int): (BigInt, BigInt) =
    ## Big Int binding for ``simplifyRadicalFrac``

    let smallN = toInt[BiggestInt](n)
    let smallD = toInt[BiggestInt](d)
    if smallN.isNone or smallD.isNone:

      when not defined(pmathBigIntDanger):
        raise BigIntDanger.newException("Integer cannot be simplfied as a radical at current size.")
      else:
        return (initBigInt(-1), initBigInt(-1))

    let res = simplifyRadicalFrac(get(smallN), get(smallD), pow)
    return (initBigInt(res[0]), initBigInt(res[1]))


  template `==`*(a: (BigInt, BigInt), b: (SomeInteger, SomeInteger)): untyped = 
    ## Big Int conversion for ``==``, specific case handle
    (a[0] == initBigInt(b[0]) and a[1] == initBigInt(b[1]))

  template `==`*(a: BigInt, b: SomeInteger): untyped = 
    ## Big Int conversion for ``==``
    (a == initBigInt(b))

  template `<`*(a: BigInt, b: SomeInteger): untyped =
    ## Big Int conversion for ``>``
    (a < initBigInt(b))

  template `<`*(a: SomeInteger, b: BigInt): untyped =
    ## Big Int conversion for ``>``
    (initBigInt(a) < b)

  template `*`*(a: BigInt, b: SomeInteger): untyped =
    ## Big Int conversion for ``>``
    (a * initBigInt(b))

  template `*=`*(a: var BigInt, b: SomeInteger): untyped =
    ## Big Int conversion for ``>``
    a *= initBigInt(b)


  proc toIntC*[T: SomeInteger](i: BigInt): T =
    ## Convert BigInt to int
    let res: Option[T] = toInt[T](i)

    if res.isNone:
      when not defined(pmathBigIntDanger):
        raise BigIntDanger.newException("Bigint cannot be converted as it is too big.")
      else:
        return 0
    return get(res)

  converter toBiggestInt*(i: BigInt): BiggestInt =
    ## Convert BigInt to BiggestInt
    return toIntC[BiggestInt](i)


  proc `^`*[T: BigInt | Natural](a: BigInt, b: T): BigInt =
    when T is BigInt:
      let p = toIntC[int](b)
    else:
      let p = b
    # echo "Raising ", a, " to ", p
    result = pow(a, p)
    # echo "Raised"
  
  proc `/`*(a: BigInt, b: BigInt): BiggestFloat =
    ## Big Int division

    let main = toInt[BiggestInt](a div b)
    if main.isNone:

      when not defined(pmathBigIntDanger):
        raise BigIntDanger.newException("Integer cannot be divded to a float as it is too big.")
      else:
        return 0.0
    let rem = toInt[BiggestInt](a mod b)
    let b = toInt[BiggestInt](b)
    if rem.isNone or b.isNone:

      when not defined(pmathBigIntDanger):
        raise BigIntDanger.newException("Integer cannot be divded to a float as it is too big.")
      else:
        return BiggestFloat(get(main))

    return BiggestFloat(get(main)) + (get(rem) / get(b))

    
    