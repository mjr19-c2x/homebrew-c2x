# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class C2x < Formula
  desc "Format conversion and pre- and post-processing for various electronic structure codes"
  homepage "https://www.c2x.org.uk/"
  url "https://www.c2x.org.uk/downloads/c2x_2.40e.tgz"
  sha256 "9592adc6a9511f13754f8e39440ce04d7f0b934cf64d1ea66680c62c3c9fca84"
  license "GPL-3.0-or-later"

  depends_on "spglib"

  def install
    system "make"
    bin.install "c2x"
    man1.install "c2x.1"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test c2x`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
