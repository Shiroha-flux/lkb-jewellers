"use client";

import { useState } from "react";
import { Phone, Mail, MapPin, Clock, Send } from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

export default function ContactPage() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    phone: "",
    interest: "",
    message: "",
  });
  const [loading, setLoading] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  const handleChange = (
    e: React.ChangeEvent<
      HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement
    >
  ) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setTimeout(() => {
      setLoading(false);
      setSubmitted(true);
      setFormData({ name: "", email: "", phone: "", interest: "", message: "" });
    }, 1500);
  };

  return (
    <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6">
      <div className="container mx-auto max-w-6xl">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="inline-flex items-center gap-4 mb-6">
            <div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
            <span className="text-white text-xs tracking-[0.5em] uppercase">
              Get In Touch
            </span>
            <div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
          </div>
          <h1
            className="text-5xl md:text-7xl text-white mb-6 font-normal"
            style={prataFont}
          >
            Contact Us
          </h1>
          <p className="text-gray-400 text-lg max-w-2xl mx-auto">
            We&apos;d love to hear from you. Whether you have a question about
            our collections, bespoke services, or anything else, our team is
            ready to assist.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-16">
          {/* Contact Form */}
          <div>
            <h2
              className="text-2xl text-white mb-8 font-normal"
              style={prataFont}
            >
              Send Us a Message
            </h2>

            {submitted ? (
              <div className="bg-gray-900/50 border border-[#D4AF37]/30 rounded-lg p-8 text-center">
                <div className="w-16 h-16 mx-auto mb-4 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center">
                  <Send className="w-7 h-7 text-[#D4AF37]" />
                </div>
                <h3
                  className="text-2xl text-white mb-2 font-normal"
                  style={prataFont}
                >
                  Message Sent
                </h3>
                <p className="text-gray-400">
                  Thank you for reaching out. We&apos;ll get back to you within
                  24 hours.
                </p>
                <button
                  onClick={() => setSubmitted(false)}
                  className="mt-6 text-[#D4AF37] text-sm tracking-widest hover:underline"
                >
                  SEND ANOTHER MESSAGE
                </button>
              </div>
            ) : (
              <form onSubmit={handleSubmit} className="space-y-5">
                <div>
                  <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                    Full Name *
                  </label>
                  <input
                    type="text"
                    name="name"
                    value={formData.name}
                    onChange={handleChange}
                    required
                    className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                    placeholder="Your full name"
                    style={{ fontSize: "16px" }}
                  />
                </div>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                  <div>
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      Email *
                    </label>
                    <input
                      type="email"
                      name="email"
                      value={formData.email}
                      onChange={handleChange}
                      required
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      placeholder="your@email.com"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                  <div>
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      Phone
                    </label>
                    <input
                      type="tel"
                      name="phone"
                      value={formData.phone}
                      onChange={handleChange}
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      placeholder="+44 XXX XXX XXXX"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                </div>
                <div>
                  <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                    Interest
                  </label>
                  <select
                    name="interest"
                    value={formData.interest}
                    onChange={handleChange}
                    className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors appearance-none"
                    style={{ fontSize: "16px" }}
                  >
                    <option value="">Select your interest</option>
                    <option value="watches">Luxury Watches</option>
                    <option value="jewellery">Fine Jewellery</option>
                    <option value="bespoke">Bespoke Design</option>
                    <option value="sell">Sell / Trade</option>
                    <option value="servicing">Watch Servicing</option>
                    <option value="other">Other</option>
                  </select>
                </div>
                <div>
                  <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                    Message *
                  </label>
                  <textarea
                    name="message"
                    value={formData.message}
                    onChange={handleChange}
                    required
                    rows={5}
                    className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors resize-none"
                    placeholder="Tell us how we can help..."
                    style={{ fontSize: "16px" }}
                  />
                </div>
                <button
                  type="submit"
                  disabled={loading}
                  className="w-full bg-white text-black font-bold tracking-widest py-4 text-sm hover:bg-gray-200 transition-colors disabled:opacity-50"
                >
                  {loading ? "SENDING..." : "SEND MESSAGE"}
                </button>
              </form>
            )}
          </div>

          {/* Contact Info */}
          <div className="space-y-8">
            <h2
              className="text-2xl text-white mb-8 font-normal"
              style={prataFont}
            >
              Visit Our Showroom
            </h2>

            <div className="space-y-6">
              <div className="flex items-start gap-4">
                <div className="w-12 h-12 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center flex-shrink-0">
                  <MapPin className="w-5 h-5 text-[#D4AF37]" />
                </div>
                <div>
                  <h3 className="text-white font-semibold mb-1">Address</h3>
                  <p className="text-gray-400 leading-relaxed">
                    LKB Jewellers
                    <br />
                    Hatton Garden
                    <br />
                    London, EC1N 8NX
                  </p>
                </div>
              </div>

              <div className="flex items-start gap-4">
                <div className="w-12 h-12 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center flex-shrink-0">
                  <Phone className="w-5 h-5 text-[#D4AF37]" />
                </div>
                <div>
                  <h3 className="text-white font-semibold mb-1">Phone</h3>
                  <a
                    href="tel:+442071234567"
                    className="text-gray-400 hover:text-[#D4AF37] transition-colors"
                  >
                    +44 (0) 207 123 4567
                  </a>
                </div>
              </div>

              <div className="flex items-start gap-4">
                <div className="w-12 h-12 rounded-full bg-[#D4AF37]/10 border border-[#D4AF37]/30 flex items-center justify-center flex-shrink-0">
                  <Mail className="w-5 h-5 text-[#D4AF37]" />
                </div>
                <div>
                  <h3 className="text-white font-semibold mb-1">Email</h3>
                  <a
                    href="mailto:info@lkbjewellers.com"
                    className="text-gray-400 hover:text-[#D4AF37] transition-colors"
                  >
                    info@lkbjewellers.com
                  </a>
                </div>
              </div>
            </div>

            {/* Opening Hours */}
            <div className="bg-gray-900/50 border border-gray-800 rounded-lg p-6 mt-8">
              <div className="flex items-center gap-3 mb-4">
                <Clock className="w-5 h-5 text-[#D4AF37]" />
                <h3
                  className="text-xl text-white font-normal"
                  style={prataFont}
                >
                  Opening Hours
                </h3>
              </div>
              <div className="space-y-3 text-sm">
                <div className="flex justify-between">
                  <span className="text-gray-400">Monday - Friday</span>
                  <span className="text-white">10:00 AM - 6:00 PM</span>
                </div>
                <div className="h-px bg-gray-800" />
                <div className="flex justify-between">
                  <span className="text-gray-400">Saturday</span>
                  <span className="text-white">10:00 AM - 5:00 PM</span>
                </div>
                <div className="h-px bg-gray-800" />
                <div className="flex justify-between">
                  <span className="text-gray-400">Sunday</span>
                  <span className="text-white">By Appointment</span>
                </div>
              </div>
            </div>

            {/* Map Placeholder */}
            <div className="relative h-64 bg-gray-900/50 border border-gray-800 rounded-lg overflow-hidden">
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="text-center">
                  <MapPin className="w-10 h-10 text-[#D4AF37] mx-auto mb-3" />
                  <p className="text-gray-400 text-sm">
                    Hatton Garden, London
                  </p>
                  <a
                    href="https://maps.google.com/?q=Hatton+Garden+London"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-block mt-3 text-[#D4AF37] text-xs tracking-widest hover:underline uppercase"
                  >
                    Open in Google Maps
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
