cask "devbench" do
  version "0.1.0"

  name "DevBench"
  desc "Privacy-first browser developer tools (desktop app)"
  homepage "https://www.devbench.co.in"

  on_arm do
    sha256 "6d62490833f6a8a83e8d1a45e74813584e956b50a1181172e1c8c8367f49429b"
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
