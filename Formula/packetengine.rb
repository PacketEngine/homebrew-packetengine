class Packetengine < Formula
  desc "The official PacketEngine CLI application"
  homepage "https://github.com/PacketEngine/packetengine"
  url "https://github.com/PacketEngine/packetengine/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f743361d4baa0df198cceae7fd3bdf8dfeb1802ec421c98930ee121d41a9bb4e"

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
