# Moovies

<p align="center">
  <img width="256" height="256" src="https://github.com/user-attachments/assets/55157edc-8533-4f7f-8dd7-262c560fa40f" />
</p>

## Table of Contents
- [About](#about)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [APIs](#apis)
- [How It Works](#how-it-works)
- [Screenshots](#screenshots)
- [Purpose](#purpose)

## About
**Moovies** is an iOS application designed for movie enthusiasts. Users can explore movies, view **popular**, **upcoming**, and **top-rated** lists, search for titles, watch trailers, **download trailers**, save them to a watchlist, and preview posters on detail pages. Movie data is fetched from **The Movie Database (TMDB) API**, and trailers are streamed using the **YouTube Data API**.

## Features
- **Discover:** Explore movies by popularity  
- **Upcoming / Popular / Top Rated:** Quickly browse categorized lists  
- **Search:** Text-based movie search  
- **Trailers:** Watch trailers directly within the app  
- **Watchlist:** Save trailers for later viewing  
- **Download Trailers:** Download trailers for offline access  
- **Detail View:** Fast and cached poster loading  

## Tech Stack
- **Mobile (iOS)**  
  - **UIKit**
  - **iOS 15.6+**  
  - **Alamofire:** HTTP requests  
  - **SDWebImage:** Asynchronous image loading and caching  

## APIs
- **The Movie Database (TMDB) API:** Provides movie data (discover, popular, top_rated, upcoming, search)  
- **YouTube Data API:** Streams and downloads movie trailers  

## How It Works
1. Browse categories (**upcoming**, **popular**, **top-rated**) or the **discover** feed.  
2. Request movie data from TMDB API.  
3. Parse results into model objects and display in lists.  
4. Posters loaded asynchronously via **SDWebImage**.  
5. Trailers fetched via YouTube API and played in-app.  
6. Trailers can be **downloaded for offline viewing**.  
7. Trailers can be **added to watchlist** for later access.  

## Screenshots
<p align="center">
  <img width="1024" height="1024" src="https://github.com/user-attachments/assets/46f2487c-e4f5-4ce4-b763-5d9ffdba3364" />
</p>

## Purpose
Moovies provides a fast and modern interface to discover, search, and view movie details.  
Includes **YouTube trailers**, **offline trailer downloads**, and a **watchlist feature**.
