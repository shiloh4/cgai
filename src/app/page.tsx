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
            src="/cgai_logo.png"
            alt="CGAI logo"
            width={96}
            height={96}
            priority
          />
          <p className="text-center sm:text-left text-sm font-bold font-[family-name:var(--font-geist-mono)]">
            School of Interactive Computing, Georgia Institute of Technology, 2025 Spring
          </p>
          <p className="text-center sm:text-left text-3xl font-bold font-[family-name:var(--font-geist-mono)]">
            CS8803/4803 CGA: Computer Graphics in AI Era
          </p>
          <ol className="list-inside list-decimal text-sm text-center sm:text-left font-[family-name:var(--font-geist-mono)]">
            <p className="mb-2">
            This webpage serves as the entry point for all interactive demos based on the CGAI course starter code. Here, you can run tutorials, assignment starter code, and classical ShaderToy shaders by selecting them from the menus below. Simply save your changes and refresh the page to see your updates instantly.
            </p>
          </ol>
          <NavBar />
        </main>
      </div>
    </>
  );
}
