{-|
Module:             Example1
Description:        Demonstrate a really simple parameterized type.
Copyright:          © 2017 All rights reserved.
License:            GPL-3
Maintainer:         Evan Cofsky <evan@theunixman.com>
Stability:          experimental
Portability:        POSIX

This demonstrates the first steps to building up a parameterized sum
type. These are a bit more complex than scalar parameterized types,
since some of the branches might use the parameter, while others may
not.

However, even the parts of the sum that don't use the parameter to
hold a value /are still specialized to the type of the parameter/.
-}

module Example2 where

-- | Hide 'Maybe' from Prelude so we use our own.
import Prelude hiding (Maybe(..))

data Maybe a = Nothing | Just a
    deriving (Show, Eq, Ord)

jbDay :: Maybe String
jbDay = Just "J's Natal Observance Day: May 24"

-- | Here, we're actually specializing evDay to 'Maybe' 'String'.
evDay :: Maybe String
evDay = Nothing

days :: [Maybe String]
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
--
-- How is the type of 'evDay' different from 'Example1'?

-- * Functions of parameterized types

-- | Is 'd' 'jbDay'?
isJbDay :: Maybe String -> Bool
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
-- isJbDay Nothing
