"use client";

import { useState } from "react";
import Image from "next/image";
import { Phone, Mail, MapPin, Clock, ArrowRight, Navigation } from "lucide-react";
import { createContact } from "@/lib/contacts";
import ShowroomSection from "@/components/showroom-section";

export default function ContactPage() {
	const [formData, setFormData] = useState({
		firstName: "", lastName: "", email: "", phone: "", interest: "", message: "",
	});
	const [loading, setLoading] = useState(false);
	const [submitted, setSubmitted] = useState(false);

	const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
		setFormData((prev) => ({ ...prev, [e.target.name]: e.target.value }));
	};

	const handleSubmit = async (e: React.FormEvent) => {
		e.preventDefault();
		setLoading(true);
		try {
			await createContact({
				first_name: formData.firstName,
				last_name: formData.lastName,
				email: formData.email,
				phone: formData.phone,
				interest: formData.interest,
				message: formData.message,
				preferred_contact_method: "email",
				status: "new",
			});
			setSubmitted(true);
			setFormData({ firstName: "", lastName: "", email: "", phone: "", interest: "", message: "" });
		} catch (err) {
			console.error("Failed to submit contact:", err);
			alert("Failed to send message. Please try again.");
		} finally {
			setLoading(false);
		}
	};

	return (
		<div className="bg-black min-h-screen text-white">
			{/* ===== HERO: Image + Form ===== */}
			<section className="pt-24 md:pt-32">
				<div className="grid grid-cols-1 lg:grid-cols-2 min-h-[calc(100vh-6rem)]">
					{/* Left - Showroom Image */}
					<div className="relative h-[300px] lg:h-auto overflow-hidden">
						<Image
							src="/contactPage.png"
							alt="LKB Jewellers Showroom"
							fill
							className="object-cover"
							sizes="(max-width: 1024px) 100vw, 50vw"
							priority
						/>
						<div className="absolute inset-0 bg-black/20" />
					</div>

					{/* Right - Contact Form */}
					<div className="bg-black flex items-center justify-center p-8 md:p-12 lg:p-16">
						<div className="w-full max-w-lg">
							<p className="text-[#D4AF37] text-xs tracking-[0.3em] uppercase mb-4" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
								Contact Us
							</p>
							<h1 className="text-3xl md:text-4xl lg:text-5xl text-white mb-8 leading-tight font-heading">
								Let&apos;s Create Something Timeless
							</h1>

							{submitted ? (
								<div className="bg-gray-900/50 border border-[#D4AF37]/30 p-8 text-center">
									<div className="w-16 h-16 mx-auto mb-4 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center">
										<Mail className="w-7 h-7 text-[#D4AF37]" />
									</div>
									<h3 className="text-2xl text-white mb-2 font-heading">Message Sent!</h3>
									<p className="text-gray-400" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
										Thank you for reaching out. We&apos;ll respond within 24 hours.
									</p>
									<button onClick={() => setSubmitted(false)} className="mt-6 text-[#D4AF37] text-sm tracking-widest hover:underline uppercase">
										SEND ANOTHER MESSAGE
									</button>
								</div>
							) : (
								<form onSubmit={handleSubmit} className="space-y-6">
									<div className="grid grid-cols-1 md:grid-cols-2 gap-6">
										<div>
											<input
												type="text" name="firstName" value={formData.firstName} onChange={handleChange} required
												placeholder="FIRST NAME"
												className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-600 placeholder:text-xs placeholder:tracking-[0.2em]"
											/>
										</div>
										<div>
											<input
												type="text" name="lastName" value={formData.lastName} onChange={handleChange} required
												placeholder="LAST NAME"
												className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-600 placeholder:text-xs placeholder:tracking-[0.2em]"
											/>
										</div>
									</div>
									<div>
										<input
											type="email" name="email" value={formData.email} onChange={handleChange} required
											placeholder="EMAIL ADDRESS"
											className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-600 placeholder:text-xs placeholder:tracking-[0.2em]"
										/>
									</div>
									<div>
										<input
											type="tel" name="phone" value={formData.phone} onChange={handleChange} required
											placeholder="PHONE NUMBER"
											className="w-full bg-transparent border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors placeholder:text-gray-600 placeholder:text-xs placeholder:tracking-[0.2em]"
										/>
									</div>
									<div>
										<select
											name="interest" value={formData.interest} onChange={handleChange} required
											className="w-full bg-black border-b border-gray-800 text-white py-3 focus:outline-none focus:border-[#D4AF37] transition-colors appearance-none"
											style={{ fontSize: "16px" }}
										>
											<option value="" className="text-gray-600">INTERESTED IN...</option>
											<optgroup label="Products">
												<option value="Exclusive Watches">Exclusive Watches</option>
												<option value="Diamond Jewellery">Diamond Jewellery</option>
												<option value="Chains & Pendants">Chains &amp; Pendants</option>
												<option value="Rings & Wedding Bands">Rings &amp; Wedding Bands</option>
												<option value="Bracelets & Bangles">Bracelets &amp; Bangles</option>
												<option value="Earrings">Earrings</option>
												<option value="Grillz">Grillz</option>
											</optgroup>
											<optgroup label="Services">
												<option value="Custom Bespoke Jewellery">Custom Bespoke Jewellery</option>
												<option value="Watch Sourcing">Watch Sourcing</option>
												<option value="Jewellery Repair & Restoration">Jewellery Repair &amp; Restoration</option>
												<option value="Watch Servicing">Watch Servicing</option>
												<option value="Engraving Services">Engraving Services</option>
												<option value="Appraisal & Valuation">Appraisal &amp; Valuation</option>
											</optgroup>
											<optgroup label="Buying & Selling">
												<option value="Sell My Watch">Sell My Watch</option>
												<option value="Sell My Jewellery">Sell My Jewellery</option>
												<option value="Trade-In">Trade-In</option>
												<option value="Consignment">Consignment</option>
											</optgroup>
											<optgroup label="Other">
												<option value="General Enquiry">General Enquiry</option>
												<option value="Schedule Appointment">Schedule Appointment</option>
												<option value="Partnership Opportunity">Partnership Opportunity</option>
												<option value="Media & Press">Media &amp; Press</option>
											</optgroup>
										</select>
									</div>
									<div>
										<textarea
											name="message" value={formData.message} onChange={handleChange} required rows={3}
											placeholder="TELL US ABOUT YOUR REQUEST"
											className="w-full bg-transparent border border-gray-800 text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors resize-none placeholder:text-gray-600 placeholder:text-xs placeholder:tracking-[0.2em]"
										/>
									</div>
									<button
										type="submit" disabled={loading}
										className="w-full bg-white text-black font-bold tracking-widest py-4 text-sm hover:bg-gray-200 transition-all duration-300 disabled:opacity-50 inline-flex items-center justify-center gap-2"
									>
										{loading ? "SENDING..." : (
											<>
												SEND REQUEST <ArrowRight size={16} />
											</>
										)}
									</button>
								</form>
							)}
						</div>
					</div>
				</div>
			</section>

			{/* ===== GET IN TOUCH ===== */}
			<section className="py-16 md:py-24 px-6 border-t border-gray-900">
				<div className="container mx-auto max-w-6xl">
					<p className="text-[#D4AF37] text-xs tracking-[0.3em] uppercase mb-10 text-center" style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}>
						Get In Touch
					</p>
					<div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
						{/* Call Us */}
						<a href="tel:02033365303" className="group border border-gray-800 bg-gray-900/20 p-6 hover:border-gray-700 transition-colors">
							<div className="flex items-center gap-3 mb-3">
								<div className="w-10 h-10 rounded-full bg-gray-800/50 flex items-center justify-center">
									<Phone className="w-4 h-4 text-[#D4AF37]" />
								</div>
								<h4 className="text-white text-sm font-bold tracking-wide font-heading">Call Us</h4>
							</div>
							<p className="text-gray-400 text-sm" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
								+44 20 3336 5303
							</p>
						</a>

						{/* WhatsApp */}
						<a href="https://wa.me/447802323652?text=Hello%2C%20I%27m%20interested%20in%20your%20services" target="_blank" rel="noopener noreferrer" className="group border border-gray-800 bg-gray-900/20 p-6 hover:border-gray-700 transition-colors">
							<div className="flex items-center gap-3 mb-3">
								<div className="w-10 h-10 rounded-full bg-gray-800/50 flex items-center justify-center">
									<svg viewBox="0 0 24 24" width={16} height={16} className="text-[#D4AF37]" fill="currentColor">
										<path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" />
									</svg>
								</div>
								<h4 className="text-white text-sm font-bold tracking-wide font-heading">WhatsApp</h4>
							</div>
							<p className="text-gray-400 text-sm" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
								+44 78 0232 3652
							</p>
						</a>

						{/* Email */}
						<a href="mailto:info@lkbjewellers.com" className="group border border-gray-800 bg-gray-900/20 p-6 hover:border-gray-700 transition-colors">
							<div className="flex items-center gap-3 mb-3">
								<div className="w-10 h-10 rounded-full bg-gray-800/50 flex items-center justify-center">
									<Mail className="w-4 h-4 text-[#D4AF37]" />
								</div>
								<h4 className="text-white text-sm font-bold tracking-wide font-heading">Email</h4>
							</div>
							<p className="text-gray-400 text-sm" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
								info@lkbjewellers.com
							</p>
						</a>

						{/* Visit Us */}
						<a href="https://maps.app.goo.gl/qA4frsncEb2xGHTE7" target="_blank" rel="noopener noreferrer" className="group border border-gray-800 bg-gray-900/20 p-6 hover:border-gray-700 transition-colors">
							<div className="flex items-center gap-3 mb-3">
								<div className="w-10 h-10 rounded-full bg-gray-800/50 flex items-center justify-center">
									<MapPin className="w-4 h-4 text-[#D4AF37]" />
								</div>
								<h4 className="text-white text-sm font-bold tracking-wide font-heading">Visit Us</h4>
							</div>
							<p className="text-gray-400 text-sm" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
								New House, 67-68 Hatton Garden, London, EC1N 8JY
							</p>
						</a>

						{/* Hours */}
						<div className="border border-gray-800 bg-gray-900/20 p-6">
							<div className="flex items-center gap-3 mb-3">
								<div className="w-10 h-10 rounded-full bg-gray-800/50 flex items-center justify-center">
									<Clock className="w-4 h-4 text-[#D4AF37]" />
								</div>
								<h4 className="text-white text-sm font-bold tracking-wide font-heading">Hours</h4>
							</div>
							<p className="text-gray-400 text-sm" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
								By Appointment
							</p>
							<p className="text-gray-500 text-xs mt-1" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
								24/7 for VIP Clients
							</p>
						</div>

						{/* Get Directions */}
						<a href="https://maps.app.goo.gl/qA4frsncEb2xGHTE7" target="_blank" rel="noopener noreferrer" className="group border border-gray-800 bg-gray-900/20 p-6 hover:border-gray-700 transition-colors">
							<div className="flex items-center gap-3 mb-3">
								<div className="w-10 h-10 rounded-full bg-gray-800/50 flex items-center justify-center">
									<Navigation className="w-4 h-4 text-[#D4AF37]" />
								</div>
								<h4 className="text-white text-sm font-bold tracking-wide font-heading">Get Directions</h4>
							</div>
							<p className="text-gray-400 text-sm" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
								Navigate to Our Showroom
							</p>
						</a>
					</div>
				</div>
			</section>

			{/* ===== MAP SECTION ===== */}
			<section className="py-16 md:py-24 px-6">
				<div className="container mx-auto max-w-6xl">
					<div className="text-center mb-10">
						<h2 className="text-3xl md:text-4xl text-white mb-3 font-heading">
							Find Us in Hatton Garden
						</h2>
						<p className="text-gray-400 text-base" style={{ fontFamily: '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif' }}>
							London&apos;s Historic Jewellery Quarter
						</p>
						<div className="flex items-center justify-center gap-4 mt-6">
							<div className="h-px w-16 bg-gradient-to-r from-transparent to-gray-700" />
							<MapPin className="w-5 h-5 text-[#D4AF37]" />
							<div className="h-px w-16 bg-gradient-to-l from-transparent to-gray-700" />
						</div>
					</div>

					{/* Map */}
					<div className="relative rounded-lg overflow-hidden border border-gray-800" style={{ height: "450px" }}>
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2482.4!2d-0.108!3d51.5204!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48761b4c7a7b0c01%3A0x2c0c8b8c8b8c8b8c!2s67-68%20Hatton%20Garden%2C%20London%20EC1N%208JY!5e0!3m2!1sen!2suk!4v1700000000000!5m2!1sen!2suk"
							width="100%"
							height="100%"
							style={{ border: 0, filter: "grayscale(100%) contrast(1.1)" }}
							allowFullScreen
							loading="lazy"
							referrerPolicy="no-referrer-when-downgrade"
							className="hover:grayscale-0 transition-all duration-500"
						/>

						{/* Overlay - top left */}
						<div className="absolute top-4 left-4 bg-black/80 backdrop-blur-sm px-4 py-3 z-10">
							<p className="text-white text-sm font-bold font-heading">LKB Jewellers</p>
							<p className="text-gray-400 text-xs">Hatton Garden, London</p>
						</div>

						{/* Overlay - bottom right */}
						<a
							href="https://maps.app.goo.gl/qA4frsncEb2xGHTE7"
							target="_blank"
							rel="noopener noreferrer"
							className="absolute bottom-4 right-4 bg-white text-black px-6 py-3 text-sm font-bold tracking-widest hover:bg-gray-200 transition-colors inline-flex items-center gap-2 z-10"
						>
							<MapPin size={14} /> GET DIRECTIONS <ArrowRight size={14} />
						</a>
					</div>
				</div>
			</section>

			{/* ===== VISIT OUR SHOWROOM ===== */}
			<ShowroomSection />
		</div>
	);
}
