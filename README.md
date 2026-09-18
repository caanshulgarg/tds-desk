# TDS Desk

Pre-Tally automation for Garg Shekhar & Company: reads purchase bills, bank statements and
sales invoices, applies TDS and GST rules, and posts the entries into TallyPrime.

## Open the app
- **Hosted:** https://caanshulgarg.github.io/tds-desk/ (this repository, GitHub Pages)
- **Offline copy:** download `index.html` and open it in Chrome or Edge. Everything works without internet,
  apart from the firm account and Claude reading.

## Tally Bridge
`bridge/` holds the program that connects the app to TallyPrime on the Tally computer.
See `bridge/README.txt` for setup. The app talks to it on http://127.0.0.1:9100.

## Firm account (shared data)
Staff sign in under **Settings → Firm account**. Clients, bills, bank statements and sales invoices
are then the same on every computer. Data lives in Supabase (project `tds-desk`, region Mumbai) and is
protected by row-level security: only members of the firm can read or write it.

`db/schema.sql` is the database as it stands.

## Releasing a new version
Replace `index.html` with the new build and commit. GitHub Pages publishes it within a minute.
Old versions stay in the commit history, so you can always go back.
