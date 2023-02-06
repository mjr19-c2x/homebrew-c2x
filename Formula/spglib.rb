# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Spglib < Formula
  desc "C library for finding and handling crystal symmetries"
  homepage "https://spglib.github.io/spglib/"
  url "https://github.com/spglib/spglib/archive/refs/tags/v2.0.2.zip"
  sha256 "3d08cb8bb882fc09cfbe8f0d2b67d3cc2ae1d45651dd75e9226c8e54bd0a09cf"
  head "https://github.com/spglib/spglib/archive/master.zip"
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
    (testpath/"test.c").write <<~EOF
      #include <spglib.h>
      int main() {
        return(spg_get_major_version()-2);
      }
    EOF
    system ENV.cc, "-o", "a.out", "test.c", "-L#{lib}", "-lsymspg"
    system "./a.out"
  end
end
