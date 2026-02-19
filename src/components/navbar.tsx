"use client";

import { useState, useEffect, useCallback } from "react";
import Link from "next/link";
import Image from "next/image";
import {
  User,
  ShoppingBag,
  Search,
  Menu,
  X,
  ChevronDown,
  ArrowRight,
} from "lucide-react";
import { navMenuData } from "@/data/products";
import { useCart } from "@/context/cart-context";

type MenuKey = "watches" | "jewellery" | "accessories" | "services" | "contact";

interface MenuItem {
  name: string;
  desc: string;
  link: string;
  image: string;
  external?: boolean;
}

const navLinks: { label: string; key: MenuKey | null; href: string }[] = [
  { label: "HOME", key: null, href: "/" },
  { label: "WATCHES", key: "watches", href: "/shop?category=watches" },
  { label: "JEWELLERY", key: "jewellery", href: "/shop?category=jewellery" },
  { label: "ACCESSORIES", key: "accessories", href: "/shop?category=accessories" },
];

const rightLinks: { label: string; key: MenuKey }[] = [
  { label: "OTHER SERVICES", key: "services" },
  { label: "ABOUT US", key: "contact" },
];

function getMenuItems(key: MenuKey): MenuItem[] {
  const data = navMenuData[key];
  if ("brands" in data) return data.brands;
  if ("categories" in data) return data.categories;
  if ("items" in data) return data.items;
  if ("offerings" in data) return data.offerings;
  if ("links" in data) return data.links;
  return [];
}

