class Heliocron < Formula
  desc "Delays execution of other programs relative to sunrise and sunset"
  homepage "https://github.com/mfreeborn/heliocron"
  url "https://github.com/mfreeborn/heliocron/archive/v0.3.3.tar.gz"
  sha256 "84e751a9f6ed73b0bd33349f65d28dfd22512104750cdc6f9be99a370061baa2"
  head "https://github.com/mfreeborn/heliocron.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "sunset: 2020-05-01 20:00:26 -07:00", pipe_output(
      "#{bin}/heliocron --latitude 37.783N --longitude 122.417W --date 2020-05-01 report",
    )
  end
end
