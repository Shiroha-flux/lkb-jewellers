export interface Product {
  _id: string;
  id: string;
  name: string;
  price: number;
  category: string;
  brand: string;
  image: string;
  images: string[];
  description: string;
  tags: string;
  featured: boolean;
  stock: number;
  model: string;
  caseSize: string;
  caseMaterial: string;
  dialColor: string;
  yearOfProduction: number;
}

export const navMenuData = {
  watches: {
    title: "WATCHES",
    defaultImage:
      "https://i.ibb.co/7xC4CJYW/ALL-WEB-NEW-BATCH-NO-SERIAL-001.jpg",
    brands: [
      {
        name: "Rolex",
        desc: "The crown of watchmaking excellence",
        link: "/shop?brand=rolex",
        image:
          "https://i.ibb.co/7xC4CJYW/ALL-WEB-NEW-BATCH-NO-SERIAL-001.jpg",
      },
      {
        name: "Audemars Piguet",
        desc: "Masters of haute horlogerie since 1875",
        link: "/shop?brand=audemars-piguet",
        image:
          "https://i.ibb.co/LDs8VR8Q/ALL-WEB-NEW-BATCH-NO-SERIAL-034.jpg",
      },
      {
        name: "Cartier",
        desc: "Timeless elegance and French savoir-faire",
        link: "/shop?brand=cartier",
        image:
          "https://i.ibb.co/B24TNgh7/ALL-WEB-NEW-BATCH-NO-SERIAL-081.jpg",
      },
      {
        name: "Patek Philippe",
        desc: "The ultimate symbol of prestige",
        link: "/shop?brand=patek-philippe",
        image: "https://i.ibb.co/pS4Lh0W/1.jpg",
      },
      {
        name: "Richard Mille",
        desc: "Revolutionary ultra-lightweight timepieces",
        link: "/shop?brand=richard-mille",
        image:
          "https://i.ibb.co/mFrW0gvS/ALL-WEB-NEW-BATCH-NO-SERIAL-019.jpg",
      },
    ],
  },
  jewellery: {
    title: "JEWELLERY",
    defaultImage: "https://i.ibb.co/m5z17bfC/1.jpg",
    categories: [
      {
        name: "Chains",
        desc: "Cuban links, rope chains & tennis necklaces",
        link: "/shop?category=chains",
        image: "https://i.ibb.co/m5z17bfC/1.jpg",
      },
      {
        name: "Bracelets",
        desc: "Diamond & gold statement pieces",
        link: "/shop?category=bracelets",
        image: "https://i.ibb.co/m5z17bfC/1.jpg",
      },
      {
        name: "Rings",
        desc: "Signet rings & diamond band masterpieces",
        link: "/shop?category=rings",
        image: "https://i.ibb.co/9m8McVnp/1.jpg",
      },
      {
        name: "Pendants",
        desc: "Custom designs & classic motifs",
        link: "/shop?category=pendants",
        image: "https://i.ibb.co/4ZTkytsR/JEWELLERY-WEB-NEW-03.jpg",
      },
    ],
  },
  accessories: {
    title: "ACCESSORIES",
    defaultImage: "https://i.ibb.co/9HRG7t7H/WEBNEWHATS-8.jpg",
    items: [
      {
        name: "LKB Flagship Caps",
        desc: "Premium trucker hats & exclusive headwear",
        link: "/shop?category=flagship caps",
        image: "https://i.ibb.co/9HRG7t7H/WEBNEWHATS-8.jpg",
      },
      {
        name: "Watch Strap",
        desc: "Exclusive straps & custom watch accessories",
        link: "/shop?category=watch strap",
        image: "https://i.ibb.co/ZzZ31LRN/RM-Dark-Blue-Watch-Strap.jpg",
      },
      {
        name: "Lifestyle",
        desc: "Apparel, gifts & collector items",
        link: "/shop?category=lifestyle",
        image: "https://i.ibb.co/JjVknWhJ/1.jpg",
      },
    ],
  },
  services: {
    title: "OTHER SERVICES",
    defaultImage: "/about-us/srd-3.webp",
    offerings: [
      {
        name: "Bespoke Designs",
        desc: "Custom creations by master craftsmen",
        link: "/bespoke",
        image: "/about-us/davido-42.webp",
      },
      {
        name: "Sell",
        desc: "Get competitive valuations for your exclusive items",
        link: "/we-buy",
        image: "https://i.ibb.co/pS4Lh0W/1.jpg",
      },
      {
        name: "Watches/Jewellery Servicing",
        desc: "Expert restoration & maintenance services",
        link: "/servicing",
        image: "/about-us/srd-3.webp",
      },
    ],
  },
  contact: {
    title: "ABOUT US",
    defaultImage: "/about-us/crown-jewels.webp",
    links: [
      {
        name: "Hall of Fame",
        desc: "Our distinguished clientele & their pieces",
        link: "/hall-of-fame",
        image: "/about-us/hall-of-fame.jpg",
      },
      {
        name: "LKB Foundation",
        desc: "Our commitment to giving back",
        link: "https://www.lkbfoundation.org/",
        image: "/about-us/mini-pendant.jpg",
        external: true,
      },
      {
        name: "About Us",
        desc: "Our heritage, values & craftsmanship",
        link: "/about",
        image: "/about-us/crown-jewels.webp",
      },
      {
        name: "Contact Us",
        desc: "Visit us at Hatton Garden, London",
        link: "/contact",
        image: "/about-us/suspect-chain.webp",
      },
    ],
  },
};

