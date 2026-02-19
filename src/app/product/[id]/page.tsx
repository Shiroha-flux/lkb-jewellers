"use client";

import { useParams } from "next/navigation";
import Link from "next/link";
import { ArrowLeft } from "lucide-react";
import { products } from "@/data/products";
import { useCart } from "@/context/cart-context";

export default function ProductPage() {
  const params = useParams();
  const { addToCart } = useCart();
  const id = params.id as string;
  const product = products.find((p) => p.id === id);

  if (!product) {
    return (
      <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6 flex flex-col items-center justify-center">
        <h1
          className="text-3xl text-white mb-6"
          style={{ fontFamily: '"Prata", "Prata Fallback", serif' }}
        >
          Product not found
        </h1>
        <Link
          href="/shop"
          className="text-xs tracking-widest uppercase text-gray-400 hover:text-white transition-colors inline-flex items-center gap-2"
        >
          <ArrowLeft size={14} />
          Back to Shop
        </Link>
      </div>
    );
  }

  const isWatch = product.category === "watch";

  return (
    <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6">
      <div className="container mx-auto max-w-7xl">
        {/* Back Button */}
        <Link
          href="/shop"
          className="inline-flex items-center gap-2 text-xs tracking-widest uppercase text-gray-400 hover:text-white transition-colors mb-10"
        >
          <ArrowLeft size={14} />
          Back to Collection
        </Link>

        {/* Two Column Layout */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
          {/* Left: Product Image */}
          <div className="aspect-square bg-gray-900 overflow-hidden rounded-lg">
            <img
              src={product.image}
              alt={product.name}
              className="w-full h-full object-contain"
            />
          </div>

          {/* Right: Product Details */}
          <div className="flex flex-col justify-center">
            {/* Category */}
            <p className="text-xs tracking-[0.3em] uppercase text-[#D4AF37] mb-4">
              {product.category}
            </p>

            {/* Name */}
            <h1
              className="text-3xl md:text-4xl font-bold text-white mb-4"
              style={{ fontFamily: '"Prata", "Prata Fallback", serif' }}
            >
              {product.name}
            </h1>

            {/* Price */}
            <p className="text-2xl text-white mb-8">
              £{product.price.toLocaleString("en-GB")}
            </p>

            {/* Description */}
            <p className="text-gray-400 text-sm leading-relaxed mb-8 border-l-2 border-white/20 pl-6">
              {product.description}
            </p>

            {/* Specs Grid (Watches only) */}
            {isWatch && (
              <div className="grid grid-cols-2 gap-4 mb-8">
                {product.model && (
                  <div className="bg-gray-900/50 p-4 rounded-lg">
                    <p className="text-gray-500 text-[0.65rem] tracking-widest uppercase mb-1">
                      Model
                    </p>
                    <p className="text-white text-sm font-medium">
                      {product.model}
                    </p>
                  </div>
                )}
                {product.caseSize && (
                  <div className="bg-gray-900/50 p-4 rounded-lg">
                    <p className="text-gray-500 text-[0.65rem] tracking-widest uppercase mb-1">
                      Case Size
                    </p>
                    <p className="text-white text-sm font-medium">
                      {product.caseSize}
                    </p>
                  </div>
                )}
                {product.caseMaterial && (
                  <div className="bg-gray-900/50 p-4 rounded-lg">
                    <p className="text-gray-500 text-[0.65rem] tracking-widest uppercase mb-1">
                      Case Material
                    </p>
                    <p className="text-white text-sm font-medium">
                      {product.caseMaterial}
                    </p>
                  </div>
                )}
                {product.dialColor && (
                  <div className="bg-gray-900/50 p-4 rounded-lg">
                    <p className="text-gray-500 text-[0.65rem] tracking-widest uppercase mb-1">
                      Dial Color
                    </p>
                    <p className="text-white text-sm font-medium">
                      {product.dialColor}
                    </p>
                  </div>
                )}
              </div>
            )}

            {/* Action Buttons */}
            <div className="space-y-3">
              <button
                onClick={() => addToCart(product.id)}
                className="w-full bg-white text-black py-4 font-bold tracking-widest text-sm hover:bg-gray-200 transition-colors cursor-pointer"
              >
                ADD TO CART
              </button>
              <Link
                href="/contact"
                className="block w-full border border-white text-white py-4 font-bold tracking-widest text-sm hover:bg-white hover:text-black transition-all text-center"
              >
                ENQUIRE
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
