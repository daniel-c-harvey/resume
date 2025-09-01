# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a LaTeX resume project that generates a professional resume PDF. The repository contains:

- `main.tex` - The main resume content and structure
- `modernresume.cls` - Custom LaTeX document class defining the resume template
- Generated artifacts (`.aux`, `.fdb_latexmk`, `.fls`, `.log`, `.out`, `.pdf`, `.synctex.gz`)

## Build Commands

To compile the resume:
```bash
pdflatex main.tex
```

For automatic rebuilding on changes:
```bash
latexmk -pdf -pvc main.tex
```

To clean generated files:
```bash
latexmk -C main.tex
```

## Architecture

The resume uses a custom LaTeX document class (`modernresume.cls`) that provides:

- Structured commands for different resume sections (skills, experience, projects, education)
- Consistent formatting and styling with defined colors and fonts
- FontAwesome icons for contact information
- Responsive layout with optimized margins

### Key Components

**modernresume.cls structure:**
- Personal information storage and header generation
- Section formatters: `\skillsheader`, `\experienceheader`, `\projectsheader`, `\educationheader`
- Content commands: `\role`, `\product`, `\achievement`, `\project`, `\degree`
- Utility commands for links and GitHub repositories

**main.tex structure:**
- Personal details at the top
- Technical Skills Summary
- Professional Experience (with products and achievements)
- Projects & Skills
- Education

## Customization

To modify the resume:
- Edit personal information variables at the top of `main.tex`
- Add/modify sections using the provided commands from `modernresume.cls`
- Adjust colors by modifying the `\definecolor` commands in the class file
- Change layout by modifying geometry settings in the class file