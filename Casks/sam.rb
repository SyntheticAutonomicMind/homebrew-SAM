# SPDX-License-Identifier: GPL-3.0-only
# SPDX-FileCopyrightText: Copyright (c) 2025 Andrew Wyatt (Fewtarius)

cask "sam" do
  version "20261005.1"
  sha256 "e5bfe9ab200aff8e7982629194debd1578622f6ec04dabc91a0adbfe207849c1"

  url "https://github.com/SyntheticAutonomicMind/SAM/releases/download/#{version}/SAM-#{version}.dmg",
      verified: "github.com/SyntheticAutonomicMind/SAM/"
  
  name "Synthetic Autonomic Mind"
  desc "Native macOS AI assistant with multi-AI provider support and local model inference"
  homepage "https://www.syntheticautonomicmind.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "SAM.app"

  zap trash: [
    "~/Library/Application Support/com.fewtarius.syntheticautonomicmind",
    "~/Library/Caches/com.fewtarius.syntheticautonomicmind",
    "~/Library/Cookies/com.fewtarius.syntheticautonomicmind.binarycookies",
    "~/Library/HTTPStorages/com.fewtarius.syntheticautonomicmind",
    "~/Library/Logs/com.fewtarius.syntheticautonomicmind",
    "~/Library/Preferences/com.fewtarius.syntheticautonomicmind.plist",
    "~/Library/Saved Application State/com.fewtarius.syntheticautonomicmind.savedState",
  ]
end
