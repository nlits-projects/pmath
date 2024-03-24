## Template aliases for pnum and nim number

import types
# from ../pmath import `+`, `-`, `*`, `/`, `^`

template `+`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a + newPNum(b)

template `-`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a - newPNum(b)

template `*`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a * newPNum(b)

template `/`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a / newPNum(b)

template `^`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a ^ newPNum(b)