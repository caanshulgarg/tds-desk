# TDS Desk

Pre-Tally automation for Garg Shekhar & Company: reads purchase bills, bank statements and
sales invoices, applies TDS and GST rules, and posts the entries into TallyPrime.

## Open the app
- **Hosted:** https://caanshulgarg.github.io/tds-desk/ (this repository, GitHub Pages)
- **Offline copy:** download `index.html` and open it in Chrome or Edge. Everything works without internet,
  apart from the firm account and Claude reading.

## Tally Bridge (one file, one double-click)
Download **[bridge/Setup-TDS-Bridge.bat](bridge/Setup-TDS-Bridge.bat)** (click the file, then the
download button) and run it on the computer where TallyPrime runs. Press **I**. It installs itself,
starts, and starts again at every sign-in; no admin rights are needed. Press **R** in the same file
to remove it.

Then, in TDS Desk on that computer: **Settings → Tally Bridge → Connect**. It finds the bridge and
takes its key by itself. The app talks to it on http://127.0.0.1:9100, which never leaves the computer.

The other files in `bridge/` are only for doing it by hand; `bridge/README.txt` explains them.

## Firm account (shared data)
Staff sign in under **Settings → Firm account**. Clients, bills, bank statements and sales invoices
are then the same on every computer. Data lives in Supabase (project `tds-desk`, region Mumbai) and is
protected by row-level security: only members of the firm can read or write it.

`db/schema.sql` is the database as it stands.

## Releasing a new version
Replace `index.html` with the new build and commit. GitHub Pages publishes it within a minute.
Old versions stay in the commit history, so you can always go back.
