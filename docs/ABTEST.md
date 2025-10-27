# Test 1 - Logan (Main Font Title Change)

**Main App Title Font Change – Account Creation Flow (US1)**

---

## **Metrics**
**Primary Metric:**  
- **Click-Through Rate (CTR)** — measured as the percentage of users who click the **“Create Account”** button after landing on the **sign-up screen**.

**CTR Formula:**  
`CTR = (Number of create_account_click events ÷ Number of sign_up_screen_view events) × 100`

**Data Source:** Firebase Analytics Events  
- `sign_up_screen_view`  
- `create_account_click`

---

## **Hypothesis**
- **H₀ (Null):** Changing the main app title font on the sign-up screen does **not** significantly affect CTR.  
- **H₁ (Alternative):** Changing the main app title font on the sign-up screen **increases** CTR by improving visual appeal and user trust.

---

## **Experiment**
**Goal:**  
Evaluate the impact of different font styles of the **main app title** on the **CTR of the “Create Account”** button during the sign-up process.

**Methodology:**  
- Use **Firebase A/B Testing** and **Firebase Remote Config** to randomly assign new users to different font variations.  
- Measure CTR by tracking the `create_account_click` event divided by `sign_up_screen_view`.  
- Run the experiment until statistical significance is reached (95% confidence level) or for **2–4 weeks**.

**Firebase Setup:**
1. **Remote Config Parameter:**  
   - Key: `main_title_font`  
   - Default (Control): current font  
   - Variants: fonts listed below  
2. **Firebase A/B Test:**  
   - Experiment name: *Main App Title Font Experiment (US1)*  
   - Primary metric: CTR  
   - Traffic allocation: equal distribution among variants (e.g., 25% each if testing 4 fonts)  
3. **Implementation:**  
   - On app launch, fetch `main_title_font` from Remote Config and apply it to the sign-up screen title.  
   - Track `sign_up_screen_view` and `create_account_click` events.

---

## **Variations** (Will change and discuss with team in future)

| Variant | Font Style | Description | Purpose |
|----------|-------------|-------------|----------|
| **A (Control)** | Default App Font | Current production font | Baseline for comparison |
| **B (Variant 1)** | *Montserrat Bold* | Modern, bold sans-serif font for a confident look | Test if a strong visual presence increases engagement |
| **C (Variant 2)** | *Poppins SemiBold* | Friendly and rounded sans-serif font | Test if a welcoming style builds trust |
| **D (Variant 3)** | *Roboto Medium* | Clean and minimalist font | Test if a familiar, neutral style improves clarity |

---

# Test 2 - Trekker (Band Name Placement inside Posts)

**Band Name Placement Change – Post Component (US4)**

---

## **Metrics**
**Primary Metric:**  
- **Band Name Click-Through Rate (BandCTR)** — percentage of users who click the **band name** after viewing a post.

**BandCTR Formula:**  
`BandCTR = (Number of band_name_click events ÷ Number of post_view events) × 100`

**Data Source:** Firebase Analytics Events  
- `post_view`  
- `band_name_click`  
- `band_profile_view`

---

## **Hypothesis**
- **H₀ (Null):** Moving the band name outside the main post box does not significantly affect BandCTR.  
- **H₁ (Alternative):** Moving the band name outside the main post box increases BandCTR by improving visibility and perceived clickability.

---

## **Experiment**
**Goal:**  
Evaluate whether placing the band name outside the main post box increases clicks compared to the current placement.

**Methodology:**  
- Use Firebase A/B Testing and Remote Config to assign users randomly to control or variant.  
- Measure BandCTR from event data.  
- Run test for 2–4 weeks or until 95% confidence is reached.

**Firebase Setup:**  
1. **Remote Config Parameter:**  
   - Key: `band_name_placement`  
   - Default (Control): `inside_post`  
   - Variant: `outside_post`  
2. **Firebase A/B Test:**  
   - Experiment name: *Band Name Placement (US4)*  
   - Primary metric: BandCTR  
   - Traffic allocation: 50% / 50%  
3. **Implementation:**  
   - On render, fetch `band_name_placement` and position the band name accordingly.  
   - Track `post_view` and `band_name_click` events.

---

## **Variations**

