cask "devbench" do
  version "0.1.1"

  name "DevBench"
  desc "Privacy-first browser developer tools (desktop app)"
  homepage "https://www.devbench.co.in"

  on_arm do
    sha256 "eb465b37b5f60f8d80ed982faba244e4746f102bf4875edb8e485aac94aa4236"
    url "https://github.com/SaiBhargavRallapalli/devbench/releases/download/v0.1.1/DevBench-0.1.1-arm64.dmg",
        verified: "github.com/SaiBhargavRallapalli/"
  end

  on_intel do
    sha256 "e4a77cc639347004c0a31f83e23c39b74d1da3270144df88144ae9077c8ccead"
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
