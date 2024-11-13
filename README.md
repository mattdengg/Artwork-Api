# Artwork-Api

## Overview

This ArtworksApi is a SwiftUI application designed to display artwork details from the Art Institute of Chicago’s public API. The app fetches data from the API, lists the artworks in a scrollable view, and allows users to view detailed information about each piece.

### Features

	•	Artwork Listing: Fetches and displays a list of artworks using data from the Art Institute of Chicago’s API.
	•	Detail View: Shows a detailed view for each artwork, including the title and image (if available).
	•	Asynchronous Data Fetching: Implements Combine and URLSession for handling asynchronous API requests.

### Project Structure

1. ArtworkViewModel.swift

	•	Purpose: Manages data fetching and provides the list of artworks to the view.
	•	Key Functions:
	•	fetchArtwork(): Fetches artwork data from the API using URLSession and decodes it into Artwork objects.
	•	Dependencies: Uses Combine to handle data fetching and error management.

2. ArtworkDetailView.swift

	•	Purpose: Displays detailed information for a selected artwork, including its title and image.
	•	Components:
	•	artworkImageView: Shows the artwork image using AsyncImage with a fallback placeholder.
	•	Navigation: Uses NavigationTitle for the page title.

3. Artwork.swift

	•	Purpose: Defines the Artwork data model and response structure for decoding API data.
	•	Components:
	•	ArtworkDataResponse: Wrapper struct to decode the API response into a list of artworks.
	•	Artwork: Represents each artwork with properties like id, title, and imageId.

### Installation

	1.	Clone this repository to your local machine.
	2.	Open the project in Xcode.
	3.	Build and run the project on a simulator or device with an internet connection to fetch and display artwork data.

### Usage

	1.	Browse Artworks: The main view displays a list of artworks. Each item shows a brief description of the artwork.
	2.	View Details: Tap on any artwork to navigate to its detail view, where you can see the title and full image (if available).

### Notes

	•	API Source: The app fetches data from the Art Institute of Chicago’s API.
	•	Limitations: Some artworks may not have associated images, and a fallback message is shown in such cases.

### Future Improvements

	•	Add error handling and user-friendly messages for network issues.
	•	Optimize image loading for smoother UI performance.
