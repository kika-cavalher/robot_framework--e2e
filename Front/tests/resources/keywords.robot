*Settings*
Documentation                   Keywords to use in tests
library                         Browser
Library                         String

*Keywords*
Start Session
    New Browser                 chromium                                    headless=False
    New Page                    https://yodapp.vercel.app/

End Session
    take Screenshot


#slowMo=00:00:01