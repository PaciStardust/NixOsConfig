{
  pkgs,
  ...
}:{
  home-manager.users.paci = {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;

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
          workbench.iconTheme = "material-icon-theme";
          editor.minimap.enabled = false;
          editor.cursorSmoothCaretAnimation = "on";
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
        };

        extensions =
          with pkgs.vscode-extensions;
          [
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
              version = "1.26.1";
              sha256 = "WO9vYELNvwmuNeI05sUBE969KAiKYtrJ1fRfdZx3OYU=";
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
              version = "1.2.4";
              sha256 = "QzUroAVMqvIf71LrfFKzg7bpj61hZZZxWXLvLFjNL58=";
            }
            {
              name = "vscode-avalonia";
              publisher = "avaloniateam";
              version = "0.0.32";
              sha256 = "2OpZOltD+4i9tUmk0tTDDdEEhffCvHMAQ6BcsA+2Ou8=";
            }
            {
              name = "avalonia-templates";
              publisher = "addy2142";
              version = "2.0.1";
              sha256 = "avizgdDxWxNLsQzQLy/ZtnZ6zCOcDojuq94Fk3UQvgw=";
            }
            {
              name = "sqlite-viewer";
              publisher = "qwtel";
              version = "25.12.2";
              sha256 = "KxVHIi1obeXaPR8cZhExvRHNV1DyDyphuGyd8R1ee28=";
            }
            {
              name = "vscode-conventional-commits";
              publisher = "vivaxy";
              version = "1.27.0";
              sha256 = "yZ3pVBJGcwSNlN7LvFppAuNomxlQDTvA42kUpsZLj7Y=";
            }
          ];
      };  
    };
  };
}