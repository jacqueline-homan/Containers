{-|
Module:             ParameterizedTypes
Description:        Demonstrate a really simple parameterized type.
Copyright:          © 2017 All rights reserved.
License:            GPL-3
Maintainer:         Jacqueline Homan <evajacqueline@theunixman.com>
Stability:          experimental
Portability:        POSIX

This demonstrates the first steps to building up a parameterized sum
type. These are a bit more complex than scalar parameterized types,
since some of the branches might use the parameter, while others may
not.

However, even the parts of the sum that don't use the parameter to
hold a value /are still specialized to the type of the parameter/.
-}

module ParameterizedTypes where

-- * A simple parameterized sum type

-- | Hide 'Maybe' from Prelude so we use our own.
import Prelude hiding (Maybe(..))

-- | 'Maybe' is a type which takes a single type parameter.
--
-- It's the sum of two different sets of values.
--
-- 'Just' a  - this uses the type parameter, and so will have a
--             value of 'a' that can be unpacked with pattern
--             matching
--
-- 'Nothing' - this doesn't use the type parameter, and so will
--             not have a value of 'a'. However, the type of
--             any given 'Nothing' is still 'Maybe a'. And so
--             every 'Nothing' is different when the type of 'a'
--             is different, even though there's no actual 'a'
--             in Nothing.
data Maybe a = Nothing | Just a
    deriving (Show, Eq, Ord)

 
jbDay = Just "May 24"

evDay = Nothing

days = [jbDay, evDay]

-- | Now, in the repl, do this:
--
-- :load ParameterizedTypes.hs
--
-- Then:
--
-- :t jbDay
-- :t evDay
--
-- And see what the types are.

-- * Functions of parameterized types

-- | Is 'd' 'jbDay'?
isJbDay d = d == jbDay

-- And then do
--
-- :t isJbDay
-- :t isJbDay jbDay
-- :t isJbDay evDay
--
-- And then, for some real fun:
--
-- isJbDay jbDay
-- isJbDay evDay
