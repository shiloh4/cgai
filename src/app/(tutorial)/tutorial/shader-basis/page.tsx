'use client';

import { Suspense, useRef } from 'react';
import { Canvas, useFrame, useThree } from '@react-three/fiber';
import * as THREE from 'three';

import vertexShader from '@/shaders/common/vertex.glsl';
import fragmentShader from '@/shaders/uv-screen/fragment.glsl';

const Mesh = ({ dpr }: { dpr: number }) => {
  const { viewport } = useThree();
  const uniforms = useRef({
    uTime: { value: 0 },
    uResolution: {
      value: new THREE.Vector2(window.innerWidth * dpr, window.innerHeight * dpr),
    },
  }).current;

  useFrame((_, delta) => {
    uniforms.uTime.value += delta;
    uniforms.uResolution.value.set(window.innerWidth * dpr, window.innerHeight * dpr);
  });

  return (
    <mesh scale={[viewport.width, viewport.height, 1]}>
      <planeGeometry args={[1, 1]} />
      <shaderMaterial
        fragmentShader={fragmentShader}
        vertexShader={vertexShader}
        uniforms={uniforms}
      />
    </mesh>
  );
};

export default function TestPage() {
  const dpr = 1;
  return (
    <Canvas
      orthographic
      dpr={dpr}
      camera={{ position: [0, 0, 6] }}
      style={{
        position: 'fixed',
        top: 0,
        left: 0,
        width: '100vw',
        height: '100vh',
      }}
    >
      <Suspense fallback={null}>
        <Mesh dpr={dpr} />
      </Suspense>
    </Canvas>
  );
}
