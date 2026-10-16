#!/usr/bin/env bash
# Creates the finalisation issues on ninihub1/Com-Nha.
# Skips #10, #21 and #30, which already exist.
#
# Preview only (creates nothing):   DRY=1 bash create-issues.sh
# Create for real (run ONCE):       bash create-issues.sh

REPO="ninihub1/Com-Nha"

mk() {
  if [ -n "$DRY" ]; then
    echo "[dry run] $1"
  else
    gh issue create -R "$REPO" --title "$1" --body "$2"
  fi
}

# --- Ordering ---

mk "Add a pickup and delivery chooser to the menu page" \
"Add a Ready to order panel near the top of the menu page with a Pickup or Delivery choice and an Order now button that opens the foodbooking ordering page. Show a short note for each choice (pickup address and hours, delivery address check on the ordering page). The link comes from #10 and is stored in js/config.js."

mk "Label menu prices as dine-in only" \
"Menu prices are for dining in, and pickup and delivery prices can differ on the ordering page. Add a clear note on the menu page, the family sets section and the order panel so customers are not confused when prices do not match."

mk "Point the nav, hero and order buttons at the menu page ordering panel" \
"The ORDER nav link and the hero Order Online button should go to the ordering panel on the menu page. Decide whether the separate order page and the homepage Order section are kept as a short landing page or removed, so there is only one place to choose pickup or delivery."

# --- Bugs and fixes ---

mk "Fix nav and footer links on pages inside subfolders" \
"Header and footer links were written for the homepage, so they break from pages/menu.html (for example pages/index.html and pages/pages/menu.html). Every header and footer link 404s from the menu page. The hero View Menu button on the homepage also 404s because it points to menu.html. Fix by adding the page's folder prefix to relative links in js/include.js, make the logo path relative, and point the hero View Menu button at pages/menu.html."

mk "Make the catering form send enquiries" \
"The Send enquiry button on the catering form does nothing on submit. Connect it to a form service such as Formspree or a mailto link, add an email or phone field, a confirmation message and basic validation. Right now submitting reloads the page and puts the typed details in the URL (index.html?name=...), and no field is required."

mk "Clean up leftover code and comments" \
"js/main.js still logs Week 5 in progress to the console. Remove it. Also remove the team note comment at the bottom of partials/header.html (it mentions Week 6 and ships to every visitor) and check for other stale comments, TODO notes and unused CSS rules."

mk "Fix the Open Graph image on the homepage" \
"The og:image tag points to assets/logo.jpeg, which is not in the assets folder. Point it at a real image so link previews work when the site is shared. Note assets/logo.png is actually a JPEG file with a .png name, so convert or rename it to match."

# --- Content and visuals ---

mk "Get real photos for the story section, menu banner and dish thumbnails" \
"Replace the story photo, the menu banner and the per-dish thumbnail placeholders with real images. Agree on image sizes and file names first so they drop in without layout changes. Also needed for the Signature Dishes section (#30)."

mk "Add the Google Map to the Visit Us section" \
"The Visit Us section shows a [map] box. Add a Google Maps embed for Shop 38, 478 Wanneroo Road, Westminster WA 6061, with a Get directions link that opens in Google Maps. Check it works on phones."

mk "Animate the dish marquee" \
"The dish strip under the hero is static and wraps onto two lines on narrower screens (see the screenshot in the team chat). Make it a continuous looping scroll that stays on one line at every width, pauses on hover or touch, and stops moving for visitors who have the reduced-motion setting turned on."

# --- Menu page ---

mk "Rotate the Uber Eats reviews every 7 seconds" \
"The rating block in Visit Us shows one quote (Trinh E.). Collect several real reviews from the Uber Eats page, with the client's OK, and rotate them every 7 seconds with a soft fade, keeping the 4.4 rating and the Read more link. Pause on hover or focus, add small dots or arrows so people can move between reviews, show the first review without motion for reduced-motion visitors, and make sure the block does not change height and push the page around."

mk "Add a vegetarian filter to the menu page" \
"Dishes are marked with [V] when a vegetarian option is available. Add a toggle in the category bar that shows only those dishes."

mk "Make the menu category nav sticky" \
"On the long menu page the category pills scroll out of view. Keep them pinned under the header and highlight the category currently being read."

# --- Bugs found in the code audit ---

mk "Add a hamburger menu for the mobile header" \
"On phones the nav links wrap onto three rows and spill out of the 100px header onto the hero text. Replace them below about 768px with a hamburger button that opens a menu panel holding the nav links and the phone number. It needs to open and close with a tap and the keyboard, close when a link is tapped, keep the logo visible, and work on every page (the header is shared through partials/header.html and js/include.js). Desktop keeps the current nav."

mk "Fix anchor links landing under the sticky header" \
"The sticky header is 100px tall, but jumping to #story, #mam-com, #catering and #visit puts the section at the very top of the screen, so its heading is hidden behind the header. The menu page offset (scroll-margin-top 90px) is also 10px short. Add scroll-padding-top to the page so all jumps clear the header."

mk "Fix menu prices that show several prices as one string" \
"Seven dishes have more than one price and show as for example \$11 / 11 / 12 or \$6 / 8 (Chả Giò, Mì Xào, Cơm Chiên Cá Mặn, Cà Phê Đen, Cà Phê Sữa, Cơm Nhà's Coffee, Matcha Latte). Only the first price has a dollar sign and customers cannot tell what each price is for. Ask the client what each price means (size, filling, hot or iced), then store labelled options in data/menu.json and show them clearly."

mk "Fill in missing dish descriptions and English names in the menu data" \
"Seven dishes have no description (Bánh Phồng Tôm, Phở Sườn Bò, Baby Spaghetti, Yaru still and sparkling water, Whole Young Coconut) and about twenty drinks and mocktails have no English name field. Get the wording from the client and fill data/menu.json so every dish reads the same way."

# --- Quality ---

mk "Check the site on phones" \
"Test the new hamburger menu, the header, hero buttons, marquee, set cards, order panel and menu thumbnails at common phone widths. Fix anything that overflows or crowds."

mk "Run an accessibility pass" \
"Check colour contrast, keyboard focus states, form labels, alt text and heading order on every page. Known: the [photo] and [map] placeholder text is 4.47:1 against its box, just under the 4.5:1 minimum. Fix whatever fails."

mk "Add menu page meta tags and structured data" \
"Give pages/menu.html its own description and Open Graph tags, and add the favicon link it is missing (index.html has one, so the menu page asks the browser for /favicon.ico, which does not exist). Add Restaurant structured data (address, hours, phone) to help local search results."

mk "Add a 404 page" \
"Show a friendly page with a link back to the homepage when someone opens a URL that does not exist."

mk "Final testing: broken links, browsers and forms" \
"Click every link and button on every page, test the catering form and the order panel, and check the site in Chrome, Safari and Firefox on desktop and phone. Log anything that fails as a fix."

# --- Setup and process ---

mk "Deploy the site to GitHub Pages" \
"Publish the site so the client and teachers can open a live link. Check that all paths, including the logo, partials and js/config.js, work under the /Com-Nha/ sub-path."

mk "Client review and sign-off" \
"Walk the client through the finished site and record what they approve or want changed. Confirm opening hours, address, dish names and prices, and the ordering link before handover."

mk "Tidy branches and naming" \
"Delete merged branches and rename or retire the ones that do not follow CONTRIBUTING.md (for example 8-visit-catering-sections and 9-footer-content). Add a short branch naming reminder to the PR template."

echo "Done."