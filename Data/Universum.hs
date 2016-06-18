{-|
Module      : Universum
Description : A generator of values of an algebraic data type.
Copyright   : (c) Tomasz Obrębski, 2016
License     : GPL-2
Maintainer  : obrebski@amu.edu.pl
Stability   : experimental
Portability : POSIX

A generator of values of an algebraic data type.
-}

{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE RankNTypes #-}

module Data.Universum where

import Data.Data

-- |The 'universum' function generates a list of all values (terms) of
-- an algebraic data type. All (recursive) subterms must also belong
-- to an algebraic data type.
    
universum :: forall a . Data a => [a]
universum = xs
    where xs = concatMap (fromConstrM universum) (dataTypeConstrs (dataTypeOf (head xs)))
 -- where xs = concatMap (fromConstrM universum) (dataTypeConstrs (dataTypeOf (unList xs)))
       -- unList :: Data a => [a] -> a
       -- unList = undefined

