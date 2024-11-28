{ inputs, ... }:

{
  home = {
    file."Library/Application Support/Übersicht/widgets/simple-bar".source = inputs.simple-bar;

    file.".simplebarrc".text = # json
      ''
        {
          "global": {
            "theme": "auto",
            "floatingBar": true,
            "noBarBg": true,
            "noColorInData": false,
            "bottomBar": false,
            "inlineSpacesOptions": false,
            "disableNotifications": true,
            "compactMode": true,
            "widgetMaxWidth": "160px",
            "spacesBackgroundColorAsForeground": false,
            "widgetsBackgroundColorAsForeground": false,
            "font": "JetBrains Mono, Monaco, Menlo, monospace",
            "fontSize": "11px",
            "yabaiPath": "/opt/homebrew/bin/yabai",
            "shell": "sh",
            "slidingAnimationPace": 4,
            "externalConfigFile": true,
            "enableServer": false,
            "serverSocketPort": 7776,
            "yabaiServerRefresh": false
          },
          "themes": {
            "lightTheme": "OneLight",
            "darkTheme": "NightShiftDark"
          },
          "process": {
            "showOnDisplay": "",
            "displayOnlyCurrent": false,
            "centered": false,
            "showCurrentSpaceMode": true,
            "hideWindowTitle": true,
            "displayOnlyIcon": true,
            "displaySkhdMode": false,
            "displayStackIndex": false,
            "displayOnlyCurrentStack": false
          },
          "spacesDisplay": {
            "showOnDisplay": "",
            "exclusions": "",
            "titleExclusions": "",
            "spacesExclusions": "",
            "exclusionsAsRegex": false,
            "displayAllSpacesOnAllScreens": false,
            "hideDuplicateAppsInSpaces": true,
            "displayStickyWindowsSeparately": false,
            "hideCreateSpaceButton": false,
            "hideEmptySpaces": false,
            "showOptionsOnHover": true,
            "switchSpacesWithoutYabai": false
          },
          "widgets": {
            "processWidget": false,
            "weatherWidget": false,
            "netstatsWidget": false,
            "cpuWidget": false,
            "batteryWidget": true,
            "wifiWidget": true,
            "vpnWidget": false,
            "zoomWidget": false,
            "soundWidget": true,
            "micWidget": true,
            "dateWidget": true,
            "timeWidget": true,
            "keyboardWidget": false,
            "spotifyWidget": false,
            "cryptoWidget": false,
            "stockWidget": false,
            "musicWidget": false,
            "mpdWidget": false,
            "browserTrackWidget": false,
            "dndWidget": false
          },
          "weatherWidgetOptions": {
            "refreshFrequency": 1800000,
            "showOnDisplay": "",
            "unit": "C",
            "hideLocation": false,
            "hideGradient": false,
            "customLocation": ""
          },
          "netstatsWidgetOptions": {
            "refreshFrequency": 2000,
            "showOnDisplay": "",
            "displayAsGraph": false
          },
          "cpuWidgetOptions": {
            "refreshFrequency": 2000,
            "showOnDisplay": "",
            "displayAsGraph": false
          },
          "batteryWidgetOptions": {
            "refreshFrequency": 10000,
            "showOnDisplay": "",
            "toggleCaffeinateOnClick": false,
            "caffeinateOption": ""
          },
          "networkWidgetOptions": {
            "refreshFrequency": 20000,
            "showOnDisplay": "",
            "networkDevice": "en0",
            "hideWifiIfDisabled": false,
            "toggleWifiOnClick": false,
            "hideNetworkName": false
          },
          "vpnWidgetOptions": {
            "refreshFrequency": 8000,
            "showOnDisplay": "",
            "vpnConnectionName": "",
            "vpnShowConnectionName": false
          },
          "zoomWidgetOptions": {
            "refreshFrequency": 5000,
            "showOnDisplay": "",
            "showVideo": true,
            "showMic": true
          },
          "soundWidgetOptions": {
            "refreshFrequency": 20000,
            "showOnDisplay": ""
          },
          "micWidgetOptions": {
            "refreshFrequency": 20000,
            "showOnDisplay": ""
          },
          "dateWidgetOptions": {
            "refreshFrequency": 30000,
            "showOnDisplay": "",
            "shortDateFormat": true,
            "locale": "en-UK",
            "calendarApp": ""
          },
          "timeWidgetOptions": {
            "refreshFrequency": 1000,
            "showOnDisplay": "",
            "hour12": false,
            "dayProgress": false,
            "showSeconds": true
          },
          "keyboardWidgetOptions": {
            "refreshFrequency": 20000,
            "showOnDisplay": ""
          },
          "cryptoWidgetOptions": {
            "refreshFrequency": 300000,
            "showOnDisplay": "",
            "denomination": "usd",
            "identifiers": "bitcoin,ethereum,celo",
            "precision": 5
          },
          "stockWidgetOptions": {
            "refreshFrequency": 900000,
            "showOnDisplay": "",
            "yahooFinanceApiKey": "YOUR_API_KEY",
            "symbols": "AAPL,TSLA",
            "showSymbol": true,
            "showCurrency": true,
            "showMarketPrice": true,
            "showMarketChange": false,
            "showMarketPercent": true,
            "showColor": true
          },
          "spotifyWidgetOptions": {
            "refreshFrequency": 10000,
            "showOnDisplay": "",
            "showSpecter": true
          },
          "musicWidgetOptions": {
            "refreshFrequency": 10000,
            "showOnDisplay": "",
            "showSpecter": true
          },
          "mpdWidgetOptions": {
            "refreshFrequency": 10000,
            "showOnDisplay": "",
            "showSpecter": true,
            "mpdPort": "6600",
            "mpdHost": "127.0.0.1",
            "mpdFormatString": "%title%[ - %artist%]|[%file%]"
          },
          "browserTrackWidgetOptions": {
            "refreshFrequency": 10000,
            "showOnDisplay": "",
            "showSpecter": true
          },
          "userWidgets": {
            "userWidgetsList": {}
          },
          "customStyles": {
            "styles": "/* your custom css styles here */"
          },
          "dndWidgetOptions": {
            "refreshFrequency": 60000,
            "showDndLabel": false
          }
        }
      '';
  };
}
