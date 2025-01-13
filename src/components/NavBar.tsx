'use client';

import * as React from 'react';
import Link from 'next/link';

import { cn } from '@/lib/utils';
import {
  NavigationMenu,
  NavigationMenuContent,
  NavigationMenuItem,
  NavigationMenuLink,
  NavigationMenuList,
  NavigationMenuTrigger,
  navigationMenuTriggerStyle,
} from '@/components/ui/navigation-menu';
import { GithubIcon, GitlabIcon } from 'lucide-react';
import Image from 'next/image';

const tutorials: { title: string; href: string; description: string }[] = [
  {
    title: 'Shader basics',
    href: '/tutorial/shader-basics',
    description: 'Rendering a simple shader',
  },
  {
    title: 'More...',
    href: '#',
    description: 'Comming soon',
  },
];

const assignments: { title: string; href: string; description: string }[] = [
  {
    title: 'Assignment 1',
    href: '/assignment/a1',
    description: 'Implicit surfaces and Ray Marching',
  },
  {
    title: 'Assignment 2',
    href: '/assignment/a2',
    description: 'Comming soon',
  },
  {
    title: 'Assignment 3',
    href: '/assignment/a3',
    description: 'Comming soon',
  },
  {
    title: 'Assignment 4',
    href: '/assignment/a4',
    description: 'Comming soon',
  },
];

const shaderToys: { title: string; href: string; description: string }[] = [
  {
    title: 'Raymarching - Primitives ',
    href: 'https://www.shadertoy.com/view/Xds3zN',
    description: 'A set of raymarched primitives by Inigo Quilez',
  },
  {
    title: 'More...',
    href: '#',
    description: 'Comming soon',
  },
];

export function NavBar() {
  return (
    <NavigationMenu>
      <NavigationMenuList>
        <NavigationMenuItem>
          <NavigationMenuTrigger>Tutorials</NavigationMenuTrigger>
          <NavigationMenuContent>
            <ul className="grid gap-3 p-6 md:w-[400px] lg:w-[500px] lg:grid-cols-[.75fr_1fr]">
              {tutorials.map((items) => (
                <ListItem key={items.title} title={items.title} href={items.href}>
                  {items.description}
                </ListItem>
              ))}
            </ul>
          </NavigationMenuContent>
        </NavigationMenuItem>
        <NavigationMenuItem>
          <NavigationMenuTrigger>Assignments</NavigationMenuTrigger>
          <NavigationMenuContent>
            <ul className="grid w-[400px] gap-3 p-4 md:w-[500px] md:grid-cols-2 lg:w-[600px] ">
              {assignments.map((assignment) => (
                <ListItem
                  key={assignment.title}
                  title={assignment.title}
                  href={assignment.href}
                >
                  {assignment.description}
                </ListItem>
              ))}
            </ul>
          </NavigationMenuContent>
        </NavigationMenuItem>
        <NavigationMenuItem>
          <NavigationMenuTrigger>ShaderToy Classic</NavigationMenuTrigger>
          <NavigationMenuContent>
            <ul className="grid w-[400px] gap-3 p-4 md:w-[500px] md:grid-cols-2 lg:w-[600px] ">
              {shaderToys.map((item) => (
                <ListItem key={item.title} title={item.title} href={item.href}>
                  {item.description}
                </ListItem>
              ))}
            </ul>
          </NavigationMenuContent>
        </NavigationMenuItem>
        <NavigationMenuItem>
          <Link href="https://github.com/cg-gatech/cgai" legacyBehavior passHref>
            <NavigationMenuLink className={navigationMenuTriggerStyle()}>
              <GithubIcon className="w-4 h-4 mr-2" />
              Github page
            </NavigationMenuLink>
          </Link>
        </NavigationMenuItem>
        <NavigationMenuItem>
          <Link
            href="https://gatech.instructure.com/courses/448080"
            legacyBehavior
            passHref
          >
            <NavigationMenuLink className={navigationMenuTriggerStyle()}>
              <Image
                className="mr-2 invert"
                src="/cg4ai_logo3.png"
                alt="CG for AI logomark"
                width={16}
                height={16}
              />
              Course page
            </NavigationMenuLink>
          </Link>
        </NavigationMenuItem>
      </NavigationMenuList>
    </NavigationMenu>
  );
}

const ListItem = React.forwardRef<
  React.ElementRef<'a'>,
  React.ComponentPropsWithoutRef<'a'>
>(({ className, title, children, ...props }, ref) => {
  return (
    <li>
      <NavigationMenuLink asChild>
        <a
          ref={ref}
          className={cn(
            'block select-none space-y-1 rounded-md p-3 leading-none no-underline outline-none transition-colors hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground',
            className
          )}
          {...props}
        >
          <div className="text-sm font-medium leading-none">{title}</div>
          <p className="line-clamp-2 text-sm leading-snug text-muted-foreground">
            {children}
          </p>
        </a>
      </NavigationMenuLink>
    </li>
  );
});
ListItem.displayName = 'ListItem';
