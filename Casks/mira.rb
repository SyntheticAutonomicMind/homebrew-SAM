# SPDX-License-Identifier: GPL-3.0-only
# SPDX-FileCopyrightText: Copyright (c) 2025 Andrew Wyatt (Fewtarius)

cask "mira" do
  version "20260411.4"
  sha256 "fdfd6efabc390f6a30349375abef1603a4ba0343be53da5192c3c49fc44d0b8a"

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