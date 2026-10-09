{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.vscode.enable = lib.mkEnableOption "STRDST VS Code";
  
  config = lib.mkIf config.strdst-programs.vscode.enable {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;

      package = pkgs.vscode.fhsWithPackages (
        ps: with ps; [
        stdenv.cc.cc
        fontconfig
        libxrandr
        libICE
        libX11
        libSM
      ]);

      profiles.default = {
        enableUpdateCheck = true;

        userSettings = {
          nix.enableLanguageServer = true;
          nix.serverPath = "${pkgs.nixd}/bin/nixd";
          terminal.integrated.commandsToSkipShell = [
            "-workbench.action.quickOpen"
            "-workbench.action.quickOpenNavigateNextInViewPicker"
            "-workbench.action.quickOpenView"
          ];
          workbench.colorTheme = "Visual Studio 2019 Dark";
          workbench.preferredLightColorTheme = "Quiet Light";
          workbench.iconTheme = "material-icon-theme";
          editor.minimap.enabled = false;
          editor.cursorSmoothCaretAnimation = "on";
          editor.fontFamily = "'JetBrains Mono'";
          workbench.editor.empty.hint = "hidden";
          window.autoDetectColorScheme = true;
          git.enableSmartCommit = true;
          git.autofetch = true;
          git.confirmSync = false;
          git.replaceTagsWhenPull = true;
          git.autoStash = true;
          git.openRepositoryInParentFolders = "never";
          "[jsonc]" = {
            editor.defaultFormatter = "esbenp.prettier-vscode";
          };
          csharp.experimental.debug.hotReload = true;
          csharp.inlayHints.enableInlayHintsForImplicitVariableTypes = true;
          dotnet.inlayHints.enableInlayHintsForLiteralParameters = true;
          dotnet.inlayHints.enableInlayHintsForParameters = true;
          dotnet.inlayHints.enableInlayHintsForOtherParameters = true;
          todo-tree.general.statusBar = "total";
          todo-tree.general.tags = [
            "BUG"
            "HACK"
            "FIXME"
            "TODO"
            "XXX"
            "[ ]"
            "[x]"
            "bug"
            "hack"
            "fixme"
            "todo"
            "Bug"
            "Hack"
            "Fixme"
            "Todo"
            "throw new NotImplementedException();"
            "throw new System.NotImplementedException();"
          ];
          csharp.debug.console = "integratedTerminal";
          continue.showInlineTip = false;
          discord.lowerDetailsEditing = "Working on: {workspace}";
          discord.detailsEditing = "Editing {file_name} ({total_lines} lines)";
          chat.disableAIFeatures = true;
          terminal.integrated.fontFamily = "Jetbrains Mono";
        };

        extensions = with pkgs.vscode-extensions; [
          catppuccin.catppuccin-vsc
          continue.continue
          ms-azuretools.vscode-containers
          ms-dotnettools.vscode-dotnet-runtime
          ms-dotnettools.csdevkit
          ms-dotnettools.csharp
          ms-vscode.hexeditor
          ms-vscode.remote-explorer
          ms-vscode.cpptools
          ms-vscode.cpptools-extension-pack
          ms-vscode.cmake-tools
          jnoortheen.nix-ide
          platformio.platformio-vscode-ide
          yzhang.markdown-all-in-one
          enkia.tokyo-night
          ms-azuretools.vscode-docker
          mechatroner.rainbow-csv
          oderwat.indent-rainbow
          gruntfuggly.todo-tree
          vscode-icons-team.vscode-icons
          visualstudiotoolsforunity.vstuc
          esbenp.prettier-vscode
          pkief.material-icon-theme
          rust-lang.rust-analyzer
          github.vscode-github-actions
          github.vscode-pull-request-github
          codezombiech.gitignore
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vscode-sshfs";
            publisher = "kelvin";
            version = "1.27.0";
            sha256 = "Fc35SCMNEzql9in4cKocPjNDgvKGFnrV+QDBdO1SmGs=";
          }
          {
            name = "discord-vscode";
            publisher = "icrawl";
            version = "5.9.2";
            sha256 = "43ZAwaApQBqNzq25Uy/AmkQqprU7QlgJVVimfCaiu9k=";
          }
          {
            name = "cpptools-themes";
            publisher = "ms-vscode";
            version = "2.0.0";
            sha256 = "YWA5UsA+cgvI66uB9d9smwghmsqf3vZPFNpSCK+DJxc=";
          }
          {
            name = "vscode-theme-onedark";
            publisher = "akamud";
            version = "2.3.0";
            sha256 = "8GGv4L4poTYjdkDwZxgNYajuEmIB5XF1mhJMxO2Ho84=";
          }
          {
            name = "tokyo-hack";
            publisher = "ajshortt";
            version = "0.3.2";
            sha256 = "++ue0yAd/rnljsNPf++vsptoVxsKqyEgPVNDGWsA69o=";
          }
          {
            name = "doki-theme";
            publisher = "unthrottled";
            version = "88.1.18";
            sha256 = "7Ditwj7U26t3v4ofpqw/sHar6uE46E4DWVwGZjziZfM=";
          }
          {
            name = "qml";
            publisher = "bbenoist";
            version = "1.0.0";
            sha256 = "tphnVlD5LA6Au+WDrLZkAxnMJeTCd3UTyTN1Jelditk=";
          }
          {
            name = "vscode-nuget-gallery";
            publisher = "patcx";
            version = "1.2.6";
            sha256 = "v2RX81kkyilZlGlq06tWc2yuwv9i2lbILo6YDMwCAVw=";
          }
          {
            name = "vscode-avalonia";
            publisher = "avaloniateam";
            version = "12.2.2";
            sha256 = "oZu0s9twZ/KXgazOuJrkr8t5uswRVqkJu1snUD63tk8=";
          }
          {
            name = "sqlite-viewer";
            publisher = "qwtel";
            version = "26.9.1";
            sha256 = "0/EW76Pe0LY6w7kfWX0Ka0kvPbMvNySsUj2pfdfHrdA=";
          }
          {
            name = "vscode-conventional-commits";
            publisher = "vivaxy";
            version = "1.31.0";
            sha256 = "3HCybDoM4jk/A9xMeu9vNvdwGempP3azG1nqPNQemJ4=";
          }
        ];
      };
    };  
  };
}
