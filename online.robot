*Settings*
library                     Browser

Documentation               Suite to check if app is online

*Test Cases*
Must be online
    New Browser             chromium                                    headless=False                  slowMo=00:00:05
    New Page                https://yodapp.vercel.app/
    Get Title               equal                                       Yodapp | QAninja
    take Screenshot