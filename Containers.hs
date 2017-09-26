{-|
Module:             Containers
Description:        Example of a type of one parameter.
Copyright:          © 2017 All rights reserved.
License:            GPL-3
Maintainer:         Jacqueline Homan <evan@drgonzo.local>
Stability:          experimental
Portability:        POSIX

Now, let's talk about types with a single type parameter. Without any
constraints (which again, we'll talk about later), and for now we'll
talk about types with no constraints on their variable, you have a
"Container".

What does this really mean though? It means you have a wrapper,
really. And you can define your own "wrapping" and "unwrapping"
functions.

-}

module Containers where

-- *  "Container" Types - Types of one variable

-- | So let's take a general type that just holds another type. This
-- is a type, 'Container', that can hold any "Scalar" type. Now, we're
-- talking about a set really that can contain any other set. A set of
-- sets.
data Container a = Container a

-- | Now, once you select a specific Scalar type for the variable,
-- you've defined a new Scalar type. For example, a 'Container' of an 'Integer':
type IntegerContainer = Container Integer

-- | And, now, a 'Container' of a 'Char':
type CharContainer = Container Char

-- | Now, once you've defined a new type, what can you do with it?
-- Well, the easiest thing is unpacking it:

unpackContainer (Container v) = v

-- | You can also pack a value in:
packContainer v = Container v

-- | So how to you do anything with a 'Container'? Like, what if you
-- wanted to show two containers had equal values? Well, you could
-- define the equals operator on 'Container' by making it an instance
-- of the set of things that support equality comparisons.
--
-- In Haskell, this is done with the typeclass 'Eq'. We'll talk about
-- typeclasses later. For now, just know that you can actually have
-- the compiler deal with that for you, as long as you also tell it
-- your container can only take values that support '(==)' too.
--
-- So the @(Eq a) =>@ is a "Constraint" on @a@, which says that if you
-- want to compare values of 'Container' @a@, the specific type inside
-- the "Container" also has to support '(==)'.
instance (Eq a) => Eq (Container a) where
    a == b = (unpackContainer a) == (unpackContainer b) 

-- | Now, we can do some cool things:

ci :: Container Integer
ci = packContainer 5

cj :: Container Integer
cj = packContainer 6

ca :: Container Char
ca = packContainer 'J'


cb :: Container Char
cb = packContainer 'H'

-- | Now, in the repl, type:
--
-- @
-- ci == ci
-- cj == cj
-- ci == cj
-- cj == ci
-- @
--
-- I mean that's a pretty thorough test of the possibilities.