export const siteConfig = {
  businessName: "LKB Jewellers",
  legalName: "Local Kettle Brothers UK",
  address: "New House, 67-68 Hatton Garden, London EC1N 8JY",
  phone: "020 3336 5303",
  phoneTel: "+442033365303",
  email: "info@lkbjewellers.com",
  instagram: "https://www.instagram.com/localkettlebrothersuk/",
  tiktok: "https://www.tiktok.com/@localkettlebrothersuk",
  youtube: "https://youtube.com/@lkbjewellers",
  facebook:
    "https://web.facebook.com/people/Local-Kettle-Brothers-UK/100086313849712/",
  twitter: "https://twitter.com/lkb_uk",
  logo: "/white-logo.png",
};

export const videoSections = [
  {
    id: "watches",
    title: "EXCLUSIVE TIMEPIECES",
    videoUrl: "/jewleryGlorify2.mp4",
    link: "/watches",
  },
  {
    id: "jewellery",
    title: "PREMIUM JEWELLERY",
    videoUrl: "/jewlerryGlorify1.mp4",
    link: "/jewellery",
  },
  {
    id: "accessories",
    title: "MERCHANDISE",
    videoUrl: "/DoorOpenVideo.mp4",
    link: "/accessories",
  },
];

export const serviceCards = [
  {
    id: "buy",
    title: "WE BUY",
    image:
      "https://i0.wp.com/lkbjewellers.com/wp-content/uploads/2023/10/WE-BUY-WATCHES-scaled.jpg?fit=1638%2C2048&ssl=1",
    description: "Competitive valuations for your exclusive timepieces.",
  },
  {
    id: "sell",
    title: "WE SELL",
    image:
      "https://i0.wp.com/lkbjewellers.com/wp-content/uploads/2023/10/SELL-YOUR-WATCH.jpg?w=1020&ssl=1",
    description: "Sourcing the rarest pieces from around the globe.",
  },
  {
    id: "service",
    title: "SERVICING",
    image:
      "https://images.unsplash.com/photo-1612817159949-195b6eb9e31a?w=800&q=80",
    description: "Expert restoration and maintenance for longevity.",
  },
  {
    id: "bespoke",
    title: "BESPOKE",
    image:
      "https://i0.wp.com/lkbjewellers.com/wp-content/uploads/2023/10/IMG_4101-scaled.jpg?fit=1638%2C2048&ssl=1",
    description: "Custom designs crafted to your exact specifications.",
  },
];
