import Link from "next/link";
import { RotateCcw } from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

const sections = [
  {
    title: "Return Eligibility",
    content:
      "We want you to be completely satisfied with your purchase. If you are not happy with your order, you may return it within 14 days of delivery for a full refund or exchange. Items must be returned in their original, unworn condition with all tags, certificates, and packaging intact.",
  },
  {
    title: "Non-Returnable Items",
    content:
      "The following items cannot be returned unless they are faulty or damaged upon arrival: bespoke or custom-made jewellery, personalised or engraved items, resized rings, and items that have been worn or altered in any way.",
  },
  {
    title: "How to Return",
    content:
      "To initiate a return, please contact our team at info@lkbjewellers.com or call us on +44 (0) 207 123 4567 within 14 days of receiving your order. We will provide you with a returns authorisation number and instructions for sending your item back to us.",
  },
  {
    title: "Return Shipping",
    content:
      "For items over £500, we will arrange a fully insured collection from your address at no cost. For items under £500, return shipping costs are the responsibility of the customer. We strongly recommend using a tracked and insured postal service.",
  },
  {
    title: "Refund Process",
    content:
      "Once we receive and inspect your returned item, we will process your refund within 14 working days. Refunds will be issued to the original payment method. Please allow additional time for your bank or card provider to credit the funds to your account.",
  },
  {
    title: "Exchanges",
    content:
      "If you would like to exchange an item for a different size, style, or product, please contact us. Exchanges are subject to availability. Any price difference will be charged or refunded accordingly.",
  },
  {
    title: "Faulty or Damaged Items",
    content:
      "If you receive a faulty or damaged item, please contact us immediately with photographs of the damage. We will arrange a free collection and provide a full refund or replacement at your preference.",
  },
];

export default function ReturnsPolicyPage() {
  return (
    <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6">
      <div className="container mx-auto max-w-4xl">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="flex items-center justify-center gap-3 mb-6">
            <RotateCcw className="w-6 h-6 text-[#D4AF37]" />
          </div>
          <h1
            className="text-4xl md:text-6xl text-white mb-6 font-normal"
            style={prataFont}
          >
            Returns Policy
          </h1>
          <p className="text-gray-400">
            Last updated: January 2025
          </p>
        </div>

        {/* Sections */}
        <div className="space-y-10">
          {sections.map((section) => (
            <div key={section.title}>
              <h2
                className="text-xl text-white mb-4 font-normal"
                style={prataFont}
              >
                {section.title}
              </h2>
              <p className="text-gray-400 leading-relaxed">
                {section.content}
              </p>
            </div>
          ))}
        </div>

        {/* Contact */}
        <div className="mt-16 bg-gray-900/50 border border-gray-800 rounded-lg p-8 text-center">
          <p className="text-gray-400 mb-4">
            Need help with a return?
          </p>
          <Link
            href="/contact"
            className="inline-block bg-white text-black font-bold tracking-widest px-8 py-3 text-sm hover:bg-gray-200 transition-colors"
          >
            CONTACT US
          </Link>
        </div>
      </div>
    </div>
  );
}
