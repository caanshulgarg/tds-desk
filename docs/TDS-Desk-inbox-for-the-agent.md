# Sending documents into TDS Desk

The agent — or a WhatsApp or email bridge — can put files into a client's inbox in TDS Desk.
It does this with a **drop key**, not a login. A drop key can only add files: it cannot read clients,
entries or anything else, and it cannot post to Tally.

## 1. Get a key
In TDS Desk, as the firm owner: **Settings → Firm account → Document inbox → Make a key**.
Copy the key straight away; it is shown only once. Switch it off there at any time.

## 2. Send a file
```
POST https://nrtczucrlgalvtojwoes.supabase.co/functions/v1/inbox-drop
X-Drop-Key: tdsd_…
Content-Type: application/json

{
  "client_gstin": "09AAAAA0000A1Z5",
  "file_name": "bill.pdf",
  "file_base64": "<the file, base64>",
  "doc_type": "bill",
  "source": "WhatsApp",
  "sender": "Client accountant",
  "note": "September purchase bills"
}
```

| Field | Meaning |
|---|---|
| `client_gstin` | the client's GSTIN — the most reliable way to name the client |
| `client_name` | use instead of the GSTIN if needed; must match the client's name in TDS Desk exactly (spaces and case do not matter) |
| `client_id` | TDS Desk's own client id, if known |
| `file_name` | shown in the inbox |
| `file_base64` | the file itself; PDF, JPG, PNG, Excel or CSV; up to 20 MB |
| `doc_type` | `bill`, `bank`, `sales` or `auto` (auto lets TDS Desk decide) |
| `source`, `sender`, `note` | shown to staff beside the file |

**The reply** names where the file went:
```
{"ok": true, "id": "…", "client_name": "Srishti Enterprises", "waiting_in": "the inbox of Srishti Enterprises"}
```
If no client matches, the file waits under **Unsorted uploads**, where staff assign it in one step.

## 3. What happens next
Staff see **📥 N** beside the client and an **Inbox** panel at the top of the client's Invoices tab.
**Read all** passes the files through the same reading as an upload — free reading first, then OCR,
the same checks — and charges the same credit. Each inbox item is marked *done* with the entry it
produced, or *failed* with the reason.

## Rules for the agent
1. One file per call. A PDF with many bills can go as one file; staff can tick *read each page as a separate bill*.
2. Always send `client_gstin` when you know it.
3. Do not resend a file that was accepted. The same file sent twice is recognised as a duplicate when read.
4. If the reply is not `"ok": true`, do not retry more than twice; report the error.
