# AnyDesk — what happened, and what to use instead

## What happened (verified Nov 15, 2026)

AnyDesk worked between the cloud assistant and this PC a few days ago.
It stopped because the cloud machine was rebuilt and its internet now
goes through a security filter that re-stamps secure connections
(certificate issuer "a sandbox egress CA"). AnyDesk refuses
connections stamped like that (error ssl_a00010b) and stays offline.
It is not your PC, not your AnyDesk, and not a setting either side
can change. The AnyDesk web client was the next try — same problem
class, do not count on it.

## The fix that removes the problem

**A local agent (this package).** OpenClaw runs on this PC, so the
agent doing PC work is already inside the machine. No remote hop,
no AnyDesk, no filter. This is the primary route now.

## If a human / the cloud assistant still needs eyes on this PC

In order of reliability (all free, noted with the owner back on Nov 8):

1. **Chrome Remote Desktop** — Google's, runs through the browser,
   one-time code from this PC, code dies after one use. Best
   AnyDesk replacement for a one-off session.
2. **RustDesk** — free, open source, no ~15-minute free-licence cuts
   (AnyDesk's free tier cut sessions repeatedly on Nov 8–9).
3. **Tailscale + Windows Remote Desktop** — most solid for repeat
   access, no time limits, but it is a setup project, not a one-off.

AnyDesk itself still works fine between two normal computers —
it is only the cloud-VM side that is blocked.
