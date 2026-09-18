TDS Desk - Tally Bridge 1.4.2
Garg Shekhar & Company

WHAT IT DOES
The bridge runs on the computer where TallyPrime runs (your cloud server). It lets
TDS Desk, opened in a browser on that same computer, talk to Tally:
  - see which companies are open in Tally, and follow the open company
  - load each company's ledgers and groups (no more exporting ledger lists)
  - read the bank ledger's vouchers, so entries already in Tally are not posted twice
  - check bills already booked (same bill number and party)
  - post new ledgers and vouchers, one by one, with Tally's reply for each
It listens only on this computer (127.0.0.1) and needs a secret key. Nothing is
opened to the internet. It needs no installation and no administrator rights.

WHAT YOU NEED
  - Windows with TallyPrime (Windows PowerShell 5.1 is built in).
  - TDS Desk as the downloaded file (TDS-Desk-standalone.html), opened in Chrome or
    Edge on the same computer. Pages opened on claude.ai cannot reach this computer.

SET-UP (once per Windows user that runs Tally)
1. Copy this folder to the server, for example C:\TDS-Bridge
   (right-click the zip > Properties > Unblock, then extract).
2. In TallyPrime: F1 Help > Settings > Connectivity >
     "TallyPrime acts as" = Both   and   Port = 9000
   Restart TallyPrime if it asks.
3. Double-click Start-TDS-Bridge.bat. A window opens showing:
     Address : http://127.0.0.1:9100
     Key     : (a long code)
   Keep the window open while you work.
4. Open TDS Desk (the downloaded file) > Settings > Tally Bridge.
   Paste the key and press Connect. The companies open in Tally are listed;
   link any that TDS Desk does not recognise to the right client.
5. Optional: to start the bridge hidden at every sign-in, run
     powershell -ExecutionPolicy Bypass -File Install-AutoStart.ps1
   (Remove-AutoStart.ps1 undoes it; Show-Key.bat shows the key again.)

IMPORTANT: ONE PORT PER TALLY
Windows lets only one program use a port. If two users' TallyPrime are both set to
port 9000, only the first one started works; the other silently accepts no
connections. Give every user's TallyPrime its own port (9000, 9001, 9002, ...).
The bridge checks this for you: its window, and TDS Desk > Settings > Tally Bridge >
"Check my Tally", say exactly what is wrong, whose Tally holds the port, and which
free port to use.

SEVERAL PEOPLE ON ONE SERVER
Each Windows session runs its own TallyPrime, and all of them can be reached inside
the server. The bridge therefore:
  - finds the TallyPrime programs that are running and uses only the one in YOUR
    Windows session (other users' Tally is listed as "Another user - not used");
  - never guesses: if the same company is open in two Tally sessions it cannot tell
    apart, it stops and asks you to choose;
  - lets you pin your Tally: TDS Desk > Settings > Tally Bridge > "Use this Tally".
Each user runs their own bridge. Give each a different "Port" in
tds-bridge.config.json (9100, 9101, ...) and use that address in their TDS Desk.
To force particular Tally ports, set "TallyPorts": [9001] (a list) instead of "auto".

SETTINGS (tds-bridge.config.json, created on first start)
  Port             address of the bridge on this computer (default 9100)
  TallyPorts       "auto" (default): find your own running TallyPrime;
                   or a list of ports, e.g. [9001], to use only those
  OnlyMySession    true (default): never use another Windows user's Tally
  FallbackPorts    ports tried when Windows cannot say which Tally is yours
  TallyTimeoutSec  how long to wait for Tally (default 120)
  Key              the secret key; delete the line and restart to get a new one
  AllowImport      false = read-only (nothing is ever posted to Tally)
  LogFile          where the bridge writes what it did

SAFETY
  - Every entry is read back from Tally after posting (voucher list, then Day Book).
    TDS Desk marks it as posted only when Tally really has it. If Tally says
    "created" but the entry cannot be found, it stays waiting as "not confirmed".
  - The log (tds-bridge.log) records Tally's exact reply and the read-back result
    for every entry. TDS Desk > Settings > Tally Bridge > "Test reading entries"
    shows which ways of reading work on your Tally.
  - OPTIONAL VOUCHERS: if the client is set to post bills/sales as Optional, Tally
    does NOT show them in the Day Book. Find them in TallyPrime:
      Display More Reports > Exception Reports > Optional Vouchers
    Open one and press Ctrl+L to make it a regular entry.
  - Entries are posted as Optional vouchers if that is set for the client in TDS Desk.
  - Posting always happens into the company named in the request; if that company
    is not open in Tally, nothing is posted.
  - Every post is written to tds-bridge.log.

TROUBLESHOOTING
  The bridge window must show "READY". Everything it shows is also written to
  tds-bridge-console.txt in this folder; if the bridge stops ("BRIDGE STOPPED"),
  send that file.
  "The Tally Bridge is not running on this computer" in TDS Desk:
     1. start Start-TDS-Bridge.bat and wait for READY;
     2. open http://127.0.0.1:9100/ping in the same browser as TDS Desk;
     3. if that page cannot be reached, TDS Desk is open on a different computer:
        open the TDS Desk file inside the server session where Tally runs.
  First look at "Check my Tally" in TDS Desk (or the CHECK lines in the bridge
  window): it names the problem and the fix.
  "Tally is not answering"      Tally is closed, or step 2 is not done.
  "port 9000 is already taken"  another user's TallyPrime has that port: set a
                                different port in YOUR TallyPrime and restart it.
  "not running in your login"   start the bridge from the same Windows login as
                                your TallyPrime.
  "Wrong Tally was used"        TDS Desk > Settings > Tally Bridge > "Use this Tally"
                                on your own Tally (or set "TallyPorts": [your port]).
  "open in more than one Tally" the same company is open in two Tally sessions:
                                choose yours with "Use this Tally".
  Old settings file             a file from bridge 1.0 has "TallyPorts": [9000, ...];
                                change it to "TallyPorts": "auto" to use detection.
  "Company ... is not open"     open that company in TallyPrime.
  "Wrong bridge key"            run Show-Key.bat and paste the key again.
  "Could not start on port"     the bridge is already running (check the tray/Task
                                Manager), or change "Port" in the settings file.
  PowerShell blocks the script  use the .bat file, or run:
                                powershell -ExecutionPolicy Bypass -File TDSBridge.ps1
