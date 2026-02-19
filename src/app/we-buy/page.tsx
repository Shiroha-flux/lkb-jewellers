"use client";

import Link from "next/link";
import { MessageSquare, Search, Banknote, ArrowRight } from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

const steps = [
  {
    icon: MessageSquare,
    number: "01",
    title: "Contact Us",
    description:
      "Get in touch with our team via phone, email, or visit our Hatton Garden showroom. Tell us about the piece you'd like to sell.",
  },
  {
    icon: Search,
    number: "02",
    title: "Valuation",
    description:
      "Our expert gemologists and horologists will assess your piece thoroughly, providing a fair and transparent market valuation.",
  },
  {
    icon: Banknote,
    number: "03",
    title: "Payment",
    description:
      "Once you accept our offer, we provide immediate payment via your preferred method. Bank transfer, cheque, or cash available.",
  },
];

export default function WeBuyPage() {
  return (
    <div className="bg-black min-h-screen">
      {/* Hero */}
      <section className="relative h-[60vh] w-full overflow-hidden">
        <img
          src="https://i0.wp.com/lkbjewellers.com/wp-content/uploads/2023/10/WE-BUY-WATCHES-scaled.jpg?fit=1638%2C2048&ssl=1"
          alt="We Buy Luxury Watches"
          className="absolute inset-0 w-full h-full object-cover opacity-60"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black via-black/40 to-black/30" />
        <div className="absolute inset-0 flex flex-col justify-center items-center text-center px-4">
          <div className="inline-flex items-center gap-4 mb-6">
            <div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
            <span className="text-white text-xs tracking-[0.5em] uppercase">
              Sell Your Pieces
            </span>
            <div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
          </div>
          <h1
            className="text-5xl md:text-7xl lg:text-8xl text-white mb-6 font-normal"
            style={prataFont}
          >
            We Buy
          </h1>
          <p className="text-gray-300 text-lg md:text-xl max-w-2xl leading-relaxed">
            Competitive valuations for luxury watches, fine jewellery &amp;
            diamonds
          </p>
        </div>
      </section>

      {/* Intro */}
      <section className="py-20 md:py-28 px-4 md:px-6">
        <div className="container mx-auto max-w-6xl">
          <div className="max-w-3xl mx-auto text-center mb-16">
            <h2
              className="text-3xl md:text-4xl text-white mb-6 font-normal"
              style={prataFont}
            >
              Turn Your Luxury Items Into Cash
            </h2>
            <p className="text-gray-400 leading-relaxed text-lg">
              At LKB Jewellers, we offer competitive prices for pre-owned luxury
              watches, diamond jewellery, and precious metals. With decades of
              expertise and a transparent valuation process, you can trust us to
              give you the best possible price for your valuables.
            </p>
          </div>

          {/* Process Steps */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {steps.map((step) => (
              <div
                key={step.number}
                className="relative bg-gray-900/50 p-8 rounded-lg border border-gray-800 hover:border-[#D4AF37]/30 transition-all duration-500 group text-center"
              >
                <div className="absolute top-4 right-4">
                  <span className="text-[#D4AF37]/30 text-4xl font-bold" style={prataFont}>
                    {step.number}
                  </span>
                </div>
                <div className="w-16 h-16 mx-auto rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                  <step.icon className="w-7 h-7 text-[#D4AF37]" />
                </div>
                <h3
                  className="text-2xl text-white mb-4 font-normal"
                  style={prataFont}
                >
                  {step.title}
                </h3>
                <p className="text-gray-400 leading-relaxed">
                  {step.description}
                </p>
              </div>
            ))}
          </div>

          {/* What We Buy */}
          <div className="mt-20 text-center">
            <h2
              className="text-3xl md:text-4xl text-white mb-8 font-normal"
              style={prataFont}
            >
              What We Buy
            </h2>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              {[
                "Rolex",
                "Patek Philippe",
                "Audemars Piguet",
                "Richard Mille",
                "Diamond Rings",
                "Gold Jewellery",
                "Diamond Necklaces",
                "Precious Stones",
              ].map((item) => (
                <div
                  key={item}
                  className="bg-gray-900/50 border border-gray-800 rounded-lg py-4 px-3 text-gray-300 text-sm hover:border-[#D4AF37]/30 hover:text-white transition-all duration-300"
                >
                  {item}
                </div>
              ))}
            </div>
          </div>

          {/* CTA */}
          <div className="mt-20 text-center">
            <div className="bg-gradient-to-br from-gray-900/80 to-black/80 border border-gray-800 rounded-lg p-12">
              <h2
                className="text-3xl md:text-4xl text-white mb-4 font-normal"
                style={prataFont}
              >
                Ready to Sell?
              </h2>
              <p className="text-gray-400 mb-8 max-w-xl mx-auto">
                Contact us today for a free, no-obligation valuation of your
                luxury watches and jewellery.
              </p>
              <Link
                href="/contact"
                className="inline-flex items-center gap-3 bg-white text-black px-10 py-4 font-bold tracking-widest text-sm hover:bg-gray-200 transition-colors"
              >
                GET YOUR VALUATION
                <ArrowRight className="w-5 h-5" />
              </Link>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
