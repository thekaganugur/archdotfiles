"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", function () { return console.log("Control+Enter was pressed"); });
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
    "browser.defaultUrl": "https://google.com",
    "ui.fontSize": "15px",
    "sidebar.width": "12em",
    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents"],
    //"oni.loadInitVim": false,
    "editor.fontSize": "19px",
    "editor.fontFamily": "Fira Mono",
    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "statusbar.priority": {
        "oni.status.workingDirectory": 0,
        "oni.status.linenumber": 2,
        "oni.status.gitHubRepo": 0,
        "oni.status.mode": 0,
        "oni.status.filetype": 1,
        "oni.status.git": -1
    },
    activate: exports.activate,
    "oni.hideMenu": "hidden",
    "oni.loadInitVim": true,
    "oni.useDefaultConfig": false,
    "ui.colorscheme": "n/a",
    "autoClosingPairs.enabled": false,
    "commandline.mode": false,
    "wildmenu.mode": false,
    "tabs.mode": "native",
    "statusbar.enabled": false,
    "sidebar.enabled": false,
    "sidebar.default.open": false,
    "learning.enabled": false,
    "achievements.enabled": false,
    "editor.typingPrediction": false,
    "editor.textMateHighlighting.enabled": false
};
