# CS 8803 CGAI

Welcome to the Course starter code project! This README provides step-by-step instructions for installing Node.js and npm, as well as setting up a Next.js project. Follow the instructions for your operating system to get started.

---

## Prerequisites

1. **Basic Requirements**:
   - A computer running macOS or Windows or Linux.
2. **Text Editor**:
   - Install a code editor like [Visual Studio Code](https://code.visualstudio.com/).

---

## Installing Node.js and npm

Node.js is a JavaScript runtime, and npm (Node Package Manager) comes with it. You’ll need both to work with React/Next.js projects.

### macOS

1. **Install Homebrew (if not already installed)**:
   Open Terminal and run:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Node.js**:
   Using Homebrew, run:

   ```bash
   brew install node
   ```

   This will install both Node.js and npm.

3. **Verify Installation**:
   - Check Node.js version:

     ```bash
     node -v
     ```

   - Check npm version:

     ```bash
     npm -v
     ```

### Windows

1. **Download Node.js**:
   - Visit [Node.js Downloads](https://nodejs.org/).
   - Download the **LTS** version (recommended for most users).

2. **Run the Installer**:
   - Double-click the downloaded file and follow the installation wizard.
   - Ensure that you check the box to add Node.js to the system PATH.

3. **Verify Installation**:
   - Open Command Prompt or PowerShell.
   - Check Node.js version:

     ```bash
     node -v
     ```

   - Check npm version:

     ```bash
     npm -v
     ```

### Linux

1. **Install Node.js using NodeSource**:
   - Open your terminal.
   - Run the following commands to add the NodeSource repository and install Node.js:

     ```bash
     curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
     sudo apt-get install -y nodejs
     ```

2. **Install Build Tools (optional but recommended)**:
   - For compiling native modules, install build-essential:

     ```bash
     sudo apt-get install -y build-essential
     ```

3. **Verify Installation**:
   - Check Node.js version:

     ```bash
     node -v
     ```

   - Check npm version:

     ```bash
     npm -v
     ```

---

## Getting Started

The tech stack for this project includes

- [Next.js](https://nextjs.org/)
- [React Three Fiber](https://r3f.docs.pmnd.rs/getting-started/introduction)
- [Three.js](https://threejs.org/)
- [TypeScript](https://www.typescriptlang.org/)
- [Tailwind CSS](https://tailwindcss.com/)

1. Install dev dependencies:

   ```bash
   npm install
   ```

2. Start the development server:

   ```bash
   npm run dev
   ```

3. Open your browser and go to:`http://localhost:3000`. You should see the class landing page.

4. After you have completed the assignment, for exmaple, Assignment 1, you can click on the link named `Assignment 1` under the `Assignments` section. Or, You can just go to `http://localhost:3000/assignment/a1` to see the result of the assignment.

---

## Additional Information and Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [React Three Fiber Documentation](https://r3f.docs.pmnd.rs/getting-started/introduction)
- [Three.js Documentation](https://threejs.org/docs/index.html#manual/en/introduction/Creating-a-scene)
- [ShaderToy](https://www.shadertoy.com/)
