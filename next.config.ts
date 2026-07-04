import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
    remotePatterns: [

      { protocol: "https", hostname: "image-tether-tool.lovable.app" },
    ],
  },
};

export default nextConfig;

