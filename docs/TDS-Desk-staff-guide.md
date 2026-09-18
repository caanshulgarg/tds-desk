# TDS Desk — how to do a day's work
Garg Shekhar & Company · for build 54

## Before you start
1. **Open TDS Desk** on the computer where TallyPrime runs, and sign in with your email and password.
2. **Open the client's company in TallyPrime.** TDS Desk follows whatever is open there.
3. The top of the screen should show a green **● Open in Tally**. If it does not, see *When something is wrong* at the end.

---

## Purchase bills

### Uploading
Drag any number of bills onto the **Invoices** tab — PDFs, photos, scans, all at once. Each bill is filed under the client whose GSTIN it is billed to. Anything that matches no client waits in **Unsorted uploads**.

### Reviewing
- **More than one bill?** Press **Review all N in a table**: one row per bill with supplier, value, payment type, a TDS tick and the year-to-date position.
- **One bill at a time:** click it. Check the fields marked amber — those are the ones the app is unsure of.
- **Red box at the top?** Read it. It means one of:
  - *This is a proforma invoice / purchase order / quotation* — do not book it. Wait for the tax invoice.
  - *This bill is not made out to this client* — it was probably filed under the wrong client.

### TDS
- The tick **Deduct TDS on this bill** decides whether TDS is booked. The app ticks it when the limits are crossed.
- **Below the limits?** It stays unticked with the reason. Tick it yourself if you know the yearly limit will be crossed.
- **Not sure how much this supplier has been paid this year?** Press **Check … in Tally** under the limit bar. It reads what the client has already booked to that ledger this year and includes it in the test.
- Every ledger on the entry shows **✔** if it exists in Tally, or **Not in Tally** with suggestions.

### Approving and posting
1. **Approve** each bill (or **Approve all that are ready** in the table).
2. Go to **Send to Tally**.
3. Fix anything listed under *ledgers not in Tally* — choose the right ledger, or **Create in Tally**.
4. Press **Post to Tally**. Read the line that comes back: how many were posted and confirmed, how many were already there, and why any failed.

---

## Bank statements

### Uploading
Open the **Bank** tab and drop in the statement — Excel, CSV or PDF. The app reads the lines, checks the opening and closing balances, and files it under the right bank account.

### Getting the ledgers right, quickly
- **Rules do most of it.** Look at the **Rules** tab: press **Look for rules in what we have done before** and tick the ones that make sense. From then on those lines fill themselves in.
- **Make a rule from any line**: press **Rule** on that line. The app fills in the steady part of the description.
- **Search and set many at once:** type in the search box (for example *SWIGGY*), then use *set them all to …* and **Set all**.
- Only ledgers that exist in Tally are accepted. If one is missing, use **+ Create ledger** — it is created in Tally straight away.

### Posting
1. Check the **Ready** tab.
2. Press **Post to Tally** — or **Post** on a single line, or tick lines and post those.
3. **Before a big posting run,** if you want the app to look for entries already in Tally, use **⋯ → Check Tally for entries already there**. It is not automatic, because it makes Tally work hard and others are using it too.

---

## Sales invoices
- **Make one:** Sales tab → **New invoice**. Numbering follows the client's series.
- **Read one in:** drop the PDF; it is filed as sales when the seller GSTIN is the client's own.
- Post to Tally the same way as purchases.

---

## Things to remember
- **Nothing is posted without you.** The app prepares; a person presses Post.
- **Your choice always wins.** No rule or learning overwrites a ledger you set by hand.
- **Nothing is invented.** Ledgers come from Tally only.
- **Everything posted is checked.** After posting, the app reads the entry back from Tally. If it cannot find it, the entry is *not* marked as posted.
- **Optional vouchers.** If the client is set to post as Optional, entries do not show in Tally's Day Book. Find them at *Display More Reports → Exception Reports → Optional Vouchers*, and press Ctrl+L to make one regular.

---

## When something is wrong

| What you see | What to do |
|---|---|
| **Tally Bridge offline** | On the Tally computer, run *Start-TDS-Bridge.bat* and wait for **READY**. Then Settings → Tally Bridge → **Connect** |
| **Tally not connected — check** | Settings → Tally Bridge → **Check my Tally**. It says in plain words what is wrong |
| **"Ledger … does not exist"** | Open the bill, use the suggestion next to the ledger, or **Create in Tally** |
| **"not confirmed in Tally"** | The entry was not saved in Tally. Look in the Day Book and the Optional Vouchers list; if it is not there, post again |
| **Credit finished** | Tell the administrator to add credit. Work already in TDS Desk still opens, and entries can still be posted |
| **A bill will not read** | Use **Type it in**, and send the file to the administrator so the reading can be improved |

---

## Two habits worth keeping
1. **Work one client at a time**, with that client's company open in Tally.
2. **Post the same day you approve.** The longer entries wait, the more likely someone books them in Tally by hand as well.
