{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_addition (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/nurliyana/haskell/chapter14/addition/.stack-work/install/x86_64-osx/4d36b24e4111845ddb633eb0dcf938c03c11aa082a40098436187cd337ad7592/8.8.4/bin"
libdir     = "/Users/nurliyana/haskell/chapter14/addition/.stack-work/install/x86_64-osx/4d36b24e4111845ddb633eb0dcf938c03c11aa082a40098436187cd337ad7592/8.8.4/lib/x86_64-osx-ghc-8.8.4/addition-0.1.0.0-42ImAsvR477EtaAHY6j0ki"
dynlibdir  = "/Users/nurliyana/haskell/chapter14/addition/.stack-work/install/x86_64-osx/4d36b24e4111845ddb633eb0dcf938c03c11aa082a40098436187cd337ad7592/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/nurliyana/haskell/chapter14/addition/.stack-work/install/x86_64-osx/4d36b24e4111845ddb633eb0dcf938c03c11aa082a40098436187cd337ad7592/8.8.4/share/x86_64-osx-ghc-8.8.4/addition-0.1.0.0"
libexecdir = "/Users/nurliyana/haskell/chapter14/addition/.stack-work/install/x86_64-osx/4d36b24e4111845ddb633eb0dcf938c03c11aa082a40098436187cd337ad7592/8.8.4/libexec/x86_64-osx-ghc-8.8.4/addition-0.1.0.0"
sysconfdir = "/Users/nurliyana/haskell/chapter14/addition/.stack-work/install/x86_64-osx/4d36b24e4111845ddb633eb0dcf938c03c11aa082a40098436187cd337ad7592/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "addition_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "addition_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "addition_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "addition_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "addition_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "addition_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
