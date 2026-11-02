cask "devbench" do
  version "0.1.1"

  name "DevBench"
  desc "Privacy-first browser developer tools (desktop app)"
  homepage "https://www.devbench.co.in"

  on_arm do
    sha256 "eca53cb0fbe61d0e91d2086fd6e3f4281f82dae158853a331a759435d2edbe69"
    url "https://github.com/SaiBhargavRallapalli/devbench/releases/download/v0.1.1/DevBench-0.1.1-arm64.dmg",
        verified: "github.com/SaiBhargavRallapalli/"
  end

  on_intel do
    sha256 "cce56f78f6adc38739d45ae577e5bc23a42d42344023dcb699460396880671dc"
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
