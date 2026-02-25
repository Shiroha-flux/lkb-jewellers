"use client";

import { useState } from "react";
import Link from "next/link";
import Image from "next/image";
import ThreeDCarousel from "@/components/three-d-carousel";

const bespokeImages = [
  "/davido.jpg",
  "/jefe-cover-blogs.jpg",
  "/bespoke/tade-chain-12.jpg",
  "/tade-chain-13.jpg",
  "/bespoke/tade-chain-16.jpg",
  "/tade-cover.jpg",
  "/timeless-photos-1.jpg",
  "/timeless-photos-2.jpg",
  "/timeless-photos-3.jpg",
];

const tabs = [
  {
    id: 1,
    name: "Masterpiece Collection",
    title: "Timeless Elegance",
    subtitle: "The Pinnacle of Craftsmanship",
    description:
      "Each piece in our masterpiece collection represents hundreds of hours of meticulous work by our master artisans. Using only the finest materials and time-honored techniques passed down through generations, we create jewelry that transcends mere adornment to become treasured heirlooms. Every diamond is hand-selected for its exceptional brilliance, every setting is crafted with microscopic precision, and every detail is perfected to create pieces that will be cherished for lifetimes.",
    videoUrl: "/jewlerryGlorify1.mp4",
    stats: [
      { label: "Hours of Craftsmanship", value: "200+" },
      { label: "Master Artisans", value: "5" },
      { label: "Quality Checks", value: "50+" },
    ],
  },
  {
    id: 2,
    name: "Signature Designs",
    title: "Iconic Excellence",
    subtitle: "Where Art Meets Innovation",
    description:
      "Our signature collection pushes the boundaries of traditional jewelry making, combining cutting-edge technology with centuries-old craftsmanship. Each design tells a unique story, from concept sketches to the final polished masterpiece. We use advanced 3D modeling alongside hand-finishing techniques to achieve levels of detail and precision that were previously impossible. The result is jewelry that is both contemporary and timeless, bold yet elegant.",
    videoUrl: "/jewleryGlorify2.mp4",
    stats: [
      { label: "Design Process", value: "3-6 Months" },
      { label: "Unique Designs", value: "100+" },
      { label: "Awards Won", value: "15+" },
    ],
  },
];

const galleryImages1 = [
  { src: "/tade-chain-13.jpg", alt: "Bespoke Jewellery 1" },
  { src: "/bespoke/tade-chain-16.jpg", alt: "Bespoke Jewellery 2" },
  { src: "/tade-cover.jpg", alt: "Bespoke Jewellery 3" },
];

const hallOfFameImages = [
  { src: "/davido.jpg", alt: "Davido" },
  { src: "/jefe-cover-blogs.jpg", alt: "Jefe" },
  { src: "/bespoke/tade-chain-12.jpg", alt: "Tade Chain" },
  { src: "/tade-chain-13.jpg", alt: "Tade Chain 2" },
  { src: "/bespoke/tade-chain-16.jpg", alt: "Tade Chain 3" },
  { src: "/tade-cover.jpg", alt: "Tade Cover" },
  { src: "/timeless-photos-1.jpg", alt: "Timeless Photos 1" },
  { src: "/timeless-photos-2.jpg", alt: "Timeless Photos 2" },
  { src: "/timeless-photos-3.jpg", alt: "Timeless Photos 3" },
];

const portfolioImages = [
  { src: "/timeless-photos-2.jpg", alt: "Bespoke Work 1" },
  { src: "/bespoke/bracelets-1.jpg", alt: "Bespoke Work 2" },
  { src: "/timeless-photos-3.jpg", alt: "Bespoke Work 3" },
];

