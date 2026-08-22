cask "db-connect" do
  version "2.4.0"
  sha256 "c9c72fc0936ab7ada59fa7d104df499e38188fb39a8450726ef1aaf80093ea95"

  url "https://github.com/shubhesh07/db-connect/releases/download/v#{version}/DBConnect-macOS-v#{version}.dmg",
      verified: "github.com/shubhesh07/db-connect/"
  name "DB Connect"
  desc "Free database IDE for MySQL, Amazon Redshift, and DynamoDB"
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
