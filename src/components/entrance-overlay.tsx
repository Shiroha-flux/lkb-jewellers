"use client";

import { useState, useRef, useEffect } from "react";

export default function EntranceOverlay() {
  const [showOverlay, setShowOverlay] = useState(true);
  const [showContent, setShowContent] = useState(true);
  const [isPlaying, setIsPlaying] = useState(false);
  const videoRef = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    // Check if user already entered this session
    if (typeof window !== "undefined") {
      const entered = sessionStorage.getItem("lkb-entered");
      if (entered) {
        setShowOverlay(false);
        setShowContent(false);
      }
    }
  }, []);

  const handleEnter = () => {
    setShowContent(false);
    setIsPlaying(true);

    if (videoRef.current) {
      videoRef.current.currentTime = 0;
      videoRef.current.play();
    }

    // After door opens, hide overlay
    setTimeout(() => {
      setShowOverlay(false);
      if (typeof window !== "undefined") {
        sessionStorage.setItem("lkb-entered", "true");
      }
    }, 2500);
  };

  if (!showOverlay) return null;

  return (
    <div className="fixed inset-0 z-[100] bg-black">
      {/* Background image (door closed) */}
      <img
        src="/DoorClosedPicture.png"
        alt=""
        className="absolute inset-0 w-full h-full object-cover"
      />

      {/* Door open video */}
      <video
        ref={videoRef}
        className="absolute inset-0 w-full h-full"
        style={{
          objectFit: "cover",
          objectPosition: "center center",
          transform: "scale(1.2)",
        }}
        muted
        playsInline
        preload="auto"
      >
        <source src="/DoorOpenVideo.mp4" type="video/mp4" />
      </video>

      {/* Content overlay */}
      <div
        className={`absolute inset-0 flex flex-col items-center justify-center pt-16 md:justify-start md:pt-32 px-8 transition-opacity duration-500 select-none z-50 ${
          showContent ? "opacity-100" : "opacity-0 pointer-events-none"
        }`}
      >
        <div className="text-center mb-12 space-y-4 relative z-10">
          <h1
            className="text-5xl md:text-7xl lg:text-8xl tracking-wide animate-fade-in text-white uppercase"
            style={{
              fontFamily: 'Prata, "Prata Fallback", serif',
              textShadow:
                "0 2px 8px rgba(0, 0, 0, 0.5), 0 1px 4px rgba(0, 0, 0, 0.3)",
            }}
          >
            Welcome to LKB Jewellers
          </h1>
          <p
            className="text-white text-sm md:text-lg lg:text-xl tracking-[0.3em] animate-slide-up font-semibold"
            style={{
              fontFamily: "ui-sans-serif, system-ui, sans-serif",
              animationDelay: "0.4s",
              textShadow:
                "0 2px 8px rgba(0, 0, 0, 0.5), 0 1px 4px rgba(0, 0, 0, 0.3)",
            }}
          >
            TIMELESS &bull; ELEGANT &bull; CRAFTED
          </p>
        </div>

        <button
          onClick={handleEnter}
          onTouchStart={(e) => {
            e.preventDefault();
            handleEnter();
          }}
          className="group relative px-12 py-4 bg-white border-2 border-white text-black font-bold tracking-[0.2em] text-sm md:text-base transition-all duration-300 hover:scale-105 active:scale-95 animate-slide-up z-50 cursor-pointer touch-manipulation select-none"
          style={{
            animationDelay: "0.6s",
            WebkitTapHighlightColor: "transparent",
            userSelect: "none",
          }}
        >
          <span className="relative z-10 pointer-events-none">
            ENTER STORE
          </span>
        </button>

        {/* Ambient glow effects */}
        <div
          className="absolute top-1/4 left-1/4 w-64 h-64 bg-white rounded-full blur-[120px] opacity-10 animate-pulse -z-10 pointer-events-none"
          style={{ animationDuration: "4s" }}
        />
        <div
          className="absolute bottom-1/4 right-1/4 w-64 h-64 bg-white rounded-full blur-[120px] opacity-10 animate-pulse -z-10 pointer-events-none"
          style={{ animationDuration: "6s", animationDelay: "1s" }}
        />
      </div>
    </div>
  );
}