export default function BespokePage() {
  const [activeTab, setActiveTab] = useState(0);
  const current = tabs[activeTab];

  return (
    <div className="bg-black text-white min-h-screen">
      {/* ===== HERO - Split Layout ===== */}
      <section className="relative overflow-hidden bg-gradient-to-b from-black via-gray-900 to-black pt-32 pb-8 md:pt-36 md:pb-12 lg:h-screen lg:py-0">
        <div className="container mx-auto px-4 md:px-6 h-full">
          <div className="flex flex-col lg:grid lg:grid-cols-2 gap-6 md:gap-8 lg:gap-12 h-full lg:items-center">
            {/* Left - Text */}
            <div className="text-center lg:text-left z-20 flex flex-col justify-center order-1 mb-6 md:mb-8 lg:mb-0">
              <div className="flex items-center gap-3 md:gap-4 mb-3 md:mb-4 lg:mb-6 justify-center lg:justify-start">
                <div className="h-px w-8 md:w-16 bg-gradient-to-r from-transparent to-[#D4AF37]" />
                <div className="w-2 h-2 rotate-45 border border-[#D4AF37]" />
              </div>
              <h1
                className="text-3xl sm:text-4xl md:text-5xl lg:text-7xl xl:text-8xl mb-3 md:mb-4 lg:mb-6 text-white tracking-tight leading-tight font-normal px-4 lg:px-0 font-heading"
              >
                Bespoke Design
              </h1>
              <div className="w-16 md:w-24 lg:w-32 h-0.5 md:h-1 bg-[#D4AF37] mb-3 md:mb-4 lg:mb-8 mx-auto lg:mx-0" />
              <p
                className="text-base sm:text-lg md:text-xl lg:text-2xl text-gray-300 font-light leading-relaxed mb-3 md:mb-4 lg:mb-8 px-4 lg:px-0"
                style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}
              >
                Where Your Vision Becomes Timeless Luxury
              </p>
              <p
                className="text-sm md:text-base text-gray-400 leading-relaxed max-w-xl mx-auto lg:mx-0 px-4 lg:px-0"
                style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}
              >
                Transform your dreams into exquisite reality with our master craftsmen. Each piece is meticulously designed to reflect your unique story and style.
              </p>
            </div>

            {/* Right - 3D Carousel */}
            <div className="relative h-[380px] sm:h-[420px] md:h-[500px] lg:h-[800px] flex items-center justify-center order-2">
              {/* Gold glow circle behind carousel */}
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="w-[220px] h-[220px] sm:w-[280px] sm:h-[280px] md:w-[350px] md:h-[350px] lg:w-[500px] lg:h-[500px] bg-[#D4AF37]/10 rounded-full blur-[50px] md:blur-[70px] lg:blur-[120px] animate-pulse" />
              </div>
              {/* Carousel with drop-shadow filter */}
              <div
                className="relative z-10 rounded-2xl scale-[0.65] sm:scale-[0.75] md:scale-[0.85] lg:scale-100"
                style={{ filter: "drop-shadow(0 20px 40px rgba(212, 175, 55, 0.2)) drop-shadow(0 30px 60px rgba(212, 175, 55, 0.3))" }}
              >
                <ThreeDCarousel
                  images={bespokeImages}
                  radius={360}
                  cardW={240}
                  cardH={340}
                  autoSpinSpeed={0.03}
                />
              </div>
              {/* Decorative gold dots */}
              <div className="absolute top-10 right-10 w-2 md:w-3 h-2 md:h-3 bg-[#D4AF37] rounded-full animate-pulse opacity-60" />
              <div className="absolute bottom-20 left-10 w-1.5 md:w-2 h-1.5 md:h-2 bg-[#D4AF37] rounded-full animate-pulse opacity-40" style={{ animationDelay: "1s" }} />
              <div className="absolute top-1/3 left-20 w-1 h-1 bg-[#D4AF37] rounded-full animate-pulse opacity-50" style={{ animationDelay: "0.5s" }} />
            </div>
          </div>
        </div>
      </section>

      {/* ===== BESPOKE JEWELLERY INTRO ===== */}
      <div className="container mx-auto px-4 md:px-6 text-center max-w-4xl my-12 md:my-16 relative">
        <div className="absolute inset-0 overflow-hidden pointer-events-none">
          {[...Array(15)].map((_, i) => (
            <div
              key={i}
              className="absolute w-1 h-1 bg-[#D4AF37] rounded-full animate-pulse"
              style={{
                left: `${10 + (i * 6.2) % 80}%`,
                top: `${5 + (i * 7.3) % 90}%`,
                animationDelay: `${(i * 0.3) % 3}s`,
                animationDuration: `${2 + (i % 3)}s`,
                opacity: 0.5 + (i % 5) * 0.1,
              }}
            />
          ))}
        </div>
        <h2 className="text-3xl sm:text-4xl md:text-5xl mb-6 md:mb-8 text-white font-bold px-4 font-heading">
          Bespoke Jewellery
        </h2>
        <div className="w-16 md:w-24 h-0.5 bg-[#D4AF37] mx-auto mb-8 md:mb-10" />
        <p className="text-gray-300 text-base md:text-lg leading-relaxed mb-4 md:mb-6 font-normal px-4"
          style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
          At the Local Kettle Brothers, we see bespoke jewellery as art. We create exquisite pieces that reflect our client&apos;s unique style and individuality. Our team of accredited creative designers and artist have years of experience bringing even the most complex visions to life.
        </p>
        <p className="text-gray-300 text-base md:text-lg leading-relaxed mb-4 md:mb-6 font-normal px-4"
          style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
          From our initial consultation to the final handcrafted product, we take meticulous care at every step of the process. We use only the finest materials and the most advanced techniques to create beautiful and durable jewellery.
        </p>
        <p className="text-gray-300 text-base md:text-lg leading-relaxed mb-4 md:mb-6 font-normal px-4"
          style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
          We mark life&apos;s significant moments with pieces of exceptional beauty, rarity, and quality. Whether you&apos;re celebrating an engagement, a wedding, or simply want to indulge yourself, we&apos;ll create a piece of jewelry you&apos;ll cherish for years to come.
        </p>
      </div>

      {/* ===== THE ART OF PERFECTION ===== */}
      <section className="relative min-h-screen flex flex-col justify-center bg-black py-8">
        <div className="absolute inset-0 opacity-10">
          <div className="absolute top-0 left-0 w-full h-full"
            style={{
              backgroundImage: "radial-gradient(circle at 20% 50%, rgba(212, 175, 55, 0.15) 0%, transparent 50%), radial-gradient(circle at 80% 80%, rgba(212, 175, 55, 0.15) 0%, transparent 50%)",
              backgroundSize: "100% 100%",
            }}
          />
        </div>
        <div className="container mx-auto px-4 md:px-6 relative z-10">
          {/* Header */}
          <div className="text-center mb-8 md:mb-12">
            <div className="flex items-center gap-4 mb-4 justify-center">
              <div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
              <span className="text-white text-xs tracking-[0.5em] uppercase" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
                Unparalleled Excellence
              </span>
              <div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
            </div>
            <h2 className="text-5xl md:text-6xl text-white mb-6 font-normal font-heading">
              <span className="block tracking-[0.1em] mb-1">THE ART OF</span>
              <span className="block text-[#D4AF37] tracking-[0.1em]">PERFECTION</span>
            </h2>
            <p className="text-gray-400 text-lg max-w-2xl mx-auto"
              style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
              Where precision meets passion. Every piece is a masterwork, meticulously crafted to transcend time.
            </p>
          </div>

          {/* Tabs Layout */}
          <div className="flex flex-col lg:flex-row gap-4 lg:gap-6 max-w-6xl mx-auto">
            {/* Tab Buttons */}
            <div className="lg:w-60 flex flex-row lg:flex-col gap-2 overflow-x-auto lg:overflow-x-visible pb-2 lg:pb-0">
              {tabs.map((tab, i) => (
                <button
                  key={tab.id}
                  onClick={() => setActiveTab(i)}
                  className={`relative px-4 py-3 lg:px-6 lg:py-4 rounded-lg text-left transition-all whitespace-nowrap lg:whitespace-normal ${
                    activeTab === i
                      ? "bg-[#D4AF37]/20 text-[#D4AF37] border border-[#D4AF37]/30"
                      : "text-gray-400 hover:text-white border border-transparent hover:border-gray-800"
                  }`}
                >
                  <span className="text-sm font-medium">{tab.name}</span>
                </button>
              ))}
            </div>

            {/* Tab Content */}
            <div className="flex-1 relative rounded-lg bg-gradient-to-br from-gray-900/80 to-black/80 backdrop-blur-xl border border-gray-800 shadow-2xl overflow-hidden">
              <div className="grid grid-cols-1 lg:grid-cols-2 h-full">
                {/* Left - Info */}
                <div className="p-6 md:p-8 lg:p-10 flex flex-col justify-center border-l-2 border-[#D4AF37]/30">
                  <p className="text-[#D4AF37] text-xs tracking-[0.3em] uppercase mb-2" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
                    {current.subtitle}
                  </p>
                  <h3 className="text-2xl md:text-3xl text-white mb-4 font-normal font-heading">
                    {current.title}
                  </h3>
                  <p className="text-gray-400 text-sm leading-relaxed mb-6"
                    style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
                    {current.description}
                  </p>
                  <div className="flex gap-6">
                    {current.stats.map((stat) => (
                      <div key={stat.label}>
                        <p className="text-[#D4AF37] text-xl font-bold">{stat.value}</p>
                        <p className="text-gray-500 text-xs">{stat.label}</p>
                      </div>
                    ))}
                  </div>
                </div>
                {/* Right - Video */}
                <div className="relative h-64 lg:h-auto">
                  <div className="absolute top-2 left-2 w-8 h-8 border-t border-l border-[#D4AF37]/40" />
                  <div className="absolute bottom-2 right-2 w-8 h-8 border-b border-r border-[#D4AF37]/40" />
                  <video className="w-full h-full object-cover" autoPlay muted loop playsInline key={current.videoUrl}>
                    <source src={current.videoUrl} type="video/mp4" />
                  </video>
                  <div className="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent" />
                </div>
              </div>
            </div>
          </div>

          {/* Bottom Quote */}
          <div className="text-center mt-8 md:mt-12">
            <p className="text-gray-500 text-sm italic">&ldquo;Every piece tells a story of dedication, artistry, and timeless elegance&rdquo;</p>
            <div className="flex items-center justify-center gap-4 mt-4">
              <div className="h-px w-12 bg-[#D4AF37]/30" />
              <span className="text-[#D4AF37] text-xs tracking-[0.3em]">LKB Jewellers</span>
              <div className="h-px w-12 bg-[#D4AF37]/30" />
            </div>
          </div>
        </div>

        {/* Floating particles */}
        <div className="absolute top-20 left-10 w-1 h-1 bg-[#D4AF37] rounded-full animate-bounce opacity-30" style={{ animationDuration: "3s" }} />
        <div className="absolute bottom-32 right-20 w-1.5 h-1.5 bg-[#D4AF37] rounded-full animate-bounce opacity-20" style={{ animationDuration: "3s", animationDelay: "0.5s" }} />
        <div className="absolute top-1/3 right-10 w-1 h-1 bg-[#D4AF37] rounded-full animate-bounce opacity-25" style={{ animationDuration: "3s", animationDelay: "1s" }} />
        <div className="absolute bottom-20 left-1/4 w-0.5 h-0.5 bg-[#D4AF37] rounded-full animate-bounce opacity-30" style={{ animationDuration: "3s", animationDelay: "1.5s" }} />
      </section>

      {/* ===== THREE PILLARS ===== */}
      <div className="container mx-auto px-4 md:px-6 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 md:gap-12 mb-16 md:mb-24">
        <div className="flex flex-col items-center text-center px-4">
          <h3 className="text-[#D4AF37] text-xl md:text-2xl mb-3 md:mb-4 font-bold font-heading">
            Dedicated Client Advisors
          </h3>
          <p className="text-gray-400 text-sm leading-relaxed mb-6 md:mb-8"
            style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
            Our client advisors serve as the bridge between our team and our clients, ensuring seamless communication, managing expectations, and overseeing every step of the process. Their dedication to exceptional service ensures that our clients feel valued, informed, and deeply satisfied with their Bespoke Jewellery experience.
          </p>
        </div>
        <div className="flex flex-col items-center text-center border-t md:border-t-0 md:border-l md:border-r border-gray-800 px-4 pt-8 md:pt-0 md:px-6 lg:px-8">
          <h3 className="text-[#D4AF37] text-xl md:text-2xl mb-3 md:mb-4 font-bold font-heading">
            Master Artisans
          </h3>
          <p className="text-gray-400 text-sm leading-relaxed mb-6 md:mb-8"
            style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
            Our skilled master artisans are the backbone of our team, bringing decades of experience and a deep reverence for traditional techniques to every piece they create. Their hands carry the wisdom of generations, and their craftsmanship ensures that each creation is a testament to their expertise and dedication.
          </p>
        </div>
        <div className="flex flex-col items-center text-center border-t md:border-t-0 border-gray-800 px-4 pt-8 md:pt-0 md:col-span-2 lg:col-span-1">
          <h3 className="text-[#D4AF37] text-xl md:text-2xl mb-3 md:mb-4 font-bold font-heading">
            Celebrating Moments
          </h3>
          <p className="text-gray-400 text-sm leading-relaxed mb-6 md:mb-8"
            style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
            Bespoke Jewellery has a unique capacity to celebrate life&apos;s most significant moments. From engagement and wedding rings that mark the beginning of a lifelong journey, to anniversary gifts that commemorate enduring love, these pieces encapsulate emotions and milestones in exquisite form.
          </p>
        </div>
      </div>

      {/* ===== HALL OF FAME GALLERY ===== */}
      <div className="container mx-auto px-4 md:px-6 mb-16 md:mb-24">
        <div className="text-center mb-12">
          <div className="flex items-center gap-4 mb-4 justify-center">
            <div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
            <span className="text-white text-xs tracking-[0.5em] uppercase" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
              OUR CLIENTS
            </span>
            <div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
          </div>
          <h2 className="text-5xl md:text-6xl text-white mb-6 font-normal font-heading">
            HALL OF FAME
          </h2>
        </div>
        <div className="grid grid-cols-2 md:grid-cols-3 gap-3 md:gap-4">
          {hallOfFameImages.map((img, i) => (
            <div key={i} className={`overflow-hidden rounded-lg group relative h-56 sm:h-64 md:h-80 ${i >= 6 ? "hidden md:block" : ""}`}>
              <Image src={img.src} alt={img.alt} fill className="object-cover hover:scale-105 transition-transform duration-700" sizes="(max-width: 768px) 50vw, 33vw" />
              <div className="absolute inset-0 bg-black/20 group-hover:bg-black/0 transition-colors duration-500" />
            </div>
          ))}
        </div>
      </div>

      {/* ===== IMAGE GALLERY 1 ===== */}
      <div className="container mx-auto px-4 md:px-6 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 md:gap-6 mb-16 md:mb-24">
        {galleryImages1.map((img, i) => (
          <div key={i} className={`overflow-hidden rounded-lg relative h-64 sm:h-72 md:h-80 ${i === 2 ? "sm:col-span-2 md:col-span-1" : ""}`}>
            <Image src={img.src} alt={img.alt} fill className="object-cover hover:scale-105 transition-transform duration-700" sizes="(max-width: 768px) 100vw, 33vw" />
          </div>
        ))}
      </div>

      {/* ===== 3-D CAD DESIGN CTA ===== */}
      <div className="container mx-auto px-4 md:px-6 mb-16 md:mb-24">
        <div className="text-center mb-12">
          <div className="flex items-center gap-4 mb-4 justify-center">
            <div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
            <span className="text-white text-xs tracking-[0.5em] uppercase" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
              3-D CAD DESIGN TO FINISHED PRODUCT
            </span>
            <div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
          </div>
          <h2 className="text-5xl md:text-6xl text-white mb-6 font-normal font-heading">
            3-D CAD DESIGN<br />TO FINISHED PRODUCT
          </h2>
          <p className="text-gray-400 text-lg max-w-2xl mx-auto mb-8"
            style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
            Bring your vision and designs to life with LKB. Whether you&apos;re designing a custom ring or creating bespoke handcrafted jewellery, we transform your ideas into beautifully finished pieces crafted with precision, care, and exceptional attention to detail.
          </p>
          <Link href="/contact" className="inline-block bg-white text-black px-8 md:px-12 py-3 md:py-4 font-bold tracking-widest text-sm md:text-base hover:bg-[#D4AF37] transition-colors">
            START YOUR PROJECT
          </Link>
        </div>
      </div>

      {/* ===== FULL-WIDTH VIDEO ===== */}
      <div className="container mx-auto px-4 md:px-6 mb-16 md:mb-24">
        <div className="relative overflow-hidden rounded-lg group">
          <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-60 z-10 pointer-events-none" />
          <video className="w-full h-[400px] sm:h-[500px] md:h-[600px] object-cover" autoPlay muted loop playsInline>
            <source src="/abousUsPageheroVideo.mp4" type="video/mp4" />
            Your browser does not support the video tag.
          </video>
        </div>
      </div>

      {/* ===== ABOUT SPLIT SECTION ===== */}
      <div className="container mx-auto px-4 md:px-6 mb-16 md:mb-24">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-0">
          <div className="relative bg-gray-900 h-64 sm:h-80 md:h-96">
            <div className="grid grid-cols-2 h-full">
              <div className="relative overflow-hidden">
                <Image src="/bespoke/about1.jpg" alt="Bespoke Jewellery Detail" fill className="object-cover" sizes="25vw" />
              </div>
              <div className="relative overflow-hidden">
                <Image src="/bespoke/about2.jpg" alt="Bespoke Craftsmanship" fill className="object-cover" sizes="25vw" />
              </div>
            </div>
          </div>
          <div className="bg-black flex items-center justify-center p-8 md:p-12 lg:p-16">
            <div className="max-w-xl">
              <p className="text-gray-500 uppercase tracking-widest text-xs md:text-sm mb-4 md:mb-6" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
                ABOUT
              </p>
              <h2 className="text-2xl sm:text-3xl md:text-4xl text-white mb-4 md:mb-6 leading-tight font-bold font-heading">
                Bespoke Jewellery &mdash; Crafting Your Unique Expression
              </h2>
              <p className="text-gray-400 text-sm md:text-base leading-relaxed"
                style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
                <span className="italic">Bespoke Jewellery</span> is the epitome of personalized exclusive luxury, where craftsmanship meets individuality to create exquisite adornments that tell unique stories. With a commitment to preserving the artistry of traditional jewellery-making while embracing modern sensibilities, Bespoke Jewellery offers a distinctive experience that transcends conventional trends.
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* ===== WORK PORTFOLIO ===== */}
      <div className="container mx-auto px-4 md:px-6 mb-16 md:mb-24">
        <div className="text-center mb-12">
          <div className="flex items-center gap-4 mb-4 justify-center">
            <div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
            <span className="text-white text-xs tracking-[0.5em] uppercase" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
              WORK PORTFOLIO
            </span>
            <div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
          </div>
          <h2 className="text-5xl md:text-6xl text-white mb-6 font-normal font-heading">
            CRAFTSMANSHIP<br />AND CREATIVITY
          </h2>
          <p className="text-gray-400 text-lg max-w-2xl mx-auto"
            style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
            At the heart of Bespoke Jewellery lies an unwavering dedication to craftsmanship. Every piece is meticulously handcrafted by skilled artisans who combine traditional techniques with innovative approaches.
          </p>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 md:gap-6">
          {portfolioImages.map((img, i) => (
            <div key={i} className={`overflow-hidden rounded-lg group relative h-72 sm:h-80 md:h-96 ${i === 2 ? "sm:col-span-2 md:col-span-1" : ""}`}>
              <Image src={img.src} alt={img.alt} fill className="object-cover hover:scale-110 transition-transform duration-700 group-hover:brightness-110" sizes="(max-width: 768px) 100vw, 33vw" />
            </div>
          ))}
        </div>
      </div>

      {/* ===== TEAM SPLIT SECTION ===== */}
      <div className="container mx-auto px-4 md:px-6 mb-16 md:mb-24">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-0">
          <div className="relative bg-gray-900 h-64 sm:h-80 md:h-96">
            <div className="grid grid-cols-2 h-full">
              <div className="relative overflow-hidden">
                <Image src="/bespoke/team1.jpg" alt="Bespoke Team" fill className="object-cover" sizes="25vw" />
              </div>
              <div className="relative overflow-hidden">
                <Image src="/bespoke/team2.jpg" alt="Innovative Designers" fill className="object-cover" sizes="25vw" />
              </div>
            </div>
          </div>
          <div className="bg-black flex items-center justify-center p-8 md:p-12 lg:p-16">
            <div className="max-w-xl">
              <p className="text-gray-500 uppercase tracking-widest text-xs md:text-sm mb-4 md:mb-6" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
                TEAM
              </p>
              <h2 className="text-2xl sm:text-3xl md:text-4xl text-white mb-4 md:mb-6 leading-tight font-bold font-heading">
                The power behind us
              </h2>
              <p className="text-gray-400 text-sm md:text-base leading-relaxed mb-6 md:mb-8"
                style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
                At the heart of every exquisite creation that emerges from Bespoke Jewellery is an exceptional team of dedicated individuals who breathe life into dreams and turn them into wearable works of art. Our team is more than just a group of artisans; they are the architects of emotion, the custodians of craftsmanship, and the conduits through which personal stories are transformed into cherished pieces of jewellery.
              </p>
              <div className="border-l-2 border-[#D4AF37] pl-4 md:pl-6">
                <h3 className="text-[#D4AF37] font-semibold text-base md:text-lg mb-2 md:mb-3 font-bold font-heading">
                  Innovative Designers:
                </h3>
                <p className="text-gray-400 text-sm md:text-base leading-relaxed"
                  style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
                  Our innovative designers are the bridge between imagination and reality. They collaborate closely with clients, unraveling their desires and aspirations to craft designs that resonate on a deeply personal level. With an eye for aesthetics and a flair for innovation, our designers breathe life into the sketches that eventually become cherished heirlooms.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* ===== FINAL CTA ===== */}
      <div className="text-center mt-16 md:mt-24 pb-16 md:pb-24 px-4">
        <Link href="/contact" className="inline-block bg-white text-black px-8 md:px-12 py-3 md:py-4 font-bold tracking-widest text-sm md:text-base hover:bg-[#D4AF37] transition-colors">
          START YOUR PROJECT
        </Link>
      </div>
    </div>
  );
}
