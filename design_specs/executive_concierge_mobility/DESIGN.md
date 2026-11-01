---
name: Executive Concierge Mobility
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#44474c'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#75777d'
  outline-variant: '#c5c6cd'
  surface-tint: '#525f75'
  primary: '#000000'
  on-primary: '#ffffff'
  primary-container: '#0e1c2f'
  on-primary-container: '#77849c'
  inverse-primary: '#bac7e1'
  secondary: '#785a00'
  on-secondary: '#ffffff'
  secondary-container: '#fec325'
  on-secondary-container: '#6e5200'
  tertiary: '#000000'
  on-tertiary: '#ffffff'
  tertiary-container: '#001c38'
  on-tertiary-container: '#6886ae'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d6e3fe'
  primary-fixed-dim: '#bac7e1'
  on-primary-fixed: '#0e1c2f'
  on-primary-fixed-variant: '#3a475c'
  secondary-fixed: '#ffdf9c'
  secondary-fixed-dim: '#f7be1d'
  on-secondary-fixed: '#251a00'
  on-secondary-fixed-variant: '#5b4300'
  tertiary-fixed: '#d3e4ff'
  tertiary-fixed-dim: '#aac9f4'
  on-tertiary-fixed: '#001c38'
  on-tertiary-fixed-variant: '#29486d'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  headline-xl:
    fontFamily: Plus Jakarta Sans
    fontSize: 36px
    fontWeight: '800'
    lineHeight: 44px
    letterSpacing: -0.03em
  headline-xl-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 28px
    fontWeight: '800'
    lineHeight: 34px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 30px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: '700'
    lineHeight: 26px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
  label-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '700'
    lineHeight: 18px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 10px
    fontWeight: '700'
    lineHeight: 14px
    letterSpacing: 0.05em
  price-display:
    fontFamily: Plus Jakarta Sans
    fontSize: 22px
    fontWeight: '800'
    lineHeight: 26px
    letterSpacing: -0.02em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-tablet: 1.5rem
  margin: 1.25rem
  margin-tablet: 2rem
  margin-desktop: 3rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system expresses high-end mobility, precision, and effortless luxury. Designed for elite business travelers, vacationing executives, and automotive connoisseurs, the aesthetic balances modern tactile concierge service with seamless, swift digital interactions.

The visual style blends **Corporate Modern** with **Elevated Contemporary Tactility**:
- Crisp, hyper-clean surfaces punctuated by deep Midnight Navy backdrops deliver authoritative elegance.
- High-chroma warm gold and mustard yellow accents signal dynamic energy, premium tier status, and deliberate calls to action.
- The interface feels distinctly native to iOS and modern mobile platforms: generous gesture tap targets, deliberate floating bottom sheets, smooth elevation layering, and expansive horizontal carousel viewports that present luxury vehicles like collector timepieces.

## Colors

The palette establishes an immediate sensation of executive status, engineering rigor, and pristine clarity.

### Color Roles & Implementation
- **Primary (`#0B192C`)**: Deep Midnight Navy. Dictates dominant visual weight: primary headlines, deep immersive hero cards, dark-mode modal overlays, bottom navigation backdrops, and active tab highlights.
- **Secondary / Accent (`#F1B814`)**: Vibrant Gold / Mustard. Reserved for primary conversion hooks: primary action buttons, live availability indicators, selected category chips, promotional badges, and rating stars.
- **Tertiary (`#1E3E62`)**: Cobalt Navy. Serves as intermediate depth tone for card headers, subtle badges, interactive secondary icons, and layered vehicle specification panels.
- **Neutral (`#64748B`)**: Cool Slate Gray. Drives secondary meta text, feature label iconography, inactive tab indicators, and specification keys.

### Surface Architecture
- **Base Background**: Pale Cool Slate (`#F8FAFC`) preserves brightness and prevents harsh mobile glare.
- **Card Surfaces**: Pure White (`#FFFFFF`) for standard vehicle cards, paired with structural borders in Whisper Slate (`#E2E8F0`).
- **Dark Surface Contrast**: Inverted Midnight (`#0B192C`) surface variants provide high-contrast feature showcases (e.g., VIP tier unlocks, exotic vehicle spotlights).

## Typography

The type system utilizes Plus Jakarta Sans throughout for clean, geometric precision with welcoming contemporary terminals. 

- **Display & Headlines**: Heavyweights (700/800) with slight negative letter tracking convey technical confidence and speed. 
- **Vehicle Pricing**: Uses `price-display` for daily rental figures, maintaining strong tabular clarity paired with muted `body-sm` frequency suffixes (e.g., "/day").
- **Specs & Labels**: High-density metadata (such as horsepower, 0-60 times, transmission, and seat counts) leverage `label-md` and `label-sm` with subtle positive tracking for instantaneous readability under small viewport constraints.

## Layout & Spacing

The layout philosophy centers on a touch-first, mobile-native 4-column layout that smoothly bridges to an 8-column tablet grid and 12-column desktop reservation portal.

### Screen Layout Architecture
- **Mobile Grid**: 4 columns with `1.25rem` (20px) outer safe-area margins and `1rem` (16px) gutters. 
- **Bottom Navigation Clearances**: Content feeds strictly implement a persistent bottom inset buffer of `5.5rem` (88px) to eliminate overlap with the floating bottom navigation bar and platform home indicators.
- **Edge Bleed Carousels**: Category pills and premium car image galleries break outside side margins on mobile using negative horizontal margins, allowing smooth natural swipe physics.
- **Spacing Rhythm**: All margins and gaps follow an intentional base-4 scale (`0.25rem` up to `2rem`). Micro-spacings (4px/8px) tightly bind vehicle specs to their icons, while macro-spacings (16px/24px) separate distinct inventory categories.

