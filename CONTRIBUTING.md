# Contributing to SyntheticAutonomicMind Homebrew

Thank you for your interest in contributing to the SAM Homebrew tap!

## Adding a New Formula

### 1. Create the formula

Create `Formula/toolname.rb`:

```ruby
class Toolname < Formula
  desc "Description of the tool"
  homepage "https://github.com/SyntheticAutonomicMind/toolname"
  url "https://github.com/SyntheticAutonomicMind/toolname/releases/download/VERSION/toolname-VERSION.tar.gz"
  sha256 "HASH_HERE"
  license "GPL-3.0"
  
  depends_on "perl"  # Add other dependencies as needed

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"toolname"
  end

  def post_install
    # Optional: any post-install setup
    # Example: create config directory
    # config_dir = File.expand_path("~/.toolname")
    # Dir.mkdir(config_dir) unless File.directory?(config_dir)
  end

  test do
    # Test that the tool is executable
    assert_match "version or help text", shell_output("#{bin}/toolname --help")
  end
end
```

### 2. Get the SHA256

```bash
shasum -a 256 toolname-VERSION.tar.gz
```

### 3. Test locally

```bash
brew install -s ./Formula/toolname.rb
toolname --version
brew test toolname
```

### 4. Commit and push

```bash
git add Formula/toolname.rb
git commit -m "feat: add toolname formula"
git push origin main
```

## Updating an Existing Formula

### Automated (recommended)

When you release a new version of a tool, a GitHub Action automatically updates the formula.

### Manual update

```bash
# Method 1: Use the helper script
./scripts/update-formula.sh clio 20260201.2 \
  https://github.com/SyntheticAutonomicMind/CLIO/releases/download/20260201.2/clio-20260201.2.tar.gz

# Method 2: Manual edit
# 1. Edit Formula/toolname.rb
# 2. Update url and sha256
# 3. Test: brew upgrade toolname
# 4. Commit: git commit -m "chore(toolname): update to VERSION"
```

## Testing Your Changes

```bash
# Test a specific formula
brew install -s ./Formula/toolname.rb
brew test toolname

# Test the tap itself
brew tap-new test/homebrew
brew install -s ./Formula/toolname.rb --tap=test/homebrew
brew test toolname --tap=test/homebrew
```

## Code Style

- Use standard Homebrew formula patterns
- Include a `test` block for all formulae
- Add `post_install` only if necessary
- Keep descriptions clear and concise
- Include license information

## Pull Request Process

1. Fork or create a branch: `git checkout -b add-toolname`
2. Create/update formula
3. Test thoroughly: `brew install -s ./Formula/toolname.rb`
4. Commit with clear message: `feat: add toolname` or `chore(toolname): update to VERSION`
5. Push and create pull request

## Troubleshooting

### Formula won't install
```bash
brew audit --new-formula ./Formula/toolname.rb
```

### Dependency issues
```bash
brew deps toolname
```

### Clear cache
```bash
brew cleanup -s
```

## Adding CI/CD for Your Tool

If you're adding a new tool from the SAM organization:

1. Add a GitHub Action to your project's `.github/workflows/`
2. Reference `.github/workflows/clio-update.yml` as an example
3. Update the action to call the homebrew update workflow

Example (minimal):
```yaml
name: Update Homebrew

on:
  release:
    types: [published]

jobs:
  update:
    uses: SyntheticAutonomicMind/homebrew/.github/workflows/update-formula-on-release.yml@main
    with:
      project: yourproject
      version: ${{ github.ref }}
      download_url: # URL to tar.gz
    secrets: inherit
```

## Questions?

- Check existing formulas for patterns
- Review [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- Open an issue to discuss new tools

---

Thank you for contributing to SAM!
