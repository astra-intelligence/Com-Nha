Cơm Nhà – Restaurant Website Redesign
A redesign of the website for Cơm Nhà, a family-style Vietnamese restaurant in Westminster, WA, built for our ICT303 ICT Practicum group project. It is a static site (HTML, CSS and JavaScript, no build step) with a homepage, a menu page loaded from `data/menu.json`, family sets, catering enquiries and visit details.
Team
Blony – @ninihub1 (project lead)
Dakshraj – @Djthegreat-droid
Rohit – @rohit-7512
Aman – @Apes45-maker
Getting started
1. Clone the repository
```bash
git clone https://github.com/ninihub1/Com-Nha.git
cd Com-Nha
```
2. Preview the site locally
> **Important:** don't open `index.html` by double-clicking it. The shared header, footer and menu are loaded with `fetch()`, which browsers block on `file://` pages, so they won't appear. Always preview through a local server.
Option A: VS Code Live Server
Open the `Com-Nha` folder in Visual Studio Code.
Install the Live Server extension (by Ritwick Dey).
Right-click `index.html` and choose Open with Live Server.
The page reloads automatically when you save changes.
Option B: Python's built-in server
From the repo root, run:
```bash
python3 -m http.server 8000
```
Then open http://localhost:8000/index.html. The menu page is at http://localhost:8000/pages/menu.html. Press `Ctrl + C` to stop the server.
> On Windows, use `python -m http.server 8000` if `python3` isn't recognised.
Project structure
```
Com-Nha/
├── index.html          # Homepage
├── pages/
│   └── menu.html       # Menu page
├── partials/
│   ├── header.html     # Shared header, loaded by js/include.js
│   └── footer.html     # Shared footer, loaded by js/include.js
├── css/
│   ├── style.css       # Global styles and colour/font variables
│   └── menu.css        # Menu-page-only styles
├── js/
│   ├── include.js      # Loads the header and footer partials
│   ├── main.js         # Site-wide scripts
│   └── menu.js         # Builds the menu from data/menu.json
├── data/
│   └── menu.json       # Menu categories, dishes and prices
└── favicon.svg
```
Colours and fonts are defined as CSS variables in `css/style.css`. Use those variables rather than hardcoding values in other files.
Contributing
Please read CONTRIBUTING.md before making changes. Work on a separate branch for each issue and open a pull request that links it (for example, `Closes #21`).
