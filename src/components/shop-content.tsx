"use client";

import { useState, useMemo } from "react";
import { useSearchParams } from "next/navigation";
import Link from "next/link";
import { products } from "@/data/products";

const categories = [
  "All",
  "Watches",
  "Jewellery",
  "Merchandise",
];

// Map filter labels to product category values
const categoryMap: Record<string, string[]> = {
  All: [],
  Watches: ["watch"],
  Jewellery: ["luxury-jewellery"],
  Merchandise: ["merchandise"],
};

interface ShopContentProps {
  defaultCategory?: string;
}

export default function ShopContent({ defaultCategory }: ShopContentProps) {
  const searchParams = useSearchParams();
  const categoryParam = searchParams.get("category");
  const brandParam = searchParams.get("brand");

  // Determine initial active filter from props or search params
  const initialFilter = useMemo(() => {
    if (defaultCategory) return defaultCategory;
    if (brandParam) return "All";
    if (categoryParam) {
      // Find which filter label matches the category param
      const entry = Object.entries(categoryMap).find(([, values]) =>
        values.some((v) => v.toLowerCase() === categoryParam.toLowerCase())
      );
      return entry ? entry[0] : "All";
    }
    return "All";
  }, [defaultCategory, categoryParam, brandParam]);

  const [activeFilter, setActiveFilter] = useState(initialFilter);

  const filteredProducts = useMemo(() => {
    let result = [...products];

    // Apply brand filter from search params
    if (brandParam) {
      const brandNormalized = brandParam.toLowerCase().replace(/-/g, " ");
      result = result.filter(
        (p) => p.brand && p.brand.toLowerCase() === brandNormalized
      );
    }

    // Apply category filter from search params (direct category param takes priority)
    if (categoryParam && activeFilter === initialFilter && !defaultCategory) {
      result = result.filter(
        (p) => p.category.toLowerCase() === categoryParam.toLowerCase()
      );
      return result;
    }

    // Apply active filter button
    if (activeFilter !== "All") {
      const allowedCategories = categoryMap[activeFilter] || [];
      if (allowedCategories.length > 0) {
        result = result.filter((p) =>
          allowedCategories.includes(p.category.toLowerCase())
        );
      }
    }

    return result;
  }, [activeFilter, brandParam, categoryParam, initialFilter, defaultCategory]);

  return (
    <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6">
      <div className="container mx-auto max-w-7xl">
        {/* Header */}
        <div className="text-center mb-12">
          <div className="inline-flex items-center gap-4 mb-6">
            <div className="h-px w-16 bg-gradient-to-r from-transparent to-white" />
            <span
              className="text-white text-xs tracking-[0.5em] uppercase"
              style={{ fontFamily: "ui-sans-serif, system-ui, sans-serif" }}
            >
              {brandParam
                ? brandParam.replace(/-/g, " ").toUpperCase()
                : "Shop"}
            </span>
            <div className="h-px w-16 bg-gradient-to-l from-transparent to-white" />
          </div>
          <h2
            className="text-5xl md:text-6xl text-white mb-6 font-normal"
            style={{ fontFamily: '"Prata", "Prata Fallback", serif' }}
          >
            Our Collection
          </h2>
        </div>

        {/* Filter Buttons */}
        <div className="flex flex-wrap justify-center gap-3 mb-12">
          {categories.map((cat) => (
            <button
              key={cat}
              onClick={() => setActiveFilter(cat)}
              className={`px-6 py-2 text-xs tracking-widest uppercase border transition-all duration-300 ${
                activeFilter === cat
                  ? "bg-white text-black border-white"
                  : "border-gray-700 text-gray-400 hover:border-white hover:text-white"
              }`}
            >
              {cat}
            </button>
          ))}
        </div>

        {/* Product Grid */}
        {filteredProducts.length === 0 ? (
          <div className="text-center py-20">
            <p
              className="text-gray-400 text-lg"
              style={{
                fontFamily:
                  '"Mona Sans", "Mona Sans Fallback", ui-sans-serif, system-ui, sans-serif',
              }}
            >
              No products found in this category.
            </p>
          </div>
        ) : (
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 md:gap-6">
            {filteredProducts.map((product) => (
              <Link
                key={product.id}
                href={`/product/${product.id}`}
                className="group relative overflow-hidden bg-gray-900 block"
              >
                <div className="relative aspect-square overflow-hidden">
                  <img
                    src={product.image}
                    alt={product.name}
                    className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                    loading="lazy"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
                </div>
                <div className="p-3 md:p-4">
                  <h3
                    className="text-sm font-semibold text-white mb-1 truncate"
                    style={{ fontFamily: '"Prata", "Prata Fallback", serif' }}
                  >
                    {product.name}
                  </h3>
                  <p className="text-gray-400 text-xs">
                    £{product.price.toLocaleString("en-GB")}
                  </p>
                </div>
              </Link>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
