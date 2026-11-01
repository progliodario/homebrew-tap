cask "yt-grabber" do
  version "1.5.0"
  sha256 "cfa90c2d437ee250c52aba059f562f3828e50b01a6b1ea0007311e886c15465c"

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