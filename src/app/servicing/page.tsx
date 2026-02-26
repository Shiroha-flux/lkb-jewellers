"use client";

import { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { Sparkles, Wrench, Clock, Droplet, Shield, Watch, CircleCheckBig } from "lucide-react";
import ShowroomSection from "@/components/showroom-section";

const services = [
	{ icon: Wrench, title: "FULL MAINTENANCE SERVICE", description: "Complete mechanical overhaul and cleaning" },
	{ icon: Clock, title: "TIMEKEEPING TESTS", description: "Precision accuracy verification", featured: true },
	{ icon: Droplet, title: "WATERPROOFING", description: "Seal integrity and pressure testing" },
	{ icon: Shield, title: "RESEALING", description: "Gasket replacement and protection" },
	{ icon: Watch, title: "STRAP CHANGES", description: "Professional fitting and adjustment" },
	{ icon: Sparkles, title: "POLISHING", description: "Starting from £150" },
];

const servicingImages = [
	"/about-us/srd-3.webp",
	"/about-us/srd-3.webp",
	"/about-us/srd-3.webp",
];

export default function ServicingPage() {
	const [activeImage, setActiveImage] = useState(0);

	return (
		<div className="bg-black min-h-screen text-white">
			{/* ===== HERO ===== */}
			<section className="relative pt-32 md:pt-40 pb-16 md:pb-24 overflow-hidden">
				{/* Decorative blurred circles */}
				<div className="absolute top-1/4 left-1/4 w-64 h-64 bg-[#D4AF37]/10 rounded-full blur-[120px] animate-pulse" />
				<div className="absolute bottom-1/4 right-1/4 w-48 h-48 bg-blue-500/5 rounded-full blur-[100px] animate-pulse" style={{ animationDelay: "1s" }} />
				<div className="absolute top-1/2 right-1/3 w-32 h-32 bg-purple-500/5 rounded-full blur-[80px] animate-pulse" style={{ animationDelay: "2s" }} />

				<div className="container mx-auto px-6 text-center relative z-10">
					<Sparkles className="w-10 h-10 text-[#D4AF37] mx-auto mb-6 animate-pulse" />
					<h1 className="text-4xl md:text-6xl lg:text-7xl text-white mb-6 font-heading">
						Expert Watch Servicing
					</h1>
					<div className="w-[40rem] max-w-full h-px bg-gradient-to-r from-transparent via-[#D4AF37] to-transparent mx-auto mb-6" />
					<p className="text-gray-400 text-lg md:text-xl max-w-2xl mx-auto" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
						Rolex-trained watchmakers with decades of expertise
					</p>
				</div>
			</section>

			{/* ===== SERVICES GRID ===== */}
			<section className="py-16 md:py-24">
				<div className="container mx-auto px-6 max-w-6xl">
					<h2 className="text-center text-white text-sm tracking-[0.3em] uppercase mb-12" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
						Our Watch Services Include
					</h2>
					<div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-6 gap-4">
						{services.map((service) => (
							<div
								key={service.title}
								className={`relative text-center p-6 rounded-lg border transition-all duration-300 ${
									service.featured
										? "border-[#D4AF37]/50 bg-gradient-to-b from-[#D4AF37]/10 to-transparent scale-105"
										: "border-gray-800 bg-gray-900/30 hover:border-gray-700"
								}`}
							>
								{service.featured && (
									<CircleCheckBig className="absolute top-3 right-3 w-5 h-5 text-[#D4AF37] animate-pulse" />
								)}
								<div className={`w-12 h-12 mx-auto mb-4 rounded-full flex items-center justify-center ${
									service.featured ? "bg-gradient-to-br from-blue-600 to-blue-800" : "bg-gray-800/50"
								}`}>
									<service.icon className={`w-5 h-5 ${service.featured ? "text-white" : "text-[#D4AF37]"}`} />
								</div>
								<h3 className={`text-xs font-heading mb-2 tracking-wide ${service.featured ? "text-[#D4AF37]" : "text-white"}`}>
									{service.title}
								</h3>
								<p className="text-gray-500 text-xs" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
									{service.description}
								</p>
							</div>
						))}
					</div>
				</div>
			</section>

			{/* ===== DIRECTOR QUOTE ===== */}
			<section className="py-16 md:py-24 bg-gradient-to-b from-black via-gray-900/30 to-black">
				<div className="container mx-auto px-6 max-w-3xl text-center">
					<div className="border border-[#D4AF37]/30 rounded-lg backdrop-blur-sm p-8 md:p-12">
						<div className="w-80 max-w-full h-px bg-white/20 mx-auto mb-8" />
						<p className="text-[#D4AF37] text-lg md:text-xl italic leading-relaxed" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
							&ldquo;Meet Robert James Holt. Our appointed Director of our Service &amp; Warranty Department.&rdquo;
						</p>
						<div className="w-80 max-w-full h-px bg-white/20 mx-auto mt-8" />
					</div>
				</div>
			</section>

			{/* ===== ABOUT SERVICING + IMAGE CAROUSEL ===== */}
			<section className="py-16 md:py-24">
				<div className="container mx-auto px-6 max-w-6xl">
					<div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-12">
						{/* Left - Text */}
						<div className="space-y-4">
							<div className="border border-gray-800 rounded-lg p-6 bg-gray-900/20">
								<p className="text-gray-400 text-sm leading-relaxed" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
									Servicing your watch with The Local Kettle Brothers remains a luxurious experience. We take pride in placing your watch in the most skilled and capable hands ensuring it receives the utmost care and expertise it deserves. We provide a complimentary 1 year Local Kettle Brother&apos;s warranty with all watch purchases.
								</p>
							</div>
							<div className="border border-gray-800 rounded-lg p-6 bg-gray-900/20">
								<p className="text-gray-400 text-sm leading-relaxed" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
									At Local Kettle Brothers UK, we provide meticulous watch servicing to ensure the longevity and precision of your timepiece. Every intricate mechanism within your mechanical watch plays a crucial role in keeping time accurate. Similar to caring for your car, it is financially wise to prioritize the maintenance of your valuable watch.
								</p>
							</div>
							<div className="border border-gray-800 rounded-lg p-6 bg-gray-900/20">
								<p className="text-gray-400 text-sm leading-relaxed" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
									When it comes to opening your watchcase for servicing or waterproofing, it is imperative to entrust the task to a highly skilled watchmaker equipped with the necessary testing tools. Our team of Rolex-trained watchmakers at Local Kettle Brothers UK possesses extensive experience in the intricate art of watch servicing.
								</p>
							</div>
							<div className="border border-gray-800 rounded-lg p-6 bg-gray-900/20">
								<p className="text-gray-400 text-sm leading-relaxed" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
									In addition to comprehensive repair services, we offer a range of specialized services including battery replacement, maintenance servicing, timekeeping testing, waterproofing, and resealing. Your watch is in capable hands with us, ensuring it remains a reliable companion for years to come.
								</p>
							</div>
							<div className="flex items-center gap-3 pt-4">
								<Link href="/contact" className="inline-flex items-center gap-2 bg-white text-black px-8 py-3 font-bold tracking-widest text-sm hover:bg-gray-200 transition-colors">
									BOOK CONSULTATION
								</Link>
								<Watch className="w-5 h-5 text-white" />
							</div>
						</div>

						{/* Right - Image Carousel */}
						<div>
							<div className="relative h-[480px] rounded-lg overflow-hidden mb-4">
								<Image
									src={servicingImages[activeImage]}
									alt={`Watch servicing ${activeImage + 1}`}
									fill
									className="object-cover"
									sizes="(max-width: 1024px) 100vw, 50vw"
								/>
								<div className="absolute bottom-4 right-4 bg-black/60 text-white text-xs px-3 py-1 rounded">
									{activeImage + 1} / {servicingImages.length}
								</div>
							</div>
							<div className="grid grid-cols-6 gap-2">
								{servicingImages.map((img, i) => (
									<button
										key={i}
										onClick={() => setActiveImage(i)}
										className={`relative h-20 rounded overflow-hidden border-2 transition-colors ${
											activeImage === i ? "border-[#D4AF37]" : "border-gray-800 hover:border-gray-600"
										}`}
									>
										<Image src={img} alt={`Thumbnail ${i + 1}`} fill className="object-cover" sizes="80px" />
									</button>
								))}
							</div>
						</div>
					</div>
				</div>
			</section>

			{/* ===== WARRANTY SECTION ===== */}
			<section className="py-16 md:py-24 bg-gradient-to-b from-black via-gray-900/30 to-black">
				<div className="container mx-auto px-6 max-w-4xl">
					<div className="border border-white/20 rounded-2xl p-8 md:p-12 text-center mb-12">
						<Shield className="w-20 h-20 text-[#D4AF37] mx-auto mb-6" />
						<h3 className="text-3xl md:text-4xl text-white mb-3 font-heading">1 Year Warranty</h3>
						<p className="text-gray-400 text-lg" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
							Complimentary with all watch purchases
						</p>
					</div>
					<div className="grid grid-cols-1 md:grid-cols-3 gap-6">
						{[
							{ title: "Expert Care", desc: "Rolex-trained specialists" },
							{ title: "Genuine Parts", desc: "Only authentic components" },
							{ title: "Full Coverage", desc: "Comprehensive protection" },
						].map((item) => (
							<div key={item.title} className="text-center p-6 border border-gray-800 rounded-lg bg-gray-900/20">
								<CircleCheckBig className="w-8 h-8 text-[#D4AF37] mx-auto mb-4" />
								<h4 className="text-white text-lg mb-2 font-heading">{item.title}</h4>
								<p className="text-gray-400 text-sm" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
									{item.desc}
								</p>
							</div>
						))}
					</div>
				</div>
			</section>

			{/* ===== VISIT OUR SHOWROOM ===== */}
			<ShowroomSection />
		</div>
	);
}
