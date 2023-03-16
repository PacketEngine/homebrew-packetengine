class Packetengine < Formula
  desc "The official PacketEngine CLI application"
  homepage "https://github.com/PacketEngine/packetengine"
  url "https://github.com/PacketEngine/packetengine/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3dd45c71ae3154ff669aae726fe6a8caa7ec15462b3d8a425458aaa06e804ad5"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath/"cmd/packetengine"
    path = buildpath/"src/github.com/PacketEngine/packetengine"
    path.install Dir["*"]
    puts path
    cd path do
      system "go", "build", "-o", "#{bin}/packetengine", "./cmd/packetengine"
    end
  end

  test do
    system "#{bin}/packetengine", "-h"
  end
end
