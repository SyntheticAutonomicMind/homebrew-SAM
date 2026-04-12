# SPDX-License-Identifier: GPL-3.0-only
# SPDX-FileCopyrightText: Copyright (c) 2025 Andrew Wyatt (Fewtarius)

cask "mira" do
  version "20260412.3"
  sha256 "2023e8f19b878be6eab302c0de4833a8faef0d74f4fba10384bd1993a1a4208d"

  url "https://github.com/SyntheticAutonomicMind/MIRA/releases/download/#{version}/mira-macos-arm64.dmg",
      verified: "github.com/SyntheticAutonomicMind/MIRA/"
  
  name "MIRA"
  desc "Native graphical terminal for CLIO AI assistant"
  homepage "https://github.com/SyntheticAutonomicMind/MIRA"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MIRA.app"

  zap trash: [
    "~/Library/Application Support/com.fewtarius.mira",
    "~/Library/Caches/com.fewtarius.mira",
    "~/Library/Cookies/com.fewtarius.mira.binarycookies",
    "~/Library/HTTPStorages/com.fewtarius.mira",
    "~/Library/Logs/com.fewtarius.mira",
    "~/Library/Preferences/com.fewtarius.mira.plist",
    "~/Library/Saved Application State/com.fewtarius.mira.savedState",
  ]
end