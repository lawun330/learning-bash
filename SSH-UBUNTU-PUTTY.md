# SSH and PuTTY Setups for Ubuntu VM (with VirtualBox) on Windows

This guide covers how to set up SSH and PuTTY to connect to an Ubuntu VM running inside VirtualBox on a Windows host.
It also explains how to configure port forwarding and clipboard sharing for seamless interaction between the VM and the Windows machine.

---

# 1. Set Up SSH on the Ubuntu VM

SSH provides secure and efficient remote access to the Ubuntu VM for command-line management without the need for a graphical interface.

## Step 1: Configure Port Forwarding in VirtualBox

Since NAT is being used for networking on the VM, port forwarding must be set up to allow SSH connections from the Windows host to the VM.
In VirtualBox:
1. Select the Ubuntu VM.
2. Click Settings.
3. Go to Network → Adapter 1 (should be set to NAT).
4. Click Advanced → Port Forwarding.
5. Click the + icon to add a new rule.
    - **Name**: SSH
    - **Protocol**: TCP
    - **Host IP**: (leave blank)
    - **Host Port**: 2222 (or any free port)
    - **Guest IP**: (leave blank)
    - **Guest Port**: 22 (the default SSH port)
6. Click OK to save the rule.

## Step 2: Start the Ubuntu VM

## Step 3: Check if SSH is Running

Inside the Ubuntu VM, run:
```bash
sudo systemctl status ssh
```
_This checks whether the SSH service is already running. If inactive, it will need to be started manually._

## Step 4: Start SSH if Not Running

If SSH isn't running, start it with:
```bash
sudo systemctl start ssh
```
_This will activate the SSH service, allowing remote connections to the Ubuntu VM._

## Step 5: Find the VM's IP Address

Inside the Ubuntu VM, run:
```bash
ip a
```
_This command will display the network interfaces and IP addresses. Look for an IP address, something like `192.168.x.x` or `10.0.x.x`._

## Step 6: Connect to Ubuntu VM via SSH Using Windows

Once the port forwarding is set up, SSH can be used to connect to the VM from the Windows machine using PowerShell, Terminal, or cmd. 
Run:
```bash
# Replace yourusername with the actual username of the Ubuntu VM
ssh yourusername@localhost -p 2222
```
_This command connects to port `2222` on `localhost`, which VirtualBox forwards to port `22` on the Ubuntu VM._

## Step 7 (Optional): Set Up SSH Connection Automatically Using PuTTY

For more convenience, PuTTY can be used to establish an SSH connection without having to type the command every time.

1. Open PuTTY and enter localhost for the Host Name (or IP address) and 2222 for the Port (as configured in the port forwarding settings).
2. In the Connection type section, select SSH.
3. Under the Category menu on the left, go to Session.
4. Optionally, save the session for future use by typing a name (e.g., Ubuntu_VM) in the Saved Sessions box, then click Save.
5. Click Open to initiate the SSH connection.

_The saved session can be used to quickly open the SSH connection without manually entering the command each time._

---

# 2. Share Clipboard Between Ubuntu VM and Windows Host 

To share text and clipboard contents between the Ubuntu VM and Windows host, the Shared Clipboard feature needs to be enabled.

## Step 1: Configure Shared Clipboard in VirtualBox

In VirtualBox:
1. Select the Ubuntu VM.
2. Click Settings.
3. Go to General → Advanced.
4. Set Shared Clipboard to Bidirectional.

_This allows copying and pasting both ways (from Windows to Ubuntu and vice versa)._

## Step 2: Check if Clipboard Sharing is Running

Inside the Ubuntu VM, run:
```bash
ps aux | grep VBoxClient
```
_This command checks if `VBoxClient` is running, which handles clipboard sharing._

## Step 3: Start Clipboard Sharing if Not Running

If it's not running, start it manually by running:
```bash
VBoxClient --clipboard
```
_This starts the `VBoxClient` service, enabling clipboard sharing between the VM and the Windows host._

---

# 3. Use Xorg Instead Of Wayland

To improve compatibility with certain applications and features in the Ubuntu VM, it's recommended to use Xorg instead of Wayland. Here's how to switch to Xorg:

## Step 1: Disable Auto Login

1. Open Settings on the Ubuntu VM.
2. Go to Users.
3. Disable the Automatic Login feature.

_This will allow the option to choose the session type during login._

## Step 2: Reboot and Choose User

Reboot the Ubuntu VM. At the login screen, click on the user account to start the login process.

## Step 3: Choose Session Option

Before entering the password, click on the Settings icon (gear icon) at the bottom right of the login screen. This will allow you to select the session type.
Choose "Ubuntu on Xorg".

_This will switch from Wayland to Xorg for the current session._
