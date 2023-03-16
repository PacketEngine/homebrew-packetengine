class Packetengine < Formula
  desc "The official PacketEngine CLI application"
  homepage "https://github.com/PacketEngine/packetengine"
  url "https://github.com/PacketEngine/packetengine/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3dd45c71ae3154ff669aae726fe6a8caa7ec15462b3d8a425458aaa06e804ad5"

  depends_on "go" => :build

  def install
    #Dir.chdir('cmd/packetengine')
    #system "go", "mod", "download"
    #system "go", "build", "-o", bin/"packetengine"
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/PacketEngine/packetengine/cmd/packetengine"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", "#{bin}/packetengine"
    end
  end

  test do
    system "#{bin}/packetengine", "-h"
  end
end

