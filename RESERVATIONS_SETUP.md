# Reservations and owner dashboard

The public site is ready for the reservation form. To make submissions live, create a Supabase project and run `supabase-reservations.sql` in its SQL Editor.

Then send the **Project URL** and **anon public key** (never the `service_role` key). I will connect the form and deliver a password-protected owner dashboard that lets the restaurant see guest name, phone number, reservation schedule, party size, advance-order notes, and status. After you create the owner account in Supabase Authentication, add its Auth UUID to `staff_users` using the final commented SQL line.

The current static prototype safely stores a visitor's most recent draft only in their own browser; it does not transmit customer data until Supabase is connected.