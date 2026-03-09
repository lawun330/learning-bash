# SSH Key Setup Guide for GitHub & Windows (PowerShell)

This guide covers generating an SSH key, adding it to the SSH agent, and connecting it to GitHub. Think of SSH keys as a **lock and key system**:
- the **private key** is the key that opens doors, and
- the **public key** is the lock installed on services like GitHub.

---

## 1. Check for Existing Keys

Check for existing keys to avoid overwriting old ones.

_This step is similar to looking inside a key drawer before creating a new key, ensuring no important keys are accidentally replaced._

```powershell
ls ~/.ssh
```

---

## 2. Generate a New ED25519 Key

Create a new, strong SSH key with a descriptive label (for example, an email).

_This produces a unique "lock" and "key" pair, similar to cutting a brand-new house key and matching lock._

```powershell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

---

## 3. Save to Default Location

Press Enter when prompted to save the key to the default location such as `~/.ssh/id_ed25519`.

_This step is similar to placing the key in the standard key cabinet where security systems expect to find it._

---

## 4. Set an Optional Passphrase

Add a passphrase for extra protection.

_This functions as an additional "safety pin" on the key, meaning the key cannot be used unless the safety is removed._

---

## 5. Ensure SSH-Agent Starts Automatically

The SSH agent can hold the key in memory, avoiding repeated passphrase entry. Set this service to start automatically with Windows.

_This step is similar to hiring a "security guard" to hold the key so the key does not need to be carried around constantly._

```powershell
Get-Service ssh-agent | Set-Service -StartupType Automatic
```

---

## 6. Start SSH-Agent

Start the SSH-agent service immediately.

_The security guard clocks in for work right now and begins holding keys._

```powershell
Start-Service ssh-agent
```

---

## 7. Add the Private Key to the Agent

Link the private key to the agent to avoid typing the passphrase every time.

_This is similar to handing the key to the security guard, who then unlocks doors when needed._

```powershell
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```

---

## 8. Display the Public Key

Display the public key, which acts as the lock.

_This is similar to showing the lock design that will be installed on a door so the correct key can open it._

```powershell
Get-Content ~/.ssh/id_ed25519.pub
```

---

## 9. Add the Key to GitHub

Go to `GitHub → Settings → SSH and GPG keys → New SSH key` and paste the public key.

_This installs the lock on GitHub's digital front door, allowing the matching private key to open it._

---

## 10. Verify Connection

Test the connection to GitHub to confirm the key works correctly.

_This acts as walking up to the door and testing whether the key actually opens the installed lock._

```powershell
ssh -T git@github.com
```

---

A success message confirms the SSH key setup is complete and functional.
