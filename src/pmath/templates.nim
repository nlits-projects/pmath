## Template aliases for pnum and nim number

import core/types
# from ../pmath import `+`, `-`, `*`, `/`, `^`

template `+`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a + newPNum(b)

template `-`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a - newPNum(b)

template `*`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a * newPNum(b)

template `/`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a / newPNum(b)

template `^`*(a: PNum, b: SomeNumber): untyped {.dirty.} = a ^ newPNum(b)