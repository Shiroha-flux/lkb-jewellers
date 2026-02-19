"use client";

import { useState } from "react";
import Link from "next/link";
import { Eye, EyeOff } from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

export default function LoginPage() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setTimeout(() => {
      setLoading(false);
      alert("Login functionality coming soon.");
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
            Sign In
          </h1>
          <p className="text-gray-400">
            Welcome back to LKB Jewellers
          </p>
        </div>

        {/* Form */}
        <form onSubmit={handleSubmit} className="space-y-5">
          <div>
            <label className="block text-gray-400 text-xs tracking-wider uppercase mb-2">
              Email Address
            </label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
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
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                className="w-full bg-black/50 border border-gray-700 rounded-lg text-white px-4 py-3 pr-12 focus:outline-none focus:border-[#D4AF37] transition-colors"
                placeholder="Enter your password"
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

          <div className="flex items-center justify-between text-sm">
            <label className="flex items-center gap-2 text-gray-400 cursor-pointer">
              <input
                type="checkbox"
                className="rounded border-gray-700 bg-black/50"
              />
              Remember me
            </label>
            <Link
              href="/contact"
              className="text-[#D4AF37] hover:underline text-xs tracking-wider"
            >
              Forgot Password?
            </Link>
          </div>

          <button
            type="submit"
            disabled={loading}
            className="w-full bg-white text-black font-bold tracking-widest py-4 text-sm hover:bg-gray-200 transition-colors disabled:opacity-50"
          >
            {loading ? "SIGNING IN..." : "SIGN IN"}
          </button>
        </form>

        {/* Link to Signup */}
        <div className="text-center mt-8">
          <p className="text-gray-400 text-sm">
            Don&apos;t have an account?{" "}
            <Link
              href="/signup"
              className="text-[#D4AF37] hover:underline tracking-wider"
            >
              Create Account
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
