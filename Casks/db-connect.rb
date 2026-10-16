cask "db-connect" do
  version "3.6.0"
  sha256 "d0e01700a0ecfb6acffecd5c19136f64a8f4047e9df5b78fbee5e068114762f0"

  url "https://github.com/shubhesh07/db-connect/releases/download/v#{version}/DBConnect-macOS-v#{version}.dmg"
  name "DB Connect"
  desc "Free database IDE for MySQL, PostgreSQL, Amazon Redshift, DynamoDB, Redis and MongoDB"
  homepage "https://shubhesh07.github.io/db-connect/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "DBConnect.app"

  # DB Connect is not notarized with an Apple Developer ID. Clear the macOS
  # quarantine flag so Gatekeeper does not block the first launch with
  # "DBConnect is damaged and can't be opened".
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/DBConnect.app"],
                   sudo: false
  end

  uninstall quit: "com.shubhesh.dbconnect"

  zap trash: [
    "~/.querypilot",
    "~/Library/Application Support/DBConnect",
    "~/Library/Caches/com.shubhesh.dbconnect",
    "~/Library/Preferences/com.shubhesh.dbconnect.plist",
    "~/Library/Saved Application State/com.shubhesh.dbconnect.savedState",
  ]
end
