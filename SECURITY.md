# SECURITY — read before you run it

OpenClaw is powerful and that is the risk: by design it can read/write
files, run commands, and use the browser on this PC. Public trackers
have logged hundreds of CVEs naming OpenClaw — treat it like giving
a very capable employee a key, not like installing a chat app.

Minimum safe setup for this PC:

1. **Localhost only.** Gateway binds to 127.0.0.1:18789 with token auth
   (QuickStart does this). Never port-forward 18789, never bind it to
   the LAN/internet, no public tunnel for the dashboard.
2. **Local model first.** With Ollama as the brain, your prompts stay
   on this PC. If you later add a hosted model/API key, everything you
   ask that agent goes to that provider — that is your choice to make
   knowingly, on the PC.
3. **Dedicated Windows user (recommended).** If this PC holds banking /
   QuickBooks / personal files you do not want an agent near, install
   OpenClaw under a separate Windows user account with access only to
   the OVIA folders it needs.
4. **Skills are code.** Only use the two skills in this package and
   skills you have read first. Do not install random ClawHub skills
   unread — a skill runs with your permissions.
5. **Backups.** The agent's whole memory is files under its workspace
   and `~/.openclaw`. Back that folder up before updates
   (`openclaw --version` note + a copy of the folder).
6. **Updates.** Check `openclaw doctor` after updates; re-run
   3-check.ps1. If the Gateway ever answers on a non-localhost
   address, stop it (`openclaw gateway stop`) and fix the bind first.
