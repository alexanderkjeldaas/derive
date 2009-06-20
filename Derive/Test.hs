
module Derive.Test(test) where

import Derive.Utils
import Language.Haskell.Exts
import Data.Derive.DSL.HSE
import Data.DeriveDSL
import Control.Monad
import Data.Maybe
import System.FilePath
import System.Directory
import Data.Char
import Data.Derive.All
import Data.Derive.Internal.Derivation



listType :: Decl
listType = DataDecl sl DataType [] (Ident "[]") [Ident "a"]
    [QualConDecl sl [] [] (ConDecl (Ident "[]") [])
    ,QualConDecl sl [] [] (ConDecl (Ident "Cons")
        [UnBangedTy (TyVar (Ident "a"))
        ,UnBangedTy (TyApp (TyCon (UnQual (Ident "List"))) (TyVar (Ident "a")))])]
    []


-- test each derivation
test :: IO ()
test = do
    types <- readHSE "Data/Derive/All.hs"
    types <- return $ ("[]",listType) : [(prettyPrint name, t) | t@(DataDecl _ _ _ name _ _ _) <- moduleDecls types]
    mapM_ (testFile types) derivations


testFile :: [(String,Decl)] -> (String, Derivation) -> IO ()
testFile types (name,d) = do
    putStrLn $ "Testing " ++ name
    src <- readSrc $ "Data/Derive/" ++ name ++ ".hs"
    forM_ (srcTest src) $ \(typ,res) -> do
        let Right r = derivationDeriver d (fromMaybe (error $ "wanting type: " ++ typ) $ lookup typ types)
        when (not $ r `outEq` res) $
            error $ "Results don't match!\nExpected:\n" ++ showOut res ++ "\nGot:\n" ++ showOut r

