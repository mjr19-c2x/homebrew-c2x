# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Spglib < Formula
  desc "C library for finding and handling crystal symmetries"
  homepage "https://spglib.github.io/spglib/"
  url "https://github.com/spglib/spglib/archive/refs/tags/v2.0.2.zip"
  sha256 "3d08cb8bb882fc09cfbe8f0d2b67d3cc2ae1d45651dd75e9226c8e54bd0a09cf"
  license "BSD-3-Clause"

  depends_on "cmake" => :build

  def install
    system "mkdir build"
    cd "build" do
      # MacOS and OpenMP do not mix well
      # And OpenMP makes linking against the library harder
      system "cmake", *std_cmake_args, "-DUSE_OMP=OFF", ".."
      system "cmake","--build","."
      system "cmake","--install","."
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test spglib`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