| Variant | Placement | Description | Purpose |
|----------|------------|-------------|----------|
| **A (Control)** | Inside main post box | Current layout | Baseline comparison |
| **B (Variant)** | Outside main post box | Band name displayed just above post | Test improved visibility and click engagement |

# Test 3 - Logan McCue (Search Page Layout Optimization)

**Search Page Layout A/B Test – Artist Discovery Flow (US4)**

---

## **Metrics**  
**Primary Metric:**  
- **Search Engagement Rate (SER)** — percentage of users who perform a **search** or **apply a filter** after landing on the **search page**.

**SER Formula:**  
`SER = (Number of search_action or filter_apply events ÷ Number of search_page_view events) × 100`

**Data Source:** Firebase Analytics Events  
- `search_page_view`  
- `search_action`  
- `filter_apply`

---

## **Hypothesis**  
- **H₀ (Null):** Changing the search page layout does **not** significantly affect SER.  
- **H₁ (Alternative):** Improving the layout of the search bar, map, and filter button **increases SER** by making search and filtering more intuitive.

---

## **Problem & Impact**  
Many users land on the search page but **do not perform a search** or **apply filters**, limiting discovery of smaller indie bands. Improving layout clarity and visibility of interactive elements could help users find artists faster, driving higher engagement and retention.

---

## **Experiment**  
**Goal:**  
Determine whether rearranging the **search bar**, **map**, and **filter button** increases user engagement on the search page.

**Methodology:**  
- Use **Firebase A/B Testing** and **Remote Config** to test layout variants.  
- Target: all users who open the search page (US region).  
- Duration: **3–4 weeks** or until **95% confidence** is reached.  
- Equal traffic split across variants.

**Firebase Setup:**  
1. **Remote Config Parameter:**  
   - Key: `search_layout_variant`  
   - Default: control layout  
   - Variants: overlay, split, sticky_filter  
2. **Primary Metric:** SER  
3. **Event Tracking:**  
   - `search_page_view`, `search_action`, `filter_apply`

---

## **Variations**

| Variant | Layout | Description | Purpose |
|----------|---------|-------------|----------|
| **A (Control)** | Default layout | Search bar at top, small filter icon, map below | Baseline |
| **B (Variant 1)** | Floating Search Bar | Search bar overlays map with larger filter button | Emphasize visibility |
| **C (Variant 2)** | Split View | Half map, half artist list view | Reduce friction, show results contextually |

# Test 4 - Weston Nichols (Color Scheme Experiment)

**App Color Scheme A/B Test – Visual Design Impact**

---

## **Metrics**  
**Primary Metric:**  
Session Engagement Rate (SER) — percentage of sessions in which a user performs at least one key interaction (e.g., navigation, tap, or scroll) after landing on the home screen.

** Formula:**
SER = (Number of session_with_interaction events ÷ Number of app_open events) × 100

**Data Source:** Firebase Analytics Events  
- app_open
- session_with_interaction
- screen_view
- button_click

---

## **Hypothesis**  
- **H₀ (Null):** Changing the app’s main color scheme does not significantly affect session engagement
- **H₁ (Alternative):** A new color scheme increases session engagement by improving visual appeal, clarity, and user comfort.

---

## **Problem & Impact**  
Color scheme could use freshening and could use a better contrasing scheme so it will be easier to read the text in the app.
---

## **Experiment**  
**Goal:**  
* Evaluate whether introducing a new color scheme improves the engagement and interaction frequency.

**Methodology:**  
- Use Firebase A/B Testing with Remote Config to assign users randomly to the current scheme or new color scheme.
- Measure the SER as the primary metric.
- Run for 2–4 weeks or until results reach 95% confidence.
- Equal traffic split (50% control / 50% variant).

**Firebase Setup:**  
1. **Remote Config Parameter:**  
   - Key: app_color_scheme
   - Default (Control): current_scheme
   - Variant: new_scheme
     
2. **Primary Metric:** SER
3. **Event Tracking:** 
   - app_open, session_with_interaction, screen_view, button_click

---

## **Variations**

| Variant | Layout | Description | Purpose |
|----------|---------|-------------|----------|
| **A (Origunal)** |Current Color Scheme|Existing app colors|Establish current engagement benchmark|
| **B (Variant)** |New Color Scheme|Updated palette|Determine changes in engagement|


