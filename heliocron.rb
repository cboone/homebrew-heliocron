class Heliocron < Formula
  desc "Delays execution of other programs relative to sunrise and sunset"
  homepage "https://github.com/mfreeborn/heliocron"
  url "https://github.com/mfreeborn/heliocron/archive/v0.3.3.zip"
  sha256 "134634ea86ff8f38b7d50f89ad6eebc1ff597ac6c8ae91f6cc4c255081610e33"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "sunset: 2020-05-01 20:00:26 -07:00", pipe_output(
      "#{bin}/heliocron --latitude 37.783N --longitude 122.417W --date 2020-05-01 report"
    )
  end
end
