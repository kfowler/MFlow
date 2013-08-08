
module TestREST where
import MFlow.Wai.Blaze.Html.All
import Data.Monoid
import Data.String

-- 9 pages , each page has a restful link (page = ask)

-- to run it alone:
--main= runNavigation "" $ transientNav testREST


testREST= do
  setTimeouts 120 0

  addHeader header1

  option <- page $   wlink "a" << p << "letters " <++ p << "or"
                 <|> wlink "1" << p << "numbers"

  case option of
    "1" -> do
          page $ wlink "2" << contentFor "1"
          page $ wlink "3" << contentFor "2"
          page $ wlink "4" << contentFor "3"
          page $ wlink ()  << "menu"

    "a" -> do
          page $ wlink "b" << contentFor "a"
          page $ wlink "c" << contentFor "b"
          page $ wlink "d" << contentFor "c"
          page $ wlink ()  << "menu"


contentFor x=
        p << "page for"
        <> b << x
        <> p << "goto next page"

header1 h= html << body (text h)
  where
  text h= a ! href (fromString "http://haskell-web.blogspot.com.es/2013/07/the-web-navigation-monad.html")
            << "see this" <> hr <> h <> hr
          <> a ! href (fromString "/") << "main menu"
