cask "yt-grabber" do
  version "1.2.0"
  sha256 "450a598c55f4638a9f429d2c6b0f33e0148939af9c37c42036a508f7130ccae6"

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