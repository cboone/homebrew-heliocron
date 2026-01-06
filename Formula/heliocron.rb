class Heliocron < Formula
  desc "Executes tasks relative to sunset, sunrise and other such solar events"
  homepage "https://github.com/mfreeborn/heliocron"
  version "0.5.0"
  url "https://github.com/mfreeborn/heliocron/archive/refs/tags/v#{version}.tar.gz"
  sha256 "d06e7d7625bf72002ba4b5164c743b5d625a0e0b08dacdc57148f513546c4c3f"
  head "https://github.com/mfreeborn/heliocron.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "Sunset is at:             2026-01-02 01:01:18 +00:00", pipe_output(
      "#{bin}/heliocron --latitude 37.783N --longitude 122.417W --date 2026-01-01 --time-zone \"+00:00\" report",
    )
  end
end
