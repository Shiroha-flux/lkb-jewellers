"use client";

import Link from "next/link";
import {
  LayoutDashboard,
  Package,
  Users,
  ShoppingBag,
  TrendingUp,
  Settings,
} from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

const stats = [
  { label: "Total Orders", value: "0", icon: Package, change: "+0%" },
  { label: "Customers", value: "0", icon: Users, change: "+0%" },
  { label: "Products", value: "0", icon: ShoppingBag, change: "+0%" },
  { label: "Revenue", value: "£0", icon: TrendingUp, change: "+0%" },
];

export default function DashboardPage() {
  return (
    <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6">
      <div className="container mx-auto max-w-6xl">
        {/* Header */}
        <div className="flex items-center justify-between mb-12">
          <div>
            <div className="flex items-center gap-3 mb-2">
              <LayoutDashboard className="w-6 h-6 text-[#D4AF37]" />
              <h1
                className="text-3xl md:text-4xl text-white font-normal"
                style={prataFont}
              >
                Dashboard
              </h1>
            </div>
            <p className="text-gray-400 text-sm">
              Welcome to the LKB Jewellers admin panel
            </p>
          </div>
          <Link
            href="/profile"
            className="flex items-center gap-2 text-gray-400 hover:text-white transition-colors text-sm"
          >
            <Settings className="w-4 h-4" />
            Settings
          </Link>
        </div>

        {/* Stats Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
          {stats.map((stat) => (
            <div
              key={stat.label}
              className="bg-gray-900/50 p-6 rounded-lg border border-gray-800"
            >
              <div className="flex items-center justify-between mb-4">
                <stat.icon className="w-5 h-5 text-[#D4AF37]" />
                <span className="text-gray-500 text-xs">{stat.change}</span>
              </div>
              <p
                className="text-3xl text-white font-normal mb-1"
                style={prataFont}
              >
                {stat.value}
              </p>
              <p className="text-gray-500 text-xs tracking-wider uppercase">
                {stat.label}
              </p>
            </div>
          ))}
        </div>

        {/* Placeholder Content */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <div className="bg-gray-900/50 rounded-lg border border-gray-800 p-6">
            <h2
              className="text-xl text-white mb-6 font-normal"
              style={prataFont}
            >
              Recent Orders
            </h2>
            <div className="text-center py-12">
              <Package className="w-12 h-12 text-gray-700 mx-auto mb-4" />
              <p className="text-gray-500 text-sm">
                No recent orders to display
              </p>
            </div>
          </div>

          <div className="bg-gray-900/50 rounded-lg border border-gray-800 p-6">
            <h2
              className="text-xl text-white mb-6 font-normal"
              style={prataFont}
            >
              Quick Actions
            </h2>
            <div className="space-y-3">
              {[
                { label: "Manage Products", href: "/shop" },
                { label: "View Orders", href: "/dashboard" },
                { label: "Customer Enquiries", href: "/contact" },
                { label: "Site Settings", href: "/dashboard" },
              ].map((action) => (
                <Link
                  key={action.label}
                  href={action.href}
                  className="flex items-center justify-between p-3 rounded-lg border border-gray-800 hover:border-gray-700 hover:bg-gray-900/50 transition-all text-gray-300 text-sm"
                >
                  {action.label}
                  <span className="text-[#D4AF37]">&rarr;</span>
                </Link>
              ))}
            </div>
          </div>
        </div>

        {/* Notice */}
        <div className="mt-8 text-center">
          <p className="text-gray-600 text-xs">
            This is a placeholder dashboard. Full admin functionality coming
            soon.
          </p>
        </div>
      </div>
    </div>
  );
}
