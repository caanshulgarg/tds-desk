# Office automation → TDS Desk: the document inbox

A record of `kind = 'inbox'` in TDS Desk's `records` table says one thing: *a file arrived*.
TDS Desk reads it and owns the status after that.

## The Poster's only way in: a drop key
The Poster does **not** hold TDS Desk's service key. A service key bypasses row-level security,
so no policy could limit it. Instead it holds a **drop key** and calls two database functions that
enforce the limits themselves.

Make the key in TDS Desk as the firm owner: **Settings → Firm account → Document inbox → Make a key**.
It is shown once. Switch it off there at any time.

## 1. Add a waiting document — one call per document
```
POST https://nrtczucrlgalvtojwoes.supabase.co/rest/v1/rpc/post_inbox
apikey: sb_publishable_HMkVf1jl9iOA8Xt4YaUezg_--4cIWVR
Content-Type: application/json

{
  "p_key": "tdsd_…",
  "p_id": "c2fd4658-07ea-40bf-9e1e-685bf1749d7c",
  "p_client_id": "cmu6pv452bq51o",
  "p_data": {
    "id": "c2fd4658-07ea-40bf-9e1e-685bf1749d7c",
    "status": "waiting",
    "fileName": "Sales_HCPL_26-27_S1286 Garg Shekhar And Company.pdf",
    "fileHash": "56681e81a4f1f717d8d4",
    "mimeType": "application/pdf",
    "url": "https://…/storage/v1/object/sign/…",
    "urlExpiresAt": "2026-09-29T04:32:48.844Z",
    "filePath": "e8ddfaa5-…/unfiled/1a0c74006b3b3934/Sales_HCPL_….pdf",
    "docKind": "sales",
    "period": "",
    "sender": "ap.anshulgarg@gmail.com",
    "receivedAt": "2026-09-22T03:54:01Z",
    "sourceTicketRef": 17,
    "source": "office-automation",
    "createdAt": "2026-09-22T04:40:00.000Z",
    "entryId": null
  }
}
```
Replies:
- `{"ok": true, "inserted": true}` — added.
- `{"ok": true, "inserted": false}` — that id is already there. Re-posting is harmless.
- `{"ok": false, "error": "…"}` — refused, with the reason.

The firm comes from the key; the Poster never names it. The database refuses:
- a key that is wrong or switched off;
- any field not in the list above (no `x`, `snapshot`, ledgers, amounts or narration);
- a status other than `waiting`;
- a client that is not in the firm;
- a record without `fileName` and `url` (or `filePath`).

## 2. Refresh a link — only the link, only while waiting
```
POST https://nrtczucrlgalvtojwoes.supabase.co/rest/v1/rpc/refresh_inbox_link
apikey: sb_publishable_HMkVf1jl9iOA8Xt4YaUezg_--4cIWVR
Content-Type: application/json

{ "p_key": "tdsd_…", "p_id": "<intake uuid>", "p_url": "https://…", "p_expires_at": "2026-10-06T04:32:48Z" }
```
Changes `url` and `urlExpiresAt` and nothing else, and only while the record is still `waiting`.
Reply `{"ok": true, "updated": true|false}`.

## 3. What TDS Desk does
| Status | Set by | Meaning |
|---|---|---|
| `waiting` | Poster | not yet read; shown in the client's inbox |
| `read` | TDS Desk | entry created; `entryId` set |
| `ignored` | TDS Desk | covering letter, duplicate or not for entry; for a duplicate, `entryId` is the entry already made |

- Before reading, TDS Desk compares `fileHash` with the client's own hashes. A file already entered is marked
  `ignored` without being read or charged.
- `docKind` is treated as a hint only. The reader decides purchase or sales from the document itself.
  `docKind: "bank"` sends the file to the Bank tab.
- If `urlExpiresAt` has passed, staff see "Link expired, refreshing shortly" and cannot open it until the
  Poster refreshes the link.
- A failed read stays `waiting` (the reason is shown on screen only), so staff can try again.
- TDS Desk opens `url` directly and never calls office automation's `doc-url` endpoint. Its secret stays server-side.