## Elevation & Depth

Visual hierarchy uses diffused, tinted ambient shadows alongside crisp low-contrast outlines to achieve architectural depth without visual clutter.

- **Surface Level 0 (Canvas Base)**: `#F8FAFC`. Zero elevation, pure flat canvas.
- **Surface Level 1 (Card Deck & Controls)**: `#FFFFFF` resting on `#F8FAFC`. Structured using a crisp `1px solid #E2E8F0` border and an ambient shadow: `box-shadow: 0 4px 20px -2px rgba(11, 25, 44, 0.04), 0 2px 6px -1px rgba(11, 25, 44, 0.02)`.
- **Surface Level 2 (Floating Action Trays & Elevated Cards)**: Active vehicle cards and search header modules carry: `box-shadow: 0 12px 32px -4px rgba(11, 25, 44, 0.08), 0 4px 12px -2px rgba(11, 25, 44, 0.03)`.
- **Surface Level 3 (Modals, Concierge Drawers & Floating Bottom Bar)**: Floating bottom navigation bar and vehicle booking sheets: `box-shadow: 0 20px 40px -8px rgba(11, 25, 44, 0.16)`. Accompanied by subtle backdrop blur (`backdrop-filter: blur(16px)`) when overlaid on dynamic image viewports.
- **Dark Inverted Tier**: Midnight navy cards (`#0B192C`) skip light-tinted drop shadows in favor of an internal soft ambient rim: `box-shadow: inset 0 1px 1px 0 rgba(255, 255, 255, 0.1)`.

## Shapes

The design system embraces an ultra-modern, organic tactile geometry matching modern mobile hardware:

- **Base Radius (0.5rem / 8px)**: Applied to micro-elements, badging indicators, spec pill tags, and rating score capsules.
- **Large Radius (`rounded-lg`, 1rem / 16px)**: Applied to text input fields, bottom sheets, category selection chips, and secondary interaction surfaces.
- **Extra Large Radius (`rounded-xl`, 1.5rem / 24px)**: Applied to flagship vehicle display cards, VIP spotlight banners, hero booking panels, and floating navigation shells.
- **Full Pill (`rounded-full`)**: Applied strictly to icon utility buttons (heart/favorite, back chevron, share), high-impact CTA buttons, and status toggles.

## Components

### Buttons
- **Primary CTA**: Full-pill or `rounded-xl` shape, solid Mustard Gold background (`#F1B814`), text in Deep Midnight Navy (`#0B192C`) with `label-lg` styling. Subtle inner highlight on top edge. Hover/Active transforms to `#E5A910` with a slight scale down (`scale(0.98)`).
- **Secondary Inverted**: Deep Midnight Navy background (`#0B192C`), crisp white text (`#FFFFFF`). Used inside light sheets or as a balanced secondary option.
- **Outline / Ghost**: 1.5px border in `#E2E8F0` with transparent background, Midnight Navy text.

### Category Chips & Filters
- **Default State**: Surface `#FFFFFF`, border `1px solid #E2E8F0`, typography `label-md` in `#64748B`.
- **Active / Selected State**: Surface `#0B192C`, text `#FFFFFF`, with gold dot indicator (`#F1B814`), or full Mustard Gold background (`#F1B814`) with Midnight Navy text.

### Vehicle Inventory Cards
- **Structure**: Encased in `rounded-xl` (24px) with pure white surface and `1px solid #E2E8F0`.
- **Content Hierarchy**:
  1. Top metadata row: Brand / Model name left-aligned; Floating circular favorite icon right-aligned.
  2. Vehicle hero photography with clean transparent or ambient studio background.
  3. Spec bar: Horizontal strip of muted capsules displaying Transmission, Fuel/EV, and Seats using subtle icons and `label-sm` text.
  4. Bottom bar: Daily rate with large price text (`#0B192C`) paired with a quick-book or inspect button.

### Form Inputs & Search Fields
- **Search Header Field**: Surface `#FFFFFF`, height 56px, `rounded-xl`, border `1px solid #E2E8F0`. Preceded by search icon in `#0B192C` and trailing filter trigger button in Mustard Gold (`#F1B814`).
- **Date / Location Pickers**: Dual-cell layout encapsulated in a unified split card with a subtle divider line (`#E2E8F0`).

### Checkboxes & Radio Controls
- **Radios**: Custom double-ring design. When selected, an outer ring of `#0B192C` encloses a solid `#F1B814` center dot.
- **Checkboxes**: `rounded-md` (6px) with `#E2E8F0` border. Active state features a solid `#0B192C` fill with a sharp white checkmark.

### Floating Bottom Navigation Bar
- Modern floating island layout suspended 16px above the device bottom safe area, with horizontal margins of 20px.
- Background: High-opacity Midnight Navy (`#0B192C` at 95% opacity with `backdrop-filter: blur(20px)`), rounded to 28px (`rounded-3xl`).
- Icons render in Slate (`#94A3B8`), transitioning to glowing Mustard Gold (`#F1B814`) with a micro indicator pip when active.