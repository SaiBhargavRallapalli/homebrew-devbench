cask "devbench" do
  version "0.1.0"

  name "DevBench"
  desc "Privacy-first browser developer tools (desktop app)"
  homepage "https://www.devbench.co.in"

  on_arm do
    sha256 "13f715395f08f2a97540f0916a7d9ad5f633d802bfd36f9996dde390a72ee327"
    url "https://github.com/SaiBhargavRallapalli/devbench/releases/download/v0.1.0/DevBench-0.1.0-arm64.dmg",
        verified: "github.com/SaiBhargavRallapalli/"
  end

  on_intel do
    sha256 "3d01e9925545da9471381ad04bfcdadae6893777a137de69f0a31127ab77322e"
    url "https://github.com/SaiBhargavRallapalli/devbench/releases/download/v0.1.0/DevBench-0.1.0-x64.dmg",
        verified: "github.com/SaiBhargavRallapalli/"
  end

  app "DevBench.app"

  zap trash: [
    "~/Library/Application Support/devbench-desktop",
    "~/Library/Caches/co.in.devbench.desktop",
    "~/Library/Caches/devbench-desktop-updater",
    "~/Library/Logs/devbench-desktop",
    "~/Library/Preferences/co.in.devbench.desktop.plist",
    "~/Library/Saved Application State/co.in.devbench.desktop.savedState",
  ]
end
