//
//  Config.h
//  SpotifyCRPA
//
//  Created by MAC on 9/7/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#ifndef Simple_Track_Playback_Config_h
#define Simple_Track_Playback_Config_h

#warning Please update these values to match the settings for your own application as these example values could change at any time.
// For an in-depth auth demo, see the "Basic Auth" demo project supplied with the SDK.
// Don't forget to add your callback URL's prefix to the URL Types section in the target's Info pane!

// Your client ID
#define kClientId "1f8dc928bbbd41ac85e0f2c41a855541"

// Your applications callback URL
#define kCallbackURL "Spotify-CENFOTEC://returnAfterLogin"

// The URL to your token swap endpoint
// If you don't provide a token swap service url the login will use implicit grant tokens, which means that your user will need to sign in again every time the token expires.

// #define kTokenSwapServiceURL "http://localhost:1234/swap"

// The URL to your token refresh endpoint
// If you don't provide a token refresh service url, the user will need to sign in again every time their token expires.

// #define kTokenRefreshServiceURL "http://localhost:1234/refresh"


#define kSessionUserDefaultsKey "SpotifySession"

#endif
