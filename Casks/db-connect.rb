cask "db-connect" do
  version "3.8.0"
  sha256 "30a9b447458efa45ebb52424300d9ee410f688bcfa4ce8c310ef936465d9e34d"

  url "https://github.com/shubhesh07/db-connect/releases/download/v#{version}/DBConnect-macOS-v#{version}.dmg"
  name "DB Connect"
  desc "Free database IDE for MySQL, PostgreSQL, Redshift, DynamoDB, Redis, MongoDB, Elasticsearch and ClickHouse"
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
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/DBConnect.app"], must_succeed: false
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
