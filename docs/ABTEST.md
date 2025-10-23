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
