cask "ximalaya" do
  version "3.3.2,GMCoOSIHmtAEACAAAAHtXOj6,d30a,C3,5F"
  sha256 "d9df40de6df0f944f885e6dea3e03986ad8313f32aad6f52048117342da04c63"

  url "https://nativedl.pcdn.xmcdn.com/storages/#{version.csv.third}-audiofreehighqps/#{version.csv.fourth}/#{version.csv.fifth}/#{version.csv.second}.dmg?ct=application/octet-stream&filename=Ximalaya_#{version.csv.first}_x64_c_99",
      verified: "nativedl.pcdn.xmcdn.com/storages/"
  name "ximalaya"
  name "喜马拉雅"
  desc "Platform for podcasting and audio-sharing"
  homepage "https://www.ximalaya.com/"

  livecheck do
    url "https://www.ximalaya.com/down/lite/v2?client=mac&channelId=99"
    strategy :header_match do |headers|
      match = headers["location"].match(%r{storages/(.+)-aud.*?/(.+)/(.+)/(.+)\.dmg.*?Ximalaya[._-](\d+(?:\.\d+)+)}i)
      next if match.blank?

      "#{match[5]},#{match[4]},#{match[1]},#{match[2]},#{match[3]}"
    end
  end

  app "喜马拉雅.app"
end
