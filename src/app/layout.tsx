import type { Metadata } from "next";
import { Montserrat, Prata } from "next/font/google";
import "./globals.css";
import { CartProvider } from "@/context/cart-context";
import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import TopBanner from "@/components/top-banner";
import EntranceOverlay from "@/components/entrance-overlay";
import FloatingButtons from "@/components/floating-buttons";

const montserrat = Montserrat({
  variable: "--font-montserrat",
  subsets: ["latin"],
  weight: ["300", "400", "500", "600", "700", "800"],
});

const prata = Prata({
  variable: "--font-prata",
  subsets: ["latin"],
  weight: "400",
});

export const metadata: Metadata = {
  title:
    "LKB Jewellers - Luxury Jewelry & Watches | Hatton Garden London | Premium Timepieces",
  description:
    "Discover luxury watches, bespoke jewelry & diamond pieces at LKB Jewellers, Hatton Garden London's premier specialists. Exclusive timepieces & custom jewelry. Rolex, Patek Philippe, Richard Mille dealer.",
  keywords:
    "LKB Jewellers, Local Kettle Brothers UK, Hatton Garden jewellers, luxury watches London, bespoke jewelry London",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${montserrat.variable} ${prata.variable} antialiased`}
        style={{ fontFamily: '"Montserrat", sans-serif' }}
        suppressHydrationWarning
      >
        <CartProvider>
          <EntranceOverlay />
          <TopBanner />
          <Navbar />
          <main>{children}</main>
          <Footer />
          <FloatingButtons />
        </CartProvider>
      </body>
    </html>
  );
}
