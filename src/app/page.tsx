import { NavBar } from '@/components/NavBar';
import Image from 'next/image';
// import Landing from '@/components/landing/Landing';

export default function Home() {
  return (
    <>
      {/* <Landing /> */}
      {/* Temporary robot bg */}
      <div className="bg-robot-bg bg-cover bg-center grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20 font-[family-name:var(--font-geist-sans)]">
        <main className="flex flex-col gap-8 row-start-2 items-center sm:items-start">
          <Image
            className="invert ml-[-1rem]"
            src="/cg4ai_logo2.png"
            alt="CG for AI logo"
            width={180}
            height={38}
            priority
          />
          <p className="text-center sm:text-left text-3xl font-bold font-[family-name:var(--font-geist-mono)]">
            Computer Graphics in AI Era
          </p>
          <ol className="list-inside list-decimal text-sm text-center sm:text-left font-[family-name:var(--font-geist-mono)]">
            <li className="mb-2">
              Get started by{' '}
              <code className="bg-black/[.05] dark:bg-white/[.06] px-1 py-0.5 rounded font-semibold">
                git clone 
              </code>
              ,{' '}
              <code className="bg-black/[.05] dark:bg-white/[.06] px-1 py-0.5 rounded font-semibold">
                npm install
              </code>
              , and{' '}
              <code className="bg-black/[.05] dark:bg-white/[.06] px-1 py-0.5 rounded font-semibold">
                npm run dev
              </code>
              .
            </li>
            <li>Save and refresh to see your changes instantly.</li>
          </ol>
          <NavBar />
        </main>
      </div>
    </>
  );
}
