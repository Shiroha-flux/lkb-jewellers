"use client";

import { useState } from "react";
import Link from "next/link";
import { Eye, EyeOff } from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

export default function SignupPage() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    password: "",
    confirmPassword: "",
  });
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (formData.password !== formData.confirmPassword) {
      alert("Passwords do not match.");
      return;
    }
    setLoading(true);
    setTimeout(() => {
      setLoading(false);
      alert("Account creation coming soon.");
    }, 1000);
  };

  return (
    <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6 flex items-center justify-center">
      <div className="w-full max-w-md">
        {/* Header */}
        <div className="text-center mb-10">
          <h1
            className="text-4xl md:text-5xl text-white mb-4 font-normal"
            style={prataFont}
          >
            Create Account
          </h1>
          <p className="text-gray-400">
            Join the LKB Jewellers family
          </p>
        </div>

        {/* Form */}
        <form onSubmit={handleSubmit} className="space-y-5">
          <div>
            <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
              Full Name
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
          <div>
            <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
              Email Address
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
              Password
            </label>
            <div className="relative">
              <input
                type={showPassword ? "text" : "password"}
                name="password"
                value={formData.password}
                onChange={handleChange}
                required
                minLength={8}
                className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 pr-12 focus:outline-none focus:border-[#D4AF37] transition-colors"
                placeholder="Minimum 8 characters"
                style={{ fontSize: "16px" }}
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-500 hover:text-white transition-colors"
              >
                {showPassword ? (
                  <EyeOff className="w-5 h-5" />
                ) : (
                  <Eye className="w-5 h-5" />
                )}
              </button>
            </div>
          </div>
          <div>
            <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
              Confirm Password
            </label>
            <input
              type="password"
              name="confirmPassword"
              value={formData.confirmPassword}
              onChange={handleChange}
              required
              minLength={8}
              className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 focus:outline-none focus:border-[#D4AF37] transition-colors"
              placeholder="Confirm your password"
              style={{ fontSize: "16px" }}
            />
          </div>

          <div className="flex items-start gap-2">
            <input
              type="checkbox"
              required
              className="mt-1 rounded border-gray-700 bg-black/50"
            />
            <span className="text-gray-400 text-xs leading-relaxed">
              I agree to the{" "}
              <Link href="/terms" className="text-[#D4AF37] hover:underline">
                Terms &amp; Conditions
              </Link>{" "}
              and{" "}
              <Link
                href="/privacy-policy"
                className="text-[#D4AF37] hover:underline"
              >
                Privacy Policy
              </Link>
            </span>
          </div>

          <button
            type="submit"
            disabled={loading}
            className="w-full bg-white text-black font-bold tracking-widest py-4 text-sm hover:bg-gray-200 transition-colors disabled:opacity-50"
          >
            {loading ? "CREATING ACCOUNT..." : "CREATE ACCOUNT"}
          </button>
        </form>

        {/* Link to Login */}
        <div className="text-center mt-8">
          <p className="text-gray-400 text-sm">
            Already have an account?{" "}
            <Link
              href="/login"
              className="text-[#D4AF37] hover:underline tracking-wider"
            >
              Sign In
            </Link>
          </p>
        </div>

        {/* Decorative */}
        <div className="flex items-center justify-center gap-4 mt-12">
          <div className="h-px w-16 bg-gradient-to-r from-transparent to-gray-800" />
          <div className="w-1.5 h-1.5 rounded-full bg-gray-800" />
          <div className="h-px w-16 bg-gradient-to-l from-transparent to-gray-800" />
        </div>
      </div>
    </div>
  );
}
