TDS Desk - Tally Bridge 1.7.3
Garg Shekhar & Company

THE EASY WAY (recommended)
  1. Copy Setup-TDS-Bridge.bat to the computer where TallyPrime runs.
     (Right-click the file > Properties > Unblock, if Windows asks.)
  2. Double-click it and press I.
     It installs itself, starts, and starts again every time you sign in.
     Nothing is installed into Windows and no admin rights are needed.
  3. In TallyPrime: F1 Help > Settings > Connectivity >
       "TallyPrime acts as" = Both        Port = 9000
     (If two people share the server, each Tally needs its own port: 9000, 9001, ...)
  4. Open TDS Desk on that same computer > Settings > Tally Bridge > press Connect.
     TDS Desk finds the bridge and takes its key by itself - nothing to copy.

  To remove it: run Setup-TDS-Bridge.bat again and press R.
  To watch what it is doing: open
     %LOCALAPPDATA%\TDS Desk Bridge\Show bridge window.bat

WHAT IT DOES
  The bridge lets TDS Desk talk to TallyPrime on the same computer:
    - it follows the company open in Tally
    - it loads that company's ledgers and groups
    - it reads the bank ledger, so entries already in Tally are not posted twice
    - it posts new ledgers and vouchers, and reads each one back to confirm it
  It listens only on this computer (127.0.0.1) and needs a secret key.
  Nothing is opened to the internet.

THE OTHER FILES (only if you prefer to do it by hand)
  TDSBridge.ps1          the bridge itself
  Start-TDS-Bridge.bat   runs it in a visible window
  Show-Key.bat           shows the key and address
  Install-AutoStart.ps1  starts it hidden at sign-in
  Remove-AutoStart.ps1   undoes that

IF SOMETHING IS WRONG
  In TDS Desk: Settings > Tally Bridge > "Check my Tally" says in plain words what
  stops the connection (Tally not running, port taken by another user's Tally,
  "TallyPrime acts as" not set to Both, and so on). "Test reading entries" shows
  which ways of reading work on your Tally.
  The bridge writes everything it shows to tds-bridge-console.txt, and what it did
  to tds-bridge.log, both in %LOCALAPPDATA%\TDS Desk Bridge.

SETTINGS (tds-bridge.config.json, created on first start)
  Port             address of the bridge on this computer (default 9100)
  TallyPorts       "auto" (default): find your own running TallyPrime
  OnlyMySession    true (default): never use another Windows user's Tally
  PairWindowMin    minutes after start during which TDS Desk on this computer
                   may take the key by itself (default 15)
  TallyTimeoutSec  how long to wait for Tally (default 120)
  AllowImport      false = read-only; nothing is ever posted to Tally
  Key              the secret key; delete the line and restart for a new one
