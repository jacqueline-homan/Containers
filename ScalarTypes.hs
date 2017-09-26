{-|
Module:             ExampleA
Description:        Example of a scalar parameterized type.
Copyright:          © 2017 All rights reserved.
License:            GPL-3
Maintainer:         Evan Cofsky <evan@drgonzo.local>
Stability:          experimental
Portability:        POSIX

A "Scalar" type is a type which has a single value. A number like 5,
or 7.9298, are scalars, for example. Now, in Haskell, we can also have
scalar types that have a "type parameter". This kind of type defines
an entire set of types, and then you can pick any specific one of them
by specifying the type in the parameter.

It's really close to defining a function in a lot of ways, and
thinking of it that way is a really good start. In fact, types with
parameters behave in very many ways like functions with parameters.
-}

module ScalarTypes where

-- *  Scalar Types

-- | So, first, a type with no parameters is a set of values. Like
-- Integers. Or Reals. Or Characters. There's no room for replacing
-- things. @a@ here has a type 'Char'. That's all it will ever be.
a :: Char
a = 'h'

-- | @i@ here is an Integer. Again, that's all it can be.
i :: Integer
i = 7

-- ** Mixing Scalars

-- | At the repl, after loading this module, try the following:
--
-- @
-- a + i
-- @
--
-- You should get a spectacular message, which when you really cut it
-- down, says "No, sorry, these types aren't the same".
--
-- Now, try this:
--
-- @
-- i + i
-- @
--
-- You should get something that actually makes sense.
--
-- And now, for even more fun, let's try adding two 'Char's together:
--
-- @
-- a + a
-- @
--
-- So some types support some functions, and others support
-- others. This is inherent in the type of the function. We'll get to
-- that in a bit.
