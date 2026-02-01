# SyntheticAutonomicMind Homebrew Tap

Official Homebrew tap for SAM (Synthetic Autonomic Mind) projects including CLIO and other AI development tools.

## Installation

### Add the tap
```bash
brew tap SyntheticAutonomicMind/homebrew
```

### Install tools
```bash
# Install CLIO (Command Line Intelligence Orchestrator)
brew install clio

# Future tools
# brew install sam
```

### Update tools
```bash
brew upgrade clio
# or update all SAM tools
brew upgrade
```

## What's Available

| Tool | Purpose | Version |
|------|---------|---------|
| **CLIO** | Terminal-native AI coding assistant | 20260201.1 |

## CLIO Quick Start

```bash
# Start a new session
clio --new

# Resume last session
clio --resume

# Or run a single command
clio --input "Your task here" --exit
```

### Features
- Terminal-first experience with real markdown rendering
- File operations, git integration, terminal execution
- Memory system and persistent sessions
- Multiple AI backend support (GitHub Copilot, OpenAI, etc.)
- Privacy-first: code stays on your machine
- Zero external dependencies (Perl only)

More info: https://github.com/SyntheticAutonomicMind/CLIO

## Troubleshooting

### clio command not found after installation
```bash
brew link clio
```

### CLIO is outdated
```bash
brew upgrade clio
```

### Clear all cached data (be careful!)
```bash
rm -rf ~/.clio
```

## Contributing

To add new SAM tools to this tap:

1. Create `Formula/toolname.rb` in this repository
2. Test locally: `brew install -s ./Formula/toolname.rb`
3. Submit PR with:
   - Formula file
   - Tests included
   - Documentation updated

## For Maintainers

### Adding a new tool formula

1. Create `Formula/toolname.rb`:
   ```ruby
   class Toolname < Formula
     desc "Description"
     homepage "https://github.com/SyntheticAutonomicMind/toolname"
     url "https://github.com/SyntheticAutonomicMind/toolname/releases/download/VERSION/toolname-VERSION.tar.gz"
     sha256 "HASH_HERE"
     
     def install
       libexec.install Dir["*"]
       bin.install_symlink libexec/"toolname"
     end
     
     test do
       assert_match "version", shell_output("#{bin}/toolname --version")
     end
   end
   ```

2. Test the formula:
   ```bash
   brew install -s ./Formula/toolname.rb
   brew test toolname
   ```

3. Commit and push

### Updating a tool formula

The GitHub Action (`.github/workflows/update-formula-on-release.yml`) automatically updates formulas when releases are published.

To manually update:

1. Edit `Formula/toolname.rb`
2. Update `url` with new release URL
3. Update `sha256` with new hash (use `shasum -a 256 file.tar.gz`)
4. Test: `brew upgrade toolname`
5. Commit with message: `chore(clio): update to VERSION`

## License

Each tool maintains its own license. See individual repositories for details.

---

**Repository:** https://github.com/SyntheticAutonomicMind/homebrew  
**Maintained by:** SyntheticAutonomicMind  
**Last updated:** 2026-02-01
