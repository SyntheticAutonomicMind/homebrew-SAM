class Clio < Formula
  desc "Command Line Intelligence Orchestrator - Terminal-native AI coding assistant"
  homepage "https://github.com/SyntheticAutonomicMind/CLIO"
  url "https://github.com/SyntheticAutonomicMind/CLIO/releases/download/20260328.3/clio-20260328.3.tar.gz"
  sha256 "ea999bc510eb0aa8611674dc2352844247300a0e896c93ffdbf8d4bca9c4e549"
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
