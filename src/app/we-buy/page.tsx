"use client";

import { useState } from "react";
import Image from "next/image";
import { FileText, Clock, MapPin, Wallet, Upload } from "lucide-react";
import { createSellSubmission } from "@/lib/sell-submissions";
import ShowroomSection from "@/components/showroom-section";

const steps = [
	{ icon: FileText, number: "01", text: "Complete the form below.", featured: true },
	{ icon: Clock, number: "02", text: "Receive an offer within 24 hours." },
	{ icon: MapPin, number: "03", text: "Visit our showroom or ship securely." },
	{ icon: Wallet, number: "04", text: "Instant payment via Bank Transfer." },
];

export default function WeBuyPage() {
	const [formData, setFormData] = useState({
		fullName: "", email: "", phone: "", brand: "", model: "", referenceNumber: "",
		yearOfManufacture: "", condition: "Mint", boxAndPapers: "Full Set (Box & Papers)",
		additionalInfo: "", isInternational: false, visitedOtherJewellers: false,
	});
	const [images, setImages] = useState<string[]>([]);
	const [uploading, setUploading] = useState(false);
	const [loading, setLoading] = useState(false);
	const [submitted, setSubmitted] = useState(false);

	const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>) => {
		const target = e.target;
		const value = target instanceof HTMLInputElement && target.type === "checkbox" ? target.checked : target.value;
		setFormData((prev) => ({ ...prev, [target.name]: value }));
	};

	const handleImageUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
		const files = e.target.files;
		if (!files?.length) return;
		setUploading(true);
		try {
			for (const file of Array.from(files).slice(0, 5 - images.length)) {
				const fd = new FormData();
				fd.append("image", file);
				const res = await fetch("https://api.imgbb.com/1/upload?key=21a4ec39ce5dad29e92c47325c7d0d73", { method: "POST", body: fd });
				const data = await res.json();
				if (data.success && data.data?.url) {
					setImages((prev) => [...prev, data.data.url]);
				}
			}
		} catch { /* ignore */ } finally { setUploading(false); }
	};

	const handleSubmit = async (e: React.FormEvent) => {
		e.preventDefault();
		setLoading(true);
		try {
			await createSellSubmission({
				full_name: formData.fullName,
				email: formData.email,
				phone: formData.phone,
				brand: formData.brand,
				model: formData.model,
				reference_number: formData.referenceNumber,
				year_of_manufacture: formData.yearOfManufacture,
				condition: formData.condition as "Excellent" | "Good" | "Fair" | "Poor",
				has_box: formData.boxAndPapers.includes("Box"),
				has_papers: formData.boxAndPapers.includes("Papers"),
				additional_info: formData.additionalInfo,
				images,
				status: "new",
			});
			setSubmitted(true);
		} catch (err) {
			console.error("Failed to submit:", err);
			alert("Failed to submit. Please try again.");
		} finally { setLoading(false); }
	};

	return (
		<div className="bg-black min-h-screen text-white">
			{/* ===== HERO ===== */}
			<section className="pt-32 md:pt-40 pb-12 md:pb-16 px-6 bg-[#050505] border-b border-gray-900">
				<div className="container mx-auto max-w-4xl text-center">
					<div className="flex items-center gap-4 mb-6 justify-center">
						<div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
						<span className="text-white text-xs tracking-[0.5em] uppercase" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
							Sell Your Pieces
						</span>
						<div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
					</div>
					<h1 className="text-4xl md:text-6xl text-white mb-6 font-heading">
						Sell Your Watch
					</h1>
					<p className="text-gray-400 text-lg max-w-2xl mx-auto" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
						Secure the best market value for your timepiece with our streamlined, secure selling process.
					</p>
				</div>
			</section>

			{/* ===== PROCESS STEPS ===== */}
			<section className="py-16 md:py-24 px-6">
				<div className="container mx-auto max-w-5xl">
					<div className="relative">
						{/* Connecting line */}
						<div className="hidden md:block absolute top-10 left-0 w-full h-0.5 bg-gray-900" />
						<div className="grid grid-cols-1 md:grid-cols-4 gap-12 text-center">
							{steps.map((step) => (
								<div key={step.number} className="relative">
									<div className={`w-20 h-20 mx-auto rounded-full border-2 flex items-center justify-center mb-4 relative z-10 bg-black ${
										step.featured ? "border-[#D4AF37]" : "border-gray-800"
									}`}>
										<step.icon className={`w-8 h-8 ${step.featured ? "text-[#D4AF37]" : "text-gray-500"}`} />
									</div>
									<h3 className="text-[#D4AF37] text-2xl font-bold mb-2 font-heading">{step.number}</h3>
									<p className="text-gray-400 text-sm" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
										{step.text}
									</p>
								</div>
							))}
						</div>
					</div>
				</div>
			</section>

			{/* ===== SELL FORM ===== */}
			<section className="py-16 md:py-24 px-6">
				<div className="container mx-auto max-w-4xl">
					{submitted ? (
						<div className="bg-[#0a0a0a] border border-gray-900 p-8 md:p-16 rounded-sm shadow-2xl text-center">
							<div className="w-16 h-16 mx-auto mb-4 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center">
								<FileText className="w-7 h-7 text-[#D4AF37]" />
							</div>
							<h3 className="text-2xl text-white mb-2 font-heading">Submission Received</h3>
							<p className="text-gray-400 mb-6">Thank you! Our team will review your submission and contact you within 24 hours with a valuation.</p>
							<button onClick={() => { setSubmitted(false); setImages([]); }} className="text-[#D4AF37] text-sm tracking-widest hover:underline">
								SUBMIT ANOTHER ITEM
							</button>
						</div>
					) : (
						<form onSubmit={handleSubmit} className="bg-[#0a0a0a] border border-gray-900 p-8 md:p-16 rounded-sm shadow-2xl space-y-12">
							{/* Personal Information */}
							<div>
								<h3 className="text-[#D4AF37] text-xs tracking-[0.3em] uppercase border-b border-gray-800 pb-3 mb-8">
									Personal Information
								</h3>
								<div className="grid grid-cols-1 md:grid-cols-2 gap-8">
									<div>
										<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Full Name *</label>
										<input type="text" name="fullName" value={formData.fullName} onChange={handleChange} required placeholder="Enter your name..."
											className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-700" />
									</div>
									<div>
										<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Email Address *</label>
										<input type="email" name="email" value={formData.email} onChange={handleChange} required placeholder="Enter your email..."
											className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-700" />
									</div>
								</div>
								<div className="mt-8">
									<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Telephone *</label>
									<input type="tel" name="phone" value={formData.phone} onChange={handleChange} required placeholder="+44 20 1234 5678"
										className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-700" />
								</div>
								<div className="border-t border-gray-800 mt-8 pt-6">
									<label className="flex items-center gap-3 cursor-pointer">
										<input type="checkbox" name="isInternational" checked={formData.isInternational} onChange={handleChange} className="w-4 h-4 accent-[#D4AF37]" />
										<span className="text-gray-400 text-sm">I am an international client</span>
									</label>
								</div>
							</div>

							{/* Watch Details */}
							<div>
								<h3 className="text-[#D4AF37] text-xs tracking-[0.3em] uppercase border-b border-gray-800 pb-3 mb-8">
									Watch Details
								</h3>
								<div className="grid grid-cols-1 md:grid-cols-2 gap-8">
									<div>
										<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Make *</label>
										<input type="text" name="brand" value={formData.brand} onChange={handleChange} required placeholder="e.g. Rolex"
											className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-700" />
									</div>
									<div>
										<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Model *</label>
										<input type="text" name="model" value={formData.model} onChange={handleChange} required placeholder="e.g. Submariner"
											className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-700" />
									</div>
									<div>
										<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Serial Number (Optional)</label>
										<input type="text" name="referenceNumber" value={formData.referenceNumber} onChange={handleChange} placeholder="Serial Number..."
											className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-700" />
									</div>
									<div>
										<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Age / Year</label>
										<input type="text" name="yearOfManufacture" value={formData.yearOfManufacture} onChange={handleChange} placeholder="e.g. 2022 or Brand New"
											className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-700" />
									</div>
								</div>
								<div className="grid grid-cols-1 md:grid-cols-2 gap-8 mt-8">
									<div>
										<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Box &amp; Papers?</label>
										<select name="boxAndPapers" value={formData.boxAndPapers} onChange={handleChange}
											className="w-full bg-[#0a0a0a] border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors">
											<option value="Full Set (Box & Papers)">Full Set (Box &amp; Papers)</option>
											<option value="Box Only">Box Only</option>
											<option value="Papers Only">Papers Only</option>
											<option value="Watch Only">Watch Only</option>
										</select>
									</div>
									<div>
										<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Condition</label>
										<select name="condition" value={formData.condition} onChange={handleChange}
											className="w-full bg-[#0a0a0a] border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors">
											<option value="Mint">Mint</option>
											<option value="Excellent">Excellent</option>
											<option value="Very Good">Very Good</option>
											<option value="Good">Good</option>
											<option value="Fair">Fair</option>
										</select>
									</div>
								</div>
								<div className="mt-8">
									<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Message / Additional Details</label>
									<textarea name="additionalInfo" value={formData.additionalInfo} onChange={handleChange} rows={4} placeholder="Please describe any scratches, servicing history, or specific details..."
										className="w-full bg-transparent border border-gray-800 text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors resize-none placeholder:text-gray-700" />
								</div>
								<div className="mt-8">
									<label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">Upload Watch Photos (Max 5)</label>
									<label className="flex flex-col items-center justify-center gap-2 p-8 border-2 border-dashed border-gray-800 text-center cursor-pointer hover:border-gray-600 transition-colors">
										<Upload className="w-8 h-8 text-gray-600" />
										<span className="text-gray-500 text-sm">
											Drag &amp; Drop Photos Here or <span className="text-[#D4AF37] underline">Browse</span>
										</span>
										<span className="text-gray-600 text-xs">Upload up to 5 images (Max 5MB each) - {images.length}/5 uploaded</span>
										<input type="file" accept="image/*" multiple onChange={handleImageUpload} disabled={uploading || images.length >= 5} className="hidden" />
									</label>
									{images.length > 0 && (
										<div className="flex gap-2 mt-3">
											{images.map((img, i) => (
												<div key={i} className="relative w-16 h-16 rounded overflow-hidden border border-gray-800">
													<Image src={img} alt={`Upload ${i + 1}`} fill className="object-cover" sizes="64px" />
												</div>
											))}
										</div>
									)}
								</div>
								<div className="border-t border-gray-800 mt-8 pt-8">
									<label className="flex items-center gap-3 cursor-pointer">
										<input type="checkbox" name="visitedOtherJewellers" checked={formData.visitedOtherJewellers} onChange={handleChange} className="w-4 h-4 accent-[#D4AF37]" />
										<span className="text-gray-400 text-sm">Have you visited other jewellers for this item?</span>
									</label>
								</div>
							</div>

							{/* Submit */}
							<div className="text-right">
								<button type="submit" disabled={loading}
									className="bg-[#D4AF37] text-black px-12 py-4 font-bold rounded-sm text-lg hover:bg-[#c5a030] transition-colors disabled:opacity-50">
									{loading ? "Submitting..." : "Submit Enquiry"}
								</button>
							</div>
						</form>
					)}
				</div>
			</section>

			{/* ===== VISIT OUR SHOWROOM ===== */}
			<ShowroomSection />
		</div>
	);
}
