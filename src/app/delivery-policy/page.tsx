import Link from "next/link";
import { Truck } from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

const sections = [
  {
    title: "UK Delivery",
    content:
      "We offer free fully insured delivery on all UK orders. Standard delivery takes 2-5 working days. Express next-day delivery is available for an additional charge. All deliveries require a signature upon receipt for security purposes.",
  },
  {
    title: "International Delivery",
    content:
      "We ship worldwide with fully insured and tracked delivery. International shipping times vary by destination, typically 5-14 working days. Import duties and taxes may apply depending on your country's regulations and are the responsibility of the recipient.",
  },
  {
    title: "Packaging",
    content:
      "All items are beautifully presented in our signature LKB Jewellers packaging. For security, external packaging is plain and discreet with no indication of the contents. High-value items are shipped in tamper-evident secure packaging.",
  },
  {
    title: "Insurance",
    content:
      "Every order is fully insured from the moment it leaves our premises until it reaches your hands. Our comprehensive insurance covers loss, theft, and damage during transit. In the unlikely event of an issue, we will replace or refund your order in full.",
  },
  {
    title: "Tracking Your Order",
    content:
      "Once your order has been dispatched, you will receive a confirmation email with a tracking number. You can track your delivery in real-time through our courier partner's website. If you have any concerns about your delivery, please contact us immediately.",
  },
  {
    title: "Missed Deliveries",
    content:
      "If you are not available to receive your delivery, the courier will leave a card with instructions for rearranging delivery or collecting from a local depot. For high-value items, the courier will make up to three delivery attempts before returning the parcel to us.",
  },
  {
    title: "Special Delivery Requirements",
    content:
      "If you have specific delivery requirements, such as a preferred delivery date, safe place instructions, or delivery to an alternative address, please note this at checkout or contact our team. We will do our best to accommodate your needs.",
  },
];

export default function DeliveryPolicyPage() {
  return (
    <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6">
      <div className="container mx-auto max-w-4xl">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="flex items-center justify-center gap-3 mb-6">
            <Truck className="w-6 h-6 text-[#D4AF37]" />
          </div>
          <h1
            className="text-4xl md:text-6xl text-white mb-6 font-normal"
            style={prataFont}
          >
            Delivery Policy
          </h1>
          <p className="text-gray-400">
            Last updated: January 2025
          </p>
        </div>

        {/* Delivery Options Table */}
        <div className="bg-gray-900/50 border border-gray-800 rounded-lg overflow-hidden mb-12">
          <table className="w-full">
            <thead>
              <tr className="border-b border-gray-800">
                <th className="text-left text-white text-sm font-semibold p-4">
                  Service
                </th>
                <th className="text-left text-white text-sm font-semibold p-4">
                  Timeframe
                </th>
                <th className="text-left text-white text-sm font-semibold p-4">
                  Cost
                </th>
              </tr>
            </thead>
            <tbody>
              <tr className="border-b border-gray-800/50">
                <td className="text-gray-300 text-sm p-4">UK Standard</td>
                <td className="text-gray-400 text-sm p-4">2-5 working days</td>
                <td className="text-[#D4AF37] text-sm p-4 font-semibold">
                  Free
                </td>
              </tr>
              <tr className="border-b border-gray-800/50">
                <td className="text-gray-300 text-sm p-4">UK Express</td>
                <td className="text-gray-400 text-sm p-4">Next working day</td>
                <td className="text-gray-400 text-sm p-4">£15.00</td>
              </tr>
              <tr className="border-b border-gray-800/50">
                <td className="text-gray-300 text-sm p-4">Europe</td>
                <td className="text-gray-400 text-sm p-4">5-7 working days</td>
                <td className="text-gray-400 text-sm p-4">£25.00</td>
              </tr>
              <tr>
                <td className="text-gray-300 text-sm p-4">International</td>
                <td className="text-gray-400 text-sm p-4">
                  7-14 working days
                </td>
                <td className="text-gray-400 text-sm p-4">£45.00</td>
              </tr>
            </tbody>
          </table>
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
            Have questions about your delivery?
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
