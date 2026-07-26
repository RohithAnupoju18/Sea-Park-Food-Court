# Sea Park Food Court

A modern, responsive restaurant website and reservation system for **Sea Park Food Court**, a coastal dining establishment located at RK Beach, Visakhapatnam.

## Features

### 🌊 Public Website
- **Hero Section**: Eye-catching landing with coastal theming
- **Story Section**: Restaurant history and key statistics
- **Menu Showcase**: Featured dishes with pricing and descriptions
- **Chef's Spotlight**: Daily recommendation section
- **Gallery**: Visual journey through the dining experience
- **Guest Reviews**: Integrated Google Reviews display
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile
- **Interactive Elements**: Smooth animations, parallax effects, and cursor-following glow

### 📝 Reservation System
- **Client-Side Draft Storage**: Visitors can save reservation drafts locally (no data transmitted until Supabase is connected)
- **Form Validation**: Real-time input validation for guest details
- **Time Slots**: Pre-defined dining time options (7:00 PM - 9:00 PM)
- **Party Sizes**: Accommodates 2-5+ guests
- **Special Requests**: Option for advance orders or special occasions

### 🔐 Owner Dashboard (Requires Supabase Setup)
Once Supabase is configured, owners can:
- View all guest reservations
- Track guest names, phone numbers, and party sizes
- Monitor reservation schedules and status
- Review advance order notes
- Update reservation status (pending → confirmed → seated → completed/cancelled)

## Getting Started

### Basic Setup (Static Website Only)
1. Download or clone this repository
2. Open `sea-park-food-court.html` in a web browser
3. The website is fully functional with local draft storage

### Full Setup (With Reservations Backend)

#### Step 1: Create Supabase Project
1. Go to [supabase.com](https://supabase.com)
2. Create a new project
3. Copy your **Project URL** and **anon public key** (⚠️ never share the `service_role` key)

#### Step 2: Initialize Database
1. In Supabase, open **SQL Editor**
2. Create a new query
3. Copy and paste the contents of `supabase-reservations.sql`
4. Execute the query

#### Step 3: Configure Owner Access
1. In Supabase **Authentication**, create an owner/manager account
2. Copy the Auth UUID of this account
3. In SQL Editor, run:
   ```sql
   insert into public.staff_users (id) values ('OWNER_AUTH_UUID');
   ```
   Replace `OWNER_AUTH_UUID` with the actual UUID from step 2

#### Step 4: Connect to Frontend
Send the **Project URL** and **anon public key** to the developer. The form will be activated and connected to your database.

## File Structure

```
Sea-Park-Food-Court/
├── sea-park-food-court.html      # Main website and reservation form
├── supabase-reservations.sql     # Database schema and policies
├── RESERVATIONS_SETUP.md         # Detailed setup instructions
├── README.md                     # This file
└── LICENSE                       # MIT License
```

## Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript (vanilla)
- **Styling**: Custom CSS with CSS variables
- **Animations**: CSS3 transitions and keyframe animations
- **Fonts**: Google Fonts (DM Sans, Playfair Display)
- **Images**: Unsplash API for high-quality restaurant photos
- **Backend**: Supabase (PostgreSQL + Auth)
- **Database**: PostgreSQL with Row Level Security (RLS)

## Design Highlights

- **Color Palette**: Ocean-inspired blues, aqua accents, and gold highlights
- **Typography**: Serif headlines (Playfair Display) and clean body text (DM Sans)
- **Visual Effects**:
  - Scroll-triggered animations
  - Cursor-following glow effect
  - Animated journey map with fish
  - Parallax scrolling
  - 3D card hover effects

## Security

### Data Privacy
- **Client-side only**: Guest data is stored locally in browser localStorage until Supabase is connected
- **Row Level Security**: Database enforces strict access control
  - Anonymous users: Can only submit reservations
  - Authenticated staff: Can view and manage reservations
  - Public cannot access guest information

### Authentication
- Owner accounts created in Supabase Authentication
- Access to reservations dashboard restricted to staff_users table
- No sensitive keys exposed in frontend code

## Browser Support

- Chrome/Edge 90+
- Firefox 88+
- Safari 14+
- Mobile browsers (iOS Safari, Chrome Mobile)
- Respects prefers-reduced-motion for accessibility

## Performance

- **Fully Static**: No build process required
- **Optimized Images**: Lazy-loading through Unsplash
- **Minimal JavaScript**: ~4KB of vanilla JavaScript
- **CSS-only Animations**: Hardware-accelerated transforms
- **Accessibility**: ARIA labels, semantic HTML, keyboard navigation

## Customization

### Branding
- Update color variables in `:root` CSS
- Replace `SEA·PARK` text with your restaurant name
- Modify the address section with your location

### Content
- Update restaurant description and statistics
- Customize menu items and images
- Modify opening hours and contact details
- Change Google Maps link to your location

### Images
All images use Unsplash URLs. Replace with your own images:
- Hero background: `https://images.unsplash.com/...`
- Menu items: Update dish images
- Gallery images: Replace with restaurant photos

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Developed by **Rohith Anupoju**

## Contact & Support

For questions or support regarding this website:
- 📍 **Location**: RK Beach, Visakhapatnam, Andhra Pradesh 530003
- 🌐 **Maps**: [Get Directions](https://www.google.com/maps/place/Sea+Park+Food+Court/)
- ⭐ **Reviews**: [Google Maps](https://share.google/eKfWMlfRQVUbPuuOU)

## Roadmap

- [ ] Integration with payment processing (optional)
- [ ] Email confirmation for reservations
- [ ] SMS notifications for guests
- [ ] Analytics dashboard for owner
- [ ] Multi-language support
- [ ] QR code menu system

---

**Sea Park Food Court** — Coastal dining, thoughtfully served. 🐟