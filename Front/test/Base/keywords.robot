*Settings*
Documentation                   Keywords to use in tests
library                         Browser

*Keywords*
Start Session
    New Browser                 chromium                                    headless=False                  slowMo=00:00:01
    New Page                    https://yodapp.vercel.app/

End Session
    take Screenshot