function getMenuDefaultImage(key: MenuKey): string {
  return navMenuData[key].defaultImage;
}

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);
  const [activeMenu, setActiveMenu] = useState<MenuKey | null>(null);
  const [hoveredImage, setHoveredImage] = useState<string | null>(null);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [mobileAccordion, setMobileAccordion] = useState<MenuKey | null>(null);
  const { cartCount, setIsCartOpen } = useCart();

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 10);
    window.addEventListener("scroll", onScroll, { passive: true });
    onScroll();
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  useEffect(() => {
    if (mobileOpen) {
      document.body.style.overflow = "hidden";
    } else {
      document.body.style.overflow = "";
    }
    return () => {
      document.body.style.overflow = "";
    };
  }, [mobileOpen]);

  const handleMenuEnter = useCallback((key: MenuKey | null) => {
    if (key) setActiveMenu(key);
  }, []);

  const handleNavLeave = useCallback(() => {
    setActiveMenu(null);
    setHoveredImage(null);
  }, []);

  const toggleMobileAccordion = (key: MenuKey) => {
    setMobileAccordion((prev) => (prev === key ? null : key));
  };

  const previewImage =
    activeMenu && hoveredImage
      ? hoveredImage
      : activeMenu
        ? getMenuDefaultImage(activeMenu)
        : null;

  return (
    <>
      <nav
        className={`fixed left-0 w-full bg-black border-b border-white z-50 transition-all duration-500 ${
          scrolled ? "top-0" : "top-12"
        }`}
        onMouseLeave={handleNavLeave}
      >
        {/* Main bar */}
        <div className="w-full mx-auto h-20 flex justify-between items-center relative z-50">
          {/* Mobile hamburger */}
          <button
            className="lg:hidden text-white p-1"
            onClick={() => setMobileOpen(true)}
            aria-label="Open menu"
          >
            <Menu size={24} />
          </button>

          {/* Left nav links - desktop */}
          <div className="hidden lg:flex gap-8 items-center w-5/12 justify-start pl-16">
            {navLinks.map((item, i) => (
              <div key={item.label} className="flex items-center">
                {i > 0 && (
                  <div className="h-7 w-px bg-gradient-to-b from-white via-gray-400 to-white opacity-50 mx-4" />
                )}
                <Link
                  href={item.href}
                  className="text-white text-sm font-semibold tracking-[0.2em] font-body hover:text-gray-300 transition-colors whitespace-nowrap"
                  onMouseEnter={() => handleMenuEnter(item.key)}
                >
                  {item.label}
                </Link>
              </div>
            ))}
          </div>

          {/* Center logo */}
          <div className="absolute left-1/2 transform -translate-x-1/2 flex flex-col items-center">
            <Link href="/" className="flex flex-col items-center">
              <Image
                src="/white-logo.png"
                alt="LKB Official Logo"
                width={120}
                height={48}
                className={`animate-logo-pop transition-all duration-300 ${
                  scrolled ? "h-10" : "h-12"
                } w-auto`}
                priority
              />
              <span
                className="text-white tracking-[0.15em] font-heading hidden sm:block"
                style={{ fontSize: "8px" }}
              >
                LOCAL KETTLE BROTHERS UK
              </span>
              <span
                className="text-white tracking-[0.3em] font-heading hidden sm:block"
                style={{ fontSize: "7px" }}
              >
                JEWELLERS
              </span>
            </Link>
          </div>

          {/* Right nav links + icons - desktop */}
          <div className="hidden lg:flex items-center justify-end w-5/12 pr-8">
            <div className="flex gap-8 items-center">
              {rightLinks.map((item, i) => (
                <div key={item.label} className="flex items-center">
                  {i > 0 && (
                    <div className="h-7 w-px bg-gradient-to-b from-white via-gray-400 to-white opacity-50 mr-8" />
                  )}
                  <span
                    className="text-white text-sm font-semibold tracking-[0.2em] font-body hover:text-gray-300 transition-colors cursor-pointer whitespace-nowrap py-6"
                    onMouseEnter={() => handleMenuEnter(item.key)}
                  >
                    {item.label}
                  </span>
                </div>
              ))}
            </div>

            <div className="h-7 w-px bg-gradient-to-b from-white via-gray-400 to-white opacity-50 mx-6" />

            {/* Icons */}
            <div className="flex items-center gap-6 ml-6">
              <button
                className="text-white hover:text-gold transition-colors focus:outline-none flex-shrink-0"
                aria-label="Account"
              >
                <User size={18} strokeWidth={2} />
              </button>
              <button
                className="relative group flex-shrink-0"
                aria-label="Cart"
                onClick={() => setIsCartOpen(true)}
              >
                <ShoppingBag size={18} strokeWidth={2} className="text-white group-hover:text-gray-300 transition-colors" />
                {cartCount > 0 && (
                  <span className="absolute -top-3 -right-3 bg-white text-black text-[9px] font-bold w-4 h-4 rounded-full flex items-center justify-center">
                    {cartCount}
                  </span>
                )}
              </button>
              <button
                className="text-white hover:text-gray-300 cursor-pointer transition-colors focus:outline-none flex-shrink-0"
                aria-label="Search"
              >
                <Search size={18} strokeWidth={2} />
              </button>
            </div>
          </div>

          {/* Mobile right icons */}
          <div className="flex lg:hidden items-center gap-4">
            <button
              className="text-white hover:text-gold transition-colors relative"
              aria-label="Cart"
              onClick={() => setIsCartOpen(true)}
            >
              <ShoppingBag size={18} />
              {cartCount > 0 && (
                <span className="absolute -top-3 -right-3 bg-white text-black text-[9px] font-bold w-4 h-4 rounded-full flex items-center justify-center">
                  {cartCount}
                </span>
              )}
            </button>
            <button
              className="text-white hover:text-gold transition-colors"
              aria-label="Search"
            >
              <Search size={18} />
            </button>
            <button
              className="text-white hover:text-gold transition-colors"
              aria-label="Account"
            >
              <User size={18} />
            </button>
          </div>
        </div>

        {/* Mega menu dropdown */}
        <div
          className={`absolute top-full left-0 w-full bg-black/95 backdrop-blur-xl border-b border-gray-800 transition-all duration-500 ease-in-out overflow-hidden ${
            activeMenu
              ? "max-h-[700px] opacity-100 visible"
              : "max-h-0 opacity-0 invisible"
          }`}
        >
          {activeMenu && (
            <div className="container mx-auto py-12 px-4 md:px-8">
              <div className="grid grid-cols-12 gap-8">
                {/* Left image preview */}
                <div className="col-span-3 hidden lg:block">
                  <div className="aspect-square relative overflow-hidden rounded-sm">
                    {previewImage && (
                      <Image
                        src={previewImage}
                        alt={navMenuData[activeMenu].title}
                        fill
                        className="object-cover transition-all duration-500"
                        sizes="25vw"
                      />
                    )}
                    <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent" />
                  </div>
                </div>

                {/* Right menu items */}
                <div className="col-span-12 lg:col-span-9">
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-x-12 gap-y-8">
                    {getMenuItems(activeMenu).map((item) => {
                      const isExternal =
                        "external" in item && item.external;
                      const Wrapper = isExternal ? "a" : Link;
                      const wrapperProps = isExternal
                        ? {
                            href: item.link,
                            target: "_blank" as const,
                            rel: "noopener noreferrer",
                          }
                        : { href: item.link };

                      return (
                        <Wrapper
                          key={item.name}
                          {...(wrapperProps as any)}
                          className="group border-b border-gray-900 pb-6 hover:border-gold/30 transition-colors flex items-center justify-between"
                          onMouseEnter={() => setHoveredImage(item.image)}
                          onMouseLeave={() => setHoveredImage(null)}
                          onClick={() => setActiveMenu(null)}
                        >
                          <div>
                            <h3 className="text-2xl font-light text-white group-hover:text-gold transition-colors font-heading">
                              {item.name}
                            </h3>
                            <p className="text-gray-500 text-sm tracking-wide mt-1">
                              {item.desc}
                            </p>
                          </div>
                          <ArrowRight
                            size={18}
                            className="text-gold opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex-shrink-0 ml-4"
                          />
                        </Wrapper>
                      );
                    })}
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
      </nav>

      {/* Mobile menu overlay */}
      <div
        className={`fixed inset-0 z-[60] bg-black transition-transform duration-500 ease-in-out ${
          mobileOpen ? "translate-x-0" : "-translate-x-full"
        }`}
      >
        {/* Mobile header */}
        <div className="flex items-center justify-between h-20 px-4 border-b border-gray-800">
          <Link
            href="/"
            onClick={() => setMobileOpen(false)}
            className="flex items-center"
          >
            <Image
              src="/white-logo.png"
              alt="LKB Official Logo"
              width={100}
              height={40}
              className="h-10 w-auto"
            />
          </Link>
          <button
            className="text-white p-1"
            onClick={() => setMobileOpen(false)}
            aria-label="Close menu"
          >
            <X size={24} />
          </button>
        </div>

        {/* Mobile menu items */}
        <div className="overflow-y-auto h-[calc(100vh-80px)] pb-32">
          <div className="flex flex-col">
            {/* HOME */}
            <Link
              href="/"
              className="text-white text-sm font-semibold tracking-[0.2em] font-body px-6 py-5 border-b border-gray-900 hover:bg-gray-900/50 transition-colors"
              onClick={() => setMobileOpen(false)}
            >
              HOME
            </Link>

            {/* Accordion items */}
            {(
              [
                { label: "WATCHES", key: "watches" as MenuKey },
                { label: "JEWELLERY", key: "jewellery" as MenuKey },
                { label: "ACCESSORIES", key: "accessories" as MenuKey },
                { label: "OTHER SERVICES", key: "services" as MenuKey },
                { label: "ABOUT US", key: "contact" as MenuKey },
              ] as const
            ).map((section) => (
              <div key={section.key} className="border-b border-gray-900">
                <button
                  className="w-full flex items-center justify-between text-white text-sm font-semibold tracking-[0.2em] font-body px-6 py-5 hover:bg-gray-900/50 transition-colors"
                  onClick={() => toggleMobileAccordion(section.key)}
                >
                  <span>{section.label}</span>
                  <ChevronDown
                    size={18}
                    className={`text-gray-400 transition-transform duration-300 ${
                      mobileAccordion === section.key ? "rotate-180" : ""
                    }`}
                  />
                </button>
                <div
                  className={`overflow-hidden transition-all duration-300 ${
                    mobileAccordion === section.key
                      ? "max-h-[500px] opacity-100"
                      : "max-h-0 opacity-0"
                  }`}
                >
                  {getMenuItems(section.key).map((item) => {
                    const isExternal = "external" in item && item.external;

                    if (isExternal) {
                      return (
                        <a
                          key={item.name}
                          href={item.link}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="block px-10 py-3 text-gray-400 text-sm tracking-wide hover:text-white hover:bg-gray-900/30 transition-colors"
                          onClick={() => setMobileOpen(false)}
                        >
                          {item.name}
                        </a>
                      );
                    }

                    return (
                      <Link
                        key={item.name}
                        href={item.link}
                        className="block px-10 py-3 text-gray-400 text-sm tracking-wide hover:text-white hover:bg-gray-900/30 transition-colors"
                        onClick={() => setMobileOpen(false)}
                      >
                        {item.name}
                      </Link>
                    );
                  })}
                </div>
              </div>
            ))}
          </div>

          {/* Bottom: Login / Sign Up */}
          <div className="px-6 py-8 mt-4 flex flex-col gap-3">
            <Link
              href="/login"
              className="w-full py-3 border border-white text-white text-sm font-semibold tracking-[0.2em] text-center hover:bg-white hover:text-black transition-colors"
              onClick={() => setMobileOpen(false)}
            >
              LOGIN
            </Link>
            <Link
              href="/signup"
              className="w-full py-3 bg-white text-black text-sm font-semibold tracking-[0.2em] text-center hover:bg-gold hover:text-black transition-colors"
              onClick={() => setMobileOpen(false)}
            >
              SIGN UP
            </Link>
          </div>
        </div>
      </div>
    </>
  );
}
