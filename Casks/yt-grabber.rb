cask "yt-grabber" do
  version "1.4.0"
  sha256 "e26d2c25fe55c6874b6142b9568830c6445eee4ebf43fc4e4035a1d9d77b3cee"

  url "https://github.com/progliodario/YT-Grabber/releases/download/v#{version}/YT-Grabber-macOS.zip"
  name "YT Grabber"
  desc "Download YouTube and YouTube Music videos and playlists from a local web page"
  homepage "https://github.com/progliodario/YT-Grabber"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "YT-Grabber.app"

  # The app is only signed ad hoc (no Apple developer account): clear the download flag so it opens without the Gatekeeper prompt
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/YT-Grabber.app"],
                   must_succeed: false
  end

  zap trash: "~/Library/Application Support/YT-Grabber"
end