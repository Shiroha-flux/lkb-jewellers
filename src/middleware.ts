import { NextResponse, type NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  // Dashboard handles its own admin auth inline (no redirect needed)
  // /login and /signup are now user-facing pages (no admin redirect)
  return NextResponse.next();
}

export const config = {
  matcher: ["/dashboard/:path*"],
};
