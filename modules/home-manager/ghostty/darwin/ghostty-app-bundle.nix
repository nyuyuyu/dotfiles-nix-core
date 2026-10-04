{
  config,
  lib,
  pkgs,
  ...
}:

let
  appName = "Ghostty New Window";
  appPath = "Applications/Home Manager Apps/${appName}.app";
  iconFile = ./icon.icns;
  runScript = pkgs.writeShellScript "ghostty-new-window" ''
    exec open -na ghostty
  '';
  infoPlist = pkgs.writeText "ghostty-new-window-Info.plist" ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>CFBundleExecutable</key>
        <string>run</string>
        <key>CFBundleIdentifier</key>
        <string>com.localhost.ghostty</string>
        <key>CFBundleName</key>
        <string>Ghostty New Window</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>LSUIElement</key>
        <true/>
        <key>CFBundleIconFile</key>
        <string>icon.icns</string>
    </dict>
    </plist>
  '';
in
{
  config = lib.mkIf pkgs.stdenv.isDarwin {
    home.activation.createGhosttyNewWindowApp = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      APP_DIR="$HOME/${appPath}"

      $DRY_RUN_CMD rm -rf "$APP_DIR"
      $DRY_RUN_CMD mkdir -p "$APP_DIR/Contents/MacOS"
      $DRY_RUN_CMD mkdir -p "$APP_DIR/Contents/Resources"

      $DRY_RUN_CMD cp ${runScript} "$APP_DIR/Contents/MacOS/run"
      $DRY_RUN_CMD chmod +x "$APP_DIR/Contents/MacOS/run"
      $DRY_RUN_CMD cp ${infoPlist} "$APP_DIR/Contents/Info.plist"
      $DRY_RUN_CMD cp ${iconFile} "$APP_DIR/Contents/Resources/icon.icns"
    '';
  };
}
