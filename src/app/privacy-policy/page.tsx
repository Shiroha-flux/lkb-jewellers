import { Shield } from "lucide-react";

const prataFont = { fontFamily: '"Prata", "Prata Fallback", serif' };

const sections = [
  {
    title: "Information We Collect",
    content:
      "We collect personal information that you voluntarily provide to us when you register on the website, place an order, subscribe to our newsletter, or contact us. This may include your name, email address, postal address, telephone number, and payment information.",
  },
  {
    title: "How We Use Your Information",
    content:
      "We use the information we collect to process and fulfil your orders, communicate with you about your purchases, send you marketing communications (with your consent), improve our website and services, comply with legal obligations, and prevent fraud.",
  },
  {
    title: "Data Storage & Security",
    content:
      "We implement appropriate technical and organisational measures to protect your personal data against unauthorised access, alteration, disclosure, or destruction. Payment information is processed through secure, PCI-compliant payment processors and is never stored on our servers.",
  },
  {
    title: "Cookies",
    content:
      "Our website uses cookies to enhance your browsing experience. Cookies are small text files stored on your device that help us remember your preferences and understand how you use our website. You can control cookie settings through your browser preferences.",
  },
  {
    title: "Third-Party Sharing",
    content:
      "We do not sell, trade, or rent your personal information to third parties. We may share your information with trusted service providers who assist us in operating our website, conducting our business, or servicing you, provided they agree to keep this information confidential.",
  },
  {
    title: "Your Rights",
    content:
      "Under GDPR and UK data protection law, you have the right to access, rectify, erase, restrict processing, object to processing, and port your personal data. You also have the right to withdraw consent at any time. To exercise these rights, please contact us at info@lkbjewellers.com.",
  },
  {
    title: "Email Marketing",
    content:
      "If you have opted in to receive marketing communications, you can unsubscribe at any time by clicking the unsubscribe link in any email or by contacting us directly. We will never send you unsolicited marketing without your explicit consent.",
  },
  {
    title: "Data Retention",
    content:
      "We retain your personal data only for as long as necessary to fulfil the purposes for which it was collected, including to satisfy legal, accounting, or reporting requirements. Order data is retained for a minimum of 6 years in accordance with UK tax regulations.",
  },
  {
    title: "Changes to This Policy",
    content:
      "We may update this Privacy Policy from time to time to reflect changes in our practices or legal requirements. We will notify you of any material changes by posting the updated policy on our website with a revised effective date.",
  },
];

export default function PrivacyPolicyPage() {
  return (
    <div className="bg-black min-h-screen pt-32 pb-24 px-4 md:px-6">
      <div className="container mx-auto max-w-4xl">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="flex items-center justify-center gap-3 mb-6">
            <Shield className="w-6 h-6 text-[#D4AF37]" />
          </div>
          <h1
            className="text-4xl md:text-6xl text-white mb-6 font-normal"
            style={prataFont}
          >
            Privacy Policy
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
          <p className="text-gray-400">
            For privacy-related enquiries, please contact our Data Protection
            Officer at{" "}
            <a
              href="mailto:privacy@lkbjewellers.com"
              className="text-[#D4AF37] hover:underline"
            >
              privacy@lkbjewellers.com
            </a>
          </p>
        </div>
      </div>
    </div>
  );
}
