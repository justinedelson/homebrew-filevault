require 'formula'

class Filevault < Formula
  homepage 'http://dev.day.com/docs/en/crx/current/how_to/how_to_use_the_vlttool.html'
  url 'https://repository.apache.org/content/repositories/snapshots/org/apache/jackrabbit/vault/vault-cli/3.0.0-SNAPSHOT/vault-cli-3.0.0-20130816.135705-1-bin.tar.gz'
  sha1 'cecdf3b025ba016b7ed9a0f50a8921ebb64367fb'
  version '3.0.0-SNAPSHOT'

  def install
    # Remove windows files
    rm_f Dir["bin/*.bat"]
    
    libexec.install %w[bin lib]

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test vault`.
    system "vlt"
  end
end