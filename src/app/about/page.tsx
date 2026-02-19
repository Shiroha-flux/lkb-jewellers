"use client";

import Image from "next/image";
import { Award, Gem, Lightbulb } from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

export default function AboutPage() {
  return (
    <div className="bg-black min-h-screen">
      {/* Hero with Video Background */}
      <section className="relative h-[60vh] w-full overflow-hidden">
        <video
          className="absolute top-0 left-0 w-full h-full object-cover opacity-70"
          preload="metadata"
          playsInline
          autoPlay
          muted
          loop
          style={{ willChange: "transform" }}
        >
          <source src="/abousUsPageheroVideo.mp4" type="video/mp4" />
        </video>
        <div className="absolute inset-0 bg-black/50" />
        <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-black/30" />
        <div className="absolute inset-0 flex flex-col justify-center items-center text-center px-4">
          <div className="inline-flex items-center gap-4 mb-6">
            <div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
            <span className="text-white text-xs tracking-[0.5em] uppercase">
              Our Story
            </span>
            <div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
          </div>
          <h1
            className="text-5xl md:text-7xl lg:text-8xl text-white mb-6 font-normal"
            style={prataFont}
          >
            About Us
          </h1>
          <p className="text-gray-300 text-lg md:text-xl max-w-2xl leading-relaxed">
            Our heritage, values &amp; craftsmanship
          </p>
        </div>
      </section>

      {/* Story Section */}
      <section className="py-20 md:py-28 px-4 md:px-6">
        <div className="container mx-auto max-w-6xl">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-20 items-center">
            <div className="space-y-6">
              <div className="inline-flex items-center gap-4 mb-2">
                <div className="h-px w-16 bg-gradient-to-r from-transparent to-[#D4AF37]" />
                <span className="text-[#D4AF37] text-xs tracking-[0.5em] uppercase">
                  Our Heritage
                </span>
              </div>
              <h2
                className="text-4xl md:text-5xl text-white font-normal"
                style={prataFont}
              >
                The LKB Story
              </h2>
              <p className="text-gray-400 leading-relaxed">
                LKB Jewellers are Hatton Garden&apos;s premier specialists in
                luxury watches, bespoke jewellery, and exceptional diamonds.
                Established with a passion for timeless elegance, we have built
                our reputation on trust, quality, and an unwavering commitment
                to our craft.
              </p>
              <p className="text-gray-400 leading-relaxed">
                Nestled in the heart of London&apos;s iconic jewellery quarter,
                we combine traditional craftsmanship with contemporary design to
                create pieces that transcend generations. Our team of master
                jewellers and gemologists bring decades of expertise to every
                creation.
              </p>
              <p className="text-gray-400 leading-relaxed">
                From sourcing the finest diamonds and gemstones to handcrafting
                bespoke pieces, every step of our process reflects our
                dedication to excellence. We believe that jewellery is more than
                adornment — it is a celebration of life&apos;s most precious
                moments.
              </p>
              <div className="flex items-center gap-8 pt-4">
                <div>
                  <span
                    className="text-3xl text-[#D4AF37] font-normal"
                    style={prataFont}
                  >
                    20+
                  </span>
                  <p className="text-gray-500 text-xs tracking-wider uppercase mt-1">
                    Years Experience
                  </p>
                </div>
                <div className="h-12 w-px bg-gray-800" />
                <div>
                  <span
                    className="text-3xl text-[#D4AF37] font-normal"
                    style={prataFont}
                  >
                    5000+
                  </span>
                  <p className="text-gray-500 text-xs tracking-wider uppercase mt-1">
                    Happy Clients
                  </p>
                </div>
                <div className="h-12 w-px bg-gray-800" />
                <div>
                  <span
                    className="text-3xl text-[#D4AF37] font-normal"
                    style={prataFont}
                  >
                    100%
                  </span>
                  <p className="text-gray-500 text-xs tracking-wider uppercase mt-1">
                    Authentic
                  </p>
                </div>
              </div>
            </div>
            <div className="relative group">
              <div className="absolute -inset-4 bg-gradient-to-r from-[#D4AF37]/20 via-transparent to-[#D4AF37]/20 opacity-0 group-hover:opacity-100 transition-opacity duration-700 blur-xl" />
              <div className="relative overflow-hidden rounded-lg">
                <img
                  src="https://i0.wp.com/lkbjewellers.com/wp-content/uploads/2025/02/LKB-GRM-CROWN-JEWELS-BTS-64-scaled.jpeg?resize=1400%2C788&ssl=1"
                  alt="LKB Jewellers at Hatton Garden"
                  className="w-full h-auto object-cover transition-transform duration-700 group-hover:scale-105"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent" />
              </div>
              <div className="absolute -bottom-4 -right-4 w-24 h-24 border-b-2 border-r-2 border-[#D4AF37]/30" />
              <div className="absolute -top-4 -left-4 w-24 h-24 border-t-2 border-l-2 border-[#D4AF37]/30" />
            </div>
          </div>
        </div>
      </section>

      {/* Values Section */}
      <section className="py-20 md:py-28 px-4 md:px-6 bg-gradient-to-b from-black to-[#0a0a0a]">
        <div className="container mx-auto max-w-6xl">
          <div className="text-center mb-16">
            <div className="inline-flex items-center gap-4 mb-6">
              <div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
              <span className="text-white text-xs tracking-[0.5em] uppercase">
                What Drives Us
              </span>
              <div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
            </div>
            <h2
              className="text-4xl md:text-5xl text-white font-normal"
              style={prataFont}
            >
              Our Values
            </h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {/* Quality */}
            <div className="bg-gray-900/50 p-8 rounded-lg border border-gray-800 hover:border-[#D4AF37]/30 transition-all duration-500 group">
              <div className="w-16 h-16 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                <Gem className="w-7 h-7 text-[#D4AF37]" />
              </div>
              <h3
                className="text-2xl text-white mb-4 font-normal"
                style={prataFont}
              >
                Quality
              </h3>
              <p className="text-gray-400 leading-relaxed">
                Every piece that bears the LKB name undergoes rigorous quality
                checks. We source only the finest materials and work with master
                craftsmen to ensure perfection in every detail.
              </p>
            </div>

            {/* Heritage */}
            <div className="bg-gray-900/50 p-8 rounded-lg border border-gray-800 hover:border-[#D4AF37]/30 transition-all duration-500 group">
              <div className="w-16 h-16 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                <Award className="w-7 h-7 text-[#D4AF37]" />
              </div>
              <h3
                className="text-2xl text-white mb-4 font-normal"
                style={prataFont}
              >
                Heritage
              </h3>
              <p className="text-gray-400 leading-relaxed">
                Rooted in the rich tradition of Hatton Garden, we honour the
                legacy of London&apos;s jewellery quarter while bringing fresh
                perspectives and innovation to classic designs.
              </p>
            </div>

            {/* Innovation */}
            <div className="bg-gray-900/50 p-8 rounded-lg border border-gray-800 hover:border-[#D4AF37]/30 transition-all duration-500 group">
              <div className="w-16 h-16 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                <Lightbulb className="w-7 h-7 text-[#D4AF37]" />
              </div>
              <h3
                className="text-2xl text-white mb-4 font-normal"
                style={prataFont}
              >
                Innovation
              </h3>
              <p className="text-gray-400 leading-relaxed">
                We embrace modern techniques and cutting-edge technology to push
                the boundaries of jewellery design, creating pieces that are
                both timeless and contemporary.
              </p>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
