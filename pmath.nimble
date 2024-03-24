# Package

version       = "0.1.1"
author        = "thatrandomperson5"
description   = "library that resolves the inaccuracies of normal float math. "
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.0.0"
when (compiles do: import bigints): # For testing
  requires "bigints >= 1.0.0"