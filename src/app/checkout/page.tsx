"use client";

import { useState } from "react";
import Link from "next/link";
import { ShoppingBag, CreditCard, Lock } from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

export default function CheckoutPage() {
  const [formData, setFormData] = useState({
    firstName: "",
    lastName: "",
    email: "",
    phone: "",
    address: "",
    city: "",
    postcode: "",
    country: "United Kingdom",
    cardNumber: "",
    expiry: "",
    cvc: "",
  });
  const [loading, setLoading] = useState(false);

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>
  ) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setTimeout(() => {
      setLoading(false);
      window.location.href = "/success";
    }, 2000);
  };

  return (
    <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6">
      <div className="container mx-auto max-w-6xl">
        {/* Header */}
        <div className="text-center mb-12">
          <h1
            className="text-4xl md:text-5xl text-white mb-4 font-normal"
            style={prataFont}
          >
            Checkout
          </h1>
          <p className="text-gray-400">Complete your purchase securely</p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-12">
          {/* Form */}
          <div className="lg:col-span-2">
            <form onSubmit={handleSubmit} className="space-y-8">
              {/* Shipping Info */}
              <div>
                <h2
                  className="text-xl text-white mb-6 font-normal flex items-center gap-3"
                  style={prataFont}
                >
                  <ShoppingBag className="w-5 h-5 text-[#D4AF37]" />
                  Shipping Information
                </h2>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      First Name *
                    </label>
                    <input
                      type="text"
                      name="firstName"
                      value={formData.firstName}
                      onChange={handleChange}
                      required
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                  <div>
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      Last Name *
                    </label>
                    <input
                      type="text"
                      name="lastName"
                      value={formData.lastName}
                      onChange={handleChange}
                      required
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
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
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                  <div className="md:col-span-2">
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      Address *
                    </label>
                    <input
                      type="text"
                      name="address"
                      value={formData.address}
                      onChange={handleChange}
                      required
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                  <div>
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      City *
                    </label>
                    <input
                      type="text"
                      name="city"
                      value={formData.city}
                      onChange={handleChange}
                      required
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                  <div>
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      Postcode *
                    </label>
                    <input
                      type="text"
                      name="postcode"
                      value={formData.postcode}
                      onChange={handleChange}
                      required
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                </div>
              </div>

              {/* Payment */}
              <div>
                <h2
                  className="text-xl text-white mb-6 font-normal flex items-center gap-3"
                  style={prataFont}
                >
                  <CreditCard className="w-5 h-5 text-[#D4AF37]" />
                  Payment Details
                </h2>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div className="md:col-span-2">
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      Card Number *
                    </label>
                    <input
                      type="text"
                      name="cardNumber"
                      value={formData.cardNumber}
                      onChange={handleChange}
                      required
                      placeholder="1234 5678 9012 3456"
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                  <div>
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      Expiry Date *
                    </label>
                    <input
                      type="text"
                      name="expiry"
                      value={formData.expiry}
                      onChange={handleChange}
                      required
                      placeholder="MM/YY"
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                  <div>
                    <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
                      CVC *
                    </label>
                    <input
                      type="text"
                      name="cvc"
                      value={formData.cvc}
                      onChange={handleChange}
                      required
                      placeholder="123"
                      className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
                      style={{ fontSize: "16px" }}
                    />
                  </div>
                </div>
              </div>

              <button
                type="submit"
                disabled={loading}
                className="w-full bg-white text-black font-bold tracking-widest py-4 text-sm hover:bg-gray-200 transition-colors disabled:opacity-50 flex items-center justify-center gap-3"
              >
                <Lock className="w-4 h-4" />
                {loading ? "PROCESSING..." : "PLACE ORDER"}
              </button>
            </form>
          </div>

          {/* Order Summary */}
          <div>
            <div className="bg-gray-900/50 border border-gray-800 rounded-lg p-6 sticky top-32">
              <h2
                className="text-xl text-white mb-6 font-normal"
                style={prataFont}
              >
                Order Summary
              </h2>
              <div className="space-y-4 mb-6">
                <div className="flex items-center gap-4">
                  <div className="w-16 h-16 bg-gray-800 rounded-lg flex items-center justify-center">
                    <ShoppingBag className="w-6 h-6 text-gray-600" />
                  </div>
                  <div className="flex-1">
                    <p className="text-white text-sm">Your cart items</p>
                    <p className="text-gray-500 text-xs">
                      Items will appear here
                    </p>
                  </div>
                </div>
              </div>
              <div className="border-t border-gray-800 pt-4 space-y-3">
                <div className="flex justify-between text-sm">
                  <span className="text-gray-400">Subtotal</span>
                  <span className="text-white">£0.00</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-400">Shipping</span>
                  <span className="text-white">Free</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-400">Insurance</span>
                  <span className="text-white">Included</span>
                </div>
                <div className="border-t border-gray-800 pt-3">
                  <div className="flex justify-between">
                    <span className="text-white font-semibold">Total</span>
                    <span
                      className="text-white text-lg font-normal"
                      style={prataFont}
                    >
                      £0.00
                    </span>
                  </div>
                </div>
              </div>
              <div className="mt-6 flex items-center gap-2 text-gray-500 text-xs">
                <Lock className="w-3 h-3" />
                <span>Secure SSL encrypted checkout</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
