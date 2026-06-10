class Clio < Formula
  desc "Command Line Intelligence Orchestrator - Terminal-native AI coding assistant"
  homepage "https://github.com/SyntheticAutonomicMind/CLIO"
  url "https://github.com/SyntheticAutonomicMind/CLIO/releases/download/20260609.3/clio-20260609.3.tar.gz"
  sha256 "6f76a192769b80da44ebcdbdc802a17e74756afdf37dbf88c8f4d97d13b1cff3"
  license "GPL-3.0"

  depends_on "perl"

  def install
    # Copy the entire clio directory to libexec
    libexec.install Dir["*"]

    # Create a wrapper script that runs clio
    bin.install_symlink libexec/"clio"
  end

  def post_install
    # Create .clio directory in user's home if it doesn't exist
    clio_dir = File.expand_path("~/.clio")
    Dir.mkdir(clio_dir) unless File.directory?(clio_dir)
  end

  test do
    # Test that clio is executable and shows help
    assert_match "CLIO - Command Line Intelligent Operator", shell_output("#{bin}/clio --help")
    
    # Test that clio can start (will create a test session)
    # We use a timeout and direct the test to avoid interaction
    output = shell_output("echo '' | #{bin}/clio --debug --input 'test' --exit 2>&1", 0)
    assert_match "CLIO", output
  end
end
