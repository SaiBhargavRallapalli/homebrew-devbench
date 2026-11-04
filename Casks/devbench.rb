cask "devbench" do
  version "0.1.1"

  name "DevBench"
  desc "Privacy-first browser developer tools (desktop app)"
  homepage "https://www.devbench.co.in"

  on_arm do
    sha256 "7de25d83a79a27eb2ddf13e215d6f1cd4cf6ec255784081b9dd19b31be9096fe"
    url "https://github.com/SaiBhargavRallapalli/devbench/releases/download/v0.1.1/DevBench-0.1.1-arm64.dmg",
        verified: "github.com/SaiBhargavRallapalli/"
  end

  on_intel do
    sha256 "49a51927af50b29b11ceee818ace8a8c6515047561a492ac9198f192ffcf1e1d"
    url "https://github.com/SaiBhargavRallapalli/devbench/releases/download/v0.1.1/DevBench-0.1.1-x64.dmg",
        verified: "github.com/SaiBhargavRallapalli/"
  end

  app "DevBench.app"

  postflight do
    # Clear download quarantine so Gatekeeper does not show "app is damaged".
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/DevBench.app"],
                   print_stderr: false
  end

  zap trash: [
    "~/Library/Application Support/devbench-desktop",
    "~/Library/Caches/co.in.devbench.desktop",
    "~/Library/Caches/devbench-desktop-updater",
    "~/Library/Logs/devbench-desktop",
    "~/Library/Preferences/co.in.devbench.desktop.plist",
    "~/Library/Saved Application State/co.in.devbench.desktop.savedState",
  ]
end
