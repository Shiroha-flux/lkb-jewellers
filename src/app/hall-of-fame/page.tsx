"use client";

import { useState, useRef, useCallback } from "react";
import Image from "next/image";
import { Crown } from "lucide-react";
import ShowroomSection from "@/components/showroom-section";

const pieces = [
	{
		id: 1, name: "MIAMI CUBAN CHAIN", year: "2024", piece: "24mm Raised Diamond Pointer",
		image: "https://i.ibb.co/m5z17bfC/1.jpg",
		description: "Miami Cuban chains boasting distinctive interlocking links and weighty design. Meticulously set by our accomplished in-house team.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
	{
		id: 2, name: "ETERNITY RING", year: "2024", piece: "Rose Gold Diamond Collection",
		image: "https://i.ibb.co/9m8McVnp/1.jpg",
		description: "Custom-crafted masterpiece featuring 1.9ct center diamond with 18kt Rose Gold ring, weighing 3.90 grams.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
	{
		id: 3, name: "BESPOKE PENDANT", year: "2023", piece: "JH Custom Diamond",
		image: "https://i.ibb.co/4ZTkytsR/JEWELLERY-WEB-NEW-03.jpg",
		description: "Celebration of style boasting 32.04 carats of rounds and 24.26 carats of emeralds. Set in 10 karat gold.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
	{
		id: 4, name: "GMT MASTER II", year: "2023", piece: "Rolex Batman",
		image: "https://i.ibb.co/wNpxTJ2p/Batman-Updated.jpg",
		description: "Indispensable tool for travelers and coveted symbol of esteem. Dual-time functionality with impeccable precision.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
	{
		id: 5, name: "DAY-DATE 40", year: "2023", piece: "Presidential Collection",
		image: "https://i.ibb.co/pjSNH9hF/ALL-WEB-NEW-BATCH-NO-SERIAL-003.jpg",
		description: "Symphony of precious metals bearing witness to the passage of time with enduring grace.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
	{
		id: 6, name: "LADY DATEJUST", year: "2023", piece: "26mm Jubilee Bracelet",
		image: "https://i.ibb.co/1YRbTLrR/WEBNEWUPDATED4-9.jpg",
		description: "Refined elegance with iconic Jubilee bracelet. A companion to every occasion and treasured heirloom.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
	{
		id: 7, name: "SKY-DWELLER", year: "2023", piece: "Annual Calendar GMT",
		image: "https://i.ibb.co/rGL5jGbS/ALL-WEB-NEW-BATCH-NO-SERIAL-005.jpg",
		description: "Marvel of mechanical complexity with Ring Command Bezel. Tradition and innovation for discerning globetrotters.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
	{
		id: 8, name: "SUBMARINER DATE", year: "2023", piece: "Professional Dive Watch",
		image: "https://i.ibb.co/rGJLnKdq/ALL-WEB-NEW-BATCH-NO-SERIAL-009.jpg",
		description: "Refined elegance that seamlessly transitions from sea to land. An embodiment of the spirit of exploration.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
	{
		id: 9, name: "DATEJUST 41", year: "2023", piece: "Oystersteel & Gold",
		image: "https://i.ibb.co/PvBy0dsp/ALL-WEB-NEW-BATCH-NO-SERIAL-011.jpg",
		description: "Silent companion to history in the making. From iconic figures to captains of industry.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
	{
		id: 10, name: "LKB FLAGSHIP", year: "2023", piece: "Signature Pendant",
		image: "https://i.ibb.co/HL7M6Kxv/LKB-web15thfeb-24-scaled.jpg",
		description: "Our flagship pendant representing the pinnacle of LKB craftsmanship and exclusive design excellence.",
		category: "Exclusive Jewellery", status: "Custom Piece",
	},
];

export default function HallOfFamePage() {
	const [activeIndex, setActiveIndex] = useState(0);
	const carouselRef = useRef<HTMLDivElement>(null);
	const current = pieces[activeIndex];

	const handleWheel = useCallback((e: React.WheelEvent) => {
		e.preventDefault();
		if (e.deltaY > 0) {
			setActiveIndex((prev) => Math.min(prev + 1, pieces.length - 1));
		} else {
			setActiveIndex((prev) => Math.max(prev - 1, 0));
		}
	}, []);

	const touchStartY = useRef(0);
	const handleTouchStart = (e: React.TouchEvent) => {
		touchStartY.current = e.touches[0].clientY;
	};
	const handleTouchEnd = (e: React.TouchEvent) => {
		const delta = touchStartY.current - e.changedTouches[0].clientY;
		if (delta > 30) setActiveIndex((prev) => Math.min(prev + 1, pieces.length - 1));
		if (delta < -30) setActiveIndex((prev) => Math.max(prev - 1, 0));
	};

	return (
		<div className="bg-black min-h-screen text-white">
			{/* ===== MAIN SECTION ===== */}
			<section className="pt-32 md:pt-40 pb-16 md:pb-24 px-4 md:px-6">
				<div className="container mx-auto max-w-7xl">
					{/* Header */}
					<div className="text-center mb-12">
						<h2 className="text-white text-sm tracking-[0.3em] uppercase mb-4 font-heading">HALL OF FAME</h2>
						<p className="text-gray-400 text-base max-w-2xl mx-auto" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
							Celebrating our distinguished clientele and their extraordinary pieces
						</p>
					</div>

					{/* 2-Panel Layout */}
					<div className="grid grid-cols-1 lg:grid-cols-5 gap-6 lg:gap-8">
						{/* LEFT - Vertical Carousel */}
						<div className="lg:col-span-2 order-2 lg:order-1">
							<div className="text-center mb-4">
								<h3 className="text-[#D4AF37] text-xl font-heading mb-1">Our Clients</h3>
								<p className="text-gray-500 text-xs tracking-widest uppercase hidden md:block">Scroll to Navigate</p>
								<p className="text-gray-500 text-xs tracking-widest uppercase md:hidden">Swipe to Navigate</p>
							</div>

							{/* Carousel */}
							<div
								ref={carouselRef}
								className="relative h-[300px] md:h-[400px] overflow-hidden border border-gray-800/50 rounded-lg bg-gray-900/20 cursor-pointer"
								style={{ perspective: "1000px" }}
								onWheel={handleWheel}
								onTouchStart={handleTouchStart}
								onTouchEnd={handleTouchEnd}
							>
								{/* Top/bottom fade */}
								<div className="absolute top-0 left-0 right-0 h-16 bg-gradient-to-b from-black to-transparent z-10 pointer-events-none" />
								<div className="absolute bottom-0 left-0 right-0 h-16 bg-gradient-to-t from-black to-transparent z-10 pointer-events-none" />

								{/* Center highlight line */}
								<div className="absolute top-1/2 left-0 right-0 -translate-y-1/2 h-px bg-gradient-to-r from-transparent via-[#D4AF37]/60 to-transparent z-[5]" />

								{/* Items */}
								<div className="absolute inset-0 flex flex-col items-center justify-center">
									{pieces.map((item, i) => {
										const offset = i - activeIndex;
										const absOffset = Math.abs(offset);
										const isActive = i === activeIndex;

										if (absOffset > 3) return null;

										return (
											<button
												key={item.id}
												onClick={() => setActiveIndex(i)}
												className="absolute w-full text-center transition-all duration-500 ease-out px-4"
												style={{
													transform: `translateY(${offset * 50}px) scale(${isActive ? 1 : 1 - absOffset * 0.1})`,
													opacity: isActive ? 1 : Math.max(0, 1 - absOffset * 0.35),
													zIndex: isActive ? 10 : 5 - absOffset,
												}}
											>
												{isActive ? (
													<div className="py-3 bg-gradient-to-r from-transparent via-[#D4AF37]/10 to-transparent">
														<div className="relative inline-block px-8 py-2">
															<div className="absolute top-0 left-0 w-3 h-3 border-t border-l border-[#D4AF37]/50" />
															<div className="absolute top-0 right-0 w-3 h-3 border-t border-r border-[#D4AF37]/50" />
															<div className="absolute bottom-0 left-0 w-3 h-3 border-b border-l border-[#D4AF37]/50" />
															<div className="absolute bottom-0 right-0 w-3 h-3 border-b border-r border-[#D4AF37]/50" />
															<p className="text-white text-base md:text-lg tracking-[0.15em] font-heading">{item.name}</p>
															<p className="text-[#D4AF37] text-xs tracking-[0.25em] uppercase mt-1">{item.year}</p>
														</div>
													</div>
												) : (
													<div className="py-2">
														<div className="relative inline-block px-6">
															<div className="absolute top-0 left-0 w-2 h-2 border-t border-l border-gray-700/50" />
															<div className="absolute top-0 right-0 w-2 h-2 border-t border-r border-gray-700/50" />
															<div className="absolute bottom-0 left-0 w-2 h-2 border-b border-l border-gray-700/50" />
															<div className="absolute bottom-0 right-0 w-2 h-2 border-b border-r border-gray-700/50" />
															<p className="text-gray-500 text-sm tracking-[0.1em] font-heading">{item.name}</p>
														</div>
													</div>
												)}
											</button>
										);
									})}
								</div>
							</div>

							{/* Counter */}
							<p className="text-center text-gray-400 text-xs tracking-widest uppercase mt-3 font-medium">
								{activeIndex + 1} / {pieces.length}
							</p>
						</div>

						{/* RIGHT - Detail Panel */}
						<div className="lg:col-span-3 order-1 lg:order-2">
							<div className="bg-gray-900/30 border border-gray-800 rounded-lg overflow-hidden h-[400px] md:h-[500px] flex flex-col">
								{/* Image Area */}
								<div className="relative h-60 md:h-80 bg-black overflow-hidden group">
									<Image
										src={current.image}
										alt={current.piece}
										fill
										className="object-contain group-hover:scale-105 transition-transform duration-500"
										sizes="(max-width: 1024px) 100vw, 60vw"
									/>
									<div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent" />
									<div className="absolute bottom-0 left-0 right-0 p-4 md:p-6 z-10 flex justify-between items-end">
										<div>
											<p className="text-[#D4AF37] text-xs tracking-[0.25em] uppercase mb-1" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>Piece</p>
											<h2 className="text-white text-xl md:text-2xl lg:text-3xl font-bold font-heading">{current.piece}</h2>
										</div>
										<div className="text-right">
											<p className="text-gray-400 text-xs tracking-wider uppercase mb-1" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>Year</p>
											<p className="text-[#D4AF37] text-lg md:text-xl font-bold font-heading">{current.year}</p>
										</div>
									</div>
								</div>

								{/* Details Area */}
								<div className="p-4 md:p-6 border-t border-gray-800 flex-1">
									<div className="flex items-center gap-3 mb-3">
										<div className="flex-1 h-px bg-gradient-to-r from-transparent to-[#D4AF37]/40" />
										<Crown className="w-5 h-5 text-[#D4AF37]" />
										<div className="flex-1 h-px bg-gradient-to-l from-transparent to-[#D4AF37]/40" />
									</div>

									<h3 className="text-white text-lg md:text-xl tracking-wide font-bold font-heading mb-2">{current.name}</h3>
									<p className="text-gray-400 text-sm leading-relaxed mb-4" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
										{current.description}
									</p>

									<div className="grid grid-cols-2 gap-3">
										<div className="bg-black/50 p-3 border border-gray-800">
											<p className="text-gray-500 text-xs tracking-wider uppercase">Category</p>
											<p className="text-white font-semibold text-sm">{current.category}</p>
										</div>
										<div className="bg-black/50 p-3 border border-gray-800">
											<p className="text-gray-500 text-xs tracking-wider uppercase">Status</p>
											<p className="text-white font-semibold text-sm">{current.status}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			{/* ===== VISIT OUR SHOWROOM ===== */}
			<ShowroomSection />
		</div>
	);
}
