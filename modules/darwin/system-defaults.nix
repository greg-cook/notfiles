{ ... }:

{
  system.defaults = {
    ActivityMonitor.ShowCategory = 100;
    NSGlobalDomain = {
      AppleShowAllFiles = false;
      AppleInterfaceStyleSwitchesAutomatically = true;
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "WhenScrolling";
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticWindowAnimationsEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
    };
    CustomUserPreferences = {
      "NSGlobalDomain" = {
        "NSStatusItemSpacing" = 6;
        "NSStatusItemSelectionPadding" = 6;
      };
      "com.knollsoft.Rectangle" = {
        "allowAnyShortcut" = 1;
        "alternateDefaultShortcuts" = 1;
        "launchOnLogin" = 1;
        "subsequentExecutionMode" = 0;
        "selectedCycleSizes" = 31;
      };
    };
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
    WindowManager.GloballyEnabled = false;
    menuExtraClock = {
      Show24Hour = true;
      ShowDayOfMonth = true;
      ShowDayOfWeek = true;
    };
    controlcenter = {
      AirDrop = false;
      BatteryShowPercentage = false;
      Bluetooth = false;
      Display = false;
      Sound = false;
    };
    finder = {
      _FXSortFoldersFirst = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = false;
      FXDefaultSearchScope = "SCcf";
      FXPreferredViewStyle = "clmv";
      NewWindowTarget = "Home";
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    trackpad = {
      ActuationStrength = 0;
      FirstClickThreshold = 0;
      SecondClickThreshold = 1;
    };
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      minimize-to-application = true;
      showhidden = true;
      show-recents = false;
      static-only = true;
      tilesize = 48;
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
    nonUS.remapTilde = true;
  };
}
