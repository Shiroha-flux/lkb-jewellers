"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import Image from "next/image";
import { MapPin, Instagram } from "lucide-react";
import { siteConfig } from "@/data/products";

export default function Footer() {
  const [logoVisible, setLogoVisible] = useState(false);
  const year = new Date().getFullYear();

  useEffect(() => {
    const timer = setTimeout(() => setLogoVisible(true), 200);
    return () => clearTimeout(timer);
  }, []);

  return (
    <footer className="bg-black text-white pt-20 pb-10 md:pb-10 border-t border-gray-900">
      <div className="container mx-auto px-6 pb-32 md:pb-0">
        {/* Main columns */}
        <div className="flex flex-col lg:flex-row justify-between gap-12 mb-16">
          {/* Column 1 - Logo */}
          <div className="lg:w-1/6">
            <Link href="/">
              <Image
                src="/white-logo.png"
                alt={siteConfig.businessName}
                width={200}
                height={64}
                className={`h-16 w-auto mb-3 ${logoVisible ? "animate-logo-pop" : "opacity-0"}`}
              />
            </Link>
            <p className="tracking-[0.15em] text-xs font-heading">
              LOCAL KETTLE BROTHERS UK
            </p>
            <p className="tracking-[0.3em] text-[8px] font-heading">
              JEWELLERS
            </p>
          </div>

          {/* Column 2 - Customer Service */}
          <div className="lg:w-1/5">
            <h3 className="text-lg mb-6 text-gold font-heading">
              Customer Service
            </h3>
            <ul className="space-y-4 text-sm text-gray-400">
              <li>
                <Link
                  href="/delivery-policy"
                  className="hover:text-white transition-colors"
                >
                  Delivery Information
                </Link>
              </li>
              <li>
                <Link
                  href="/privacy-policy"
                  className="hover:text-white transition-colors"
                >
                  Privacy Policy
                </Link>
              </li>
              <li>
                <Link
                  href="/returns-policy"
                  className="hover:text-white transition-colors"
                >
                  Returns Policy
                </Link>
              </li>
            </ul>
          </div>

          {/* Column 3 - Explore */}
          <div className="lg:w-1/5">
            <h3 className="text-lg mb-6 text-gold font-heading">Explore</h3>
            <ul className="space-y-4 text-sm text-gray-400">
              <li>
                <Link
                  href="/about"
                  className="hover:text-white transition-colors"
                >
                  About Us
                </Link>
              </li>
              <li>
                <Link
                  href="/services"
                  className="hover:text-white transition-colors"
                >
                  Bespoke Designs
                </Link>
              </li>
              <li>
                <Link
                  href="/contact"
                  className="hover:text-white transition-colors"
                >
                  Contact
                </Link>
              </li>
            </ul>
          </div>

          {/* Column 4 - Address */}
          <div className="lg:w-1/4">
            <h3 className="text-lg mb-6 text-gold font-heading">Address</h3>
            <div className="flex items-start gap-2 text-sm text-gray-400 mb-6">
              <MapPin size={18} className="text-gold shrink-0 mt-0.5" />
              <span>New House, 67-68 Hatton Garden, London, EC1N 8JY</span>
            </div>
            <h3 className="text-lg mb-4 text-gold font-heading">
              Working Hours
            </h3>
            <div className="text-sm text-gray-400 space-y-2">
              <p>Monday - Friday: 24hrs</p>
              <p>Saturday: 24hrs</p>
              <p>Sunday: 24hrs</p>
            </div>
          </div>
        </div>

        {/* Bottom bar */}
        <div className="border-t border-gray-900 pt-8">
          <div className="flex flex-col md:flex-row justify-between items-center gap-6">
            {/* Left - Copyright */}
            <p className="text-xs text-gray-500">
              &copy; {year} Local Kettle Brothers UK. All rights reserved.
            </p>

            {/* Center - Developer credit */}
            <p className="text-xs text-gray-500">
              Developed by{" "}
              <a
                href="https://fluxconsultancy.co.uk/"
                target="_blank"
                rel="noopener noreferrer"
                className="text-gold hover:text-white transition-colors"
              >
                www.fluxconsultancy.co.uk
              </a>
            </p>

            {/* Right - Policy links */}
            <div className="flex items-center gap-6">
              <Link
                href="/returns-policy"
                className="text-xs font-semibold text-gray-500 hover:text-white transition-colors"
              >
                RETURNS
              </Link>
              <Link
                href="/privacy-policy"
                className="text-xs font-semibold text-gray-500 hover:text-white transition-colors"
              >
                PRIVACY
              </Link>
              <Link
                href="/delivery-policy"
                className="text-xs font-semibold text-gray-500 hover:text-white transition-colors"
              >
                DELIVERY
              </Link>
            </div>
          </div>

          {/* Social links */}
          <div className="mt-8 flex justify-center gap-6">
            <a
              href={siteConfig.instagram}
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-500 hover:text-white transition-all hover:scale-125"
              aria-label="Instagram"
            >
              <Instagram size={20} />
            </a>
            <a
              href={siteConfig.tiktok}
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-500 hover:text-white transition-all hover:scale-125"
              aria-label="TikTok"
            >
              <svg
                className="w-5 h-5"
                viewBox="0 0 24 24"
                fill="currentColor"
              >
                <path d="M19.59 6.69a4.83 4.83 0 01-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 01-2.88 2.5 2.89 2.89 0 01-2.89-2.89 2.89 2.89 0 012.89-2.89c.28 0 .54.04.79.1V9.01a6.27 6.27 0 00-.79-.05 6.34 6.34 0 00-6.34 6.34 6.34 6.34 0 006.34 6.34 6.34 6.34 0 006.34-6.34V8.75a8.18 8.18 0 004.76 1.52V6.84a4.84 4.84 0 01-1-.15z" />
              </svg>
            </a>
            <a
              href={siteConfig.youtube}
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-500 hover:text-white transition-all hover:scale-125"
              aria-label="YouTube"
            >
              <svg
                className="w-5 h-5"
                viewBox="0 0 24 24"
                fill="currentColor"
              >
                <path d="M23.498 6.186a3.016 3.016 0 00-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 00.502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 002.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 002.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z" />
              </svg>
            </a>
            <a
              href={siteConfig.facebook}
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-500 hover:text-white transition-all hover:scale-125"
              aria-label="Facebook"
            >
              <svg
                className="w-5 h-5"
                viewBox="0 0 24 24"
                fill="currentColor"
              >
                <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
              </svg>
            </a>
          </div>
        </div>
      </div>
    </footer>
  );
}
