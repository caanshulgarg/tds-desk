# TDS rates in TDS Desk — checked against the law for FY 2026-27
Garg Shekhar & Company · reviewed 18 September 2026

## What the app applies today, and whether it is right

| Payment type | App rate | App limit | Law FY 2026-27 | Verdict |
|---|---|---|---|---|
| Contractor / job work / manpower | 1% individual, 2% others | ₹30,000 single · ₹1,00,000 year | 1% / 2%, ₹30,000 single, ₹1,00,000 aggregate | **correct** |
| Professional fees | 10% | ₹50,000 year | 10%, ₹50,000 | **correct** |
| Technical services | 2% | ₹50,000 year | 2%, ₹50,000 | **correct** |
| Director fees / sitting fees | 10% | no limit | 10%, no threshold | **correct** |
| Commission / brokerage | 2% | ₹20,000 year | 2%, ₹20,000 | **correct** |
| Rent — land, building, furniture | 10% | ₹50,000 **a month** | 10%, ₹50,000 per month | **correct** |
| Rent — plant and machinery | 2% | ₹50,000 **a month** | 2%, ₹50,000 per month | **correct** |
| Interest (non-bank) | 10% | ₹10,000 year | 10%, ₹10,000 | **correct** |
| Purchase of goods | 0.1% | ₹50,00,000 year | 0.1% above ₹50 lakh per seller | **correct** |
| No PAN | 20% | — | 20% | **correct**, with one exception below |

The section references the app prints — for example *393(1) Sl. 6(i)* for contractors and *393(1) Sl. 6(iii)* for professional and technical fees — match the Income-tax Act 2025, which replaced the 194-series for payments made on or after 1 April 2026.

## Five things the app does not yet handle

1. ~~No PAN on a purchase of goods~~ — **checked, already correct**: the app deducts 5% for goods and 20% elsewhere.
2. ~~The transporter exemption~~ — **now built** (build 55): a tick on the deductee, *ten or fewer goods carriages, declaration and PAN on file*, which switches off TDS on contract payments and records the reason.
3. ~~Whether the client must deduct at all~~ — **now built** (build 55): a client setting *This client has to deduct TDS*, with the turnover test written beside it.
4. **Payment types not in the list:** dividend (10%, ₹10,000), bank interest (₹50,000, or ₹1,00,000 for senior citizens), insurance commission (2%, ₹20,000), purchase of immovable property (1% at ₹50 lakh and above), rent paid by an individual or HUF not under audit (2%, ₹50,000 a month), and payments by an individual above ₹50 lakh.
5. **Bills dated before 1 April 2026.** Those fall under the old 194-series for reporting. The app labels everything with the new section, which is right for this year's bills but wrong for older ones.

## What is left
1. The extra payment types (dividend, bank interest, insurance commission, property, rent by a non-audited individual), when a client actually needs one.
2. Old 194-series labels for bills dated before 1 April 2026, if you have to report any.

Everything else in this note has been built and tested: goods without PAN deducts at 5%, a transporter's declaration switches TDS off with the reason recorded, and a client who need not deduct shows no TDS at all — while still showing what the TDS would have been.

## Checked against
Income-tax Act 2025, section 393 (in force for payments from 1 April 2026), and published FY 2026-27 rate charts. Rates and thresholds were retained when the Act was renumbered; the changes of April 2025 — contractor aggregate to ₹1,00,000, professional and technical to ₹50,000, commission to ₹20,000, rent to ₹50,000 a month, interest to ₹10,000 — are all already reflected in the app.

**Caution:** this is a desk review against published charts. Before the quarterly return, check anything unusual against the Act itself.
