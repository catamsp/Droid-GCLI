<div align="center">

# 📱 Droid-GCLI: Gemini CLI for Android

![Termux](https://img.shields.io/badge/Termux-000000?style=for-the-badge&logo=termux&logoColor=white)   
![Node.js](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white)
![Gemini](https://img.shields.io/badge/Gemini-8E75B2?style=for-the-badge&logo=google-gemini&logoColor=white)
![Bash](https://img.shields.io/badge/Script-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

*Run Google's official [Gemini CLI](https://github.com/google-gemini/gemini-cli) seamlessly on your Android device using Termux.*

</div>

**Droid-GCLI** provides an automated, one-click setup script that handles all the heavy lifting—from installing dependencies to configuring tricky Android build environments—so you can start chatting with Gemini from your mobile terminal in minutes.

---

## ⚡ Features

- **Automated Setup:** No manual configuration of `node-gyp` or build dependencies.
- **Ready for Android:** Specifically tailored to work within the Termux environment.
- **Storage Access:** Automatically configures access to your device's internal storage.
- **Interactive UI:** Colorful output and built-in error handling during installation.

## 🚀 Installation

Open Termux and run the automated install command below. This script will install Node.js, configure build tools, install the CLI globally, and link your phone's storage.

```bash
curl -sL https://raw.githubusercontent.com/catamsp/Droid-GCLI/main/install.sh | bash
```

> ⚠️ **IMPORTANT:** Do **NOT** download Termux from the Google Play Store, as that version is no longer updated and is broken. Download it directly from **[F-Droid](https://f-droid.org/packages/com.termux/)** or the **[Termux GitHub](https://github.com/termux/termux-app/releases)**.

---

## 🛠️ Usage

After a successful installation, simply run the following command to start:

```bash
gemini
```

### 🔐 Authentication

You can use the Gemini CLI either by logging in with your Google Account or by providing an API key.

#### Method 1: Google Login (Recommended)
You don't need an API key to use the CLI! You can log in with your standard Google account for free-tier access. The CLI will provide an authentication link to open in your browser.

#### Method 2: API Key
If you prefer, you can use your Gemini API Key. Refer to the [official Gemini CLI documentation](https://github.com/google-gemini/gemini-cli) for more options and advanced configurations.

---

### 📂 Accessing Internal Storage & Files

During installation, the script automatically sets up your storage permissions. This creates a `~/storage` folder in your terminal that acts as a bridge to your phone's internal memory. 

Here is where your files live inside Termux:
- **Downloads:** `~/storage/downloads/`
- **Photos (Camera):** `~/storage/dcim/Camera/`
- **Documents:** `~/storage/shared/Documents/`



#### Working with Files in Gemini
You can pass one or multiple files directly from your phone into the Gemini prompt to have it analyze code, summarize documents, or look at images.

**For example - Analyze a single image:**
```bash
gemini "What is the subject of this photo?" ~/storage/dcim/Camera/photo.jpg
```
**For example - Summarize multiple documents at once:**
```bash
gemini "Summarize the key points from these files" ~/storage/downloads/notes.txt ~/storage/shared/Documents/report.md
```
---

### 🔄 Updating

To update the Gemini CLI to the latest version, run:

```bash
npm update -g @google/gemini-cli
```

To update your system packages, run `pkg update && pkg upgrade`.

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request or open an issue if you encounter any problems.

## 📄 License

This project is licensed under the [MIT License](LICENSE).
