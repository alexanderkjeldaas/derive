{-
import Prelude

{-# EXAMPLE #-}

instance Enum (Sample a) where
    toEnum 0 = First{}
    toEnum 1 = Second{}
    toEnum 2 = Third{}
    toEnum n = error $ "toEnum " ++ show n ++ ", not defined for " ++ "Sample"

    fromEnum (First{}) = 0
    fromEnum (Second{}) = 1
    fromEnum (Third{}) = 2

-}
-- GENERATED START

module Data.Derive.Enum where

import Data.Derive.DSL.DSL
import Data.Derive.Internal.Derivation

dslEnum =
    List [Instance [] "Enum" (List [App "InsDecl" (List [App "FunBind"
    (List [Concat (List [MapCtor (App "Match" (List [App "Ident" (List
    [String "toEnum"]),List [App "PLit" (List [App "Int" (List [
    CtorIndex])])],App "Nothing" (List []),App "UnGuardedRhs" (List [
    App "RecConstr" (List [App "UnQual" (List [App "Ident" (List [
    CtorName])]),List []])]),App "BDecls" (List [List []])])),List [
    App "Match" (List [App "Ident" (List [String "toEnum"]),List [App
    "PVar" (List [App "Ident" (List [String "n"])])],App "Nothing" (
    List []),App "UnGuardedRhs" (List [Fold (App "InfixApp" (List [
    Tail,App "QVarOp" (List [App "UnQual" (List [App "Symbol" (List [
    String "++"])])]),Head])) (List [App "Lit" (List [App "String" (
    List [String "Sample"])]),App "Lit" (List [App "String" (List [
    String ", not defined for "])]),App "App" (List [App "Var" (List [
    App "UnQual" (List [App "Ident" (List [String "show"])])]),App
    "Var" (List [App "UnQual" (List [App "Ident" (List [String "n"])])
    ])]),App "InfixApp" (List [App "Var" (List [App "UnQual" (List [
    App "Ident" (List [String "error"])])]),App "QVarOp" (List [App
    "UnQual" (List [App "Symbol" (List [String "$"])])]),App "Lit" (
    List [App "String" (List [String "toEnum "])])])])]),App "BDecls"
    (List [List []])])]])])]),App "InsDecl" (List [App "FunBind" (List
    [MapCtor (App "Match" (List [App "Ident" (List [String "fromEnum"]
    ),List [App "PParen" (List [App "PRec" (List [App "UnQual" (List [
    App "Ident" (List [CtorName])]),List []])])],App "Nothing" (List [
    ]),App "UnGuardedRhs" (List [App "Lit" (List [App "Int" (List [
    CtorIndex])])]),App "BDecls" (List [List []])]))])])])]

makeEnum :: Derivation
makeEnum = derivationDSL "Enum" dslEnum

-- GENERATED STOP
