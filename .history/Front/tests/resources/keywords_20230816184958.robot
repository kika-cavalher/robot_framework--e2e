*Settings*
Documentation                   Keywords to use in tests
library                         Browser
Library                         String

*Variables*
${BASE_URL}                     https://yodapp-testing.vercel.app/

*Keywords*
Start Session
    New Browser                 chromium                                    headless=False                slowMo=00:00:0
    New Page                    ${BASE_URL}

End Session
    take Screenshot


#slowMo=00:00:01
#chromium
#firefox
#webkit