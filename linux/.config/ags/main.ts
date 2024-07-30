import "lib/session";
import "scss/style";

import { Bar } from "modules/bar/Bar";
import MenuWindows from "./modules/menus/main.js";
import SettingsDialog from "widget/settings/SettingsDialog";
import Notifications from "./modules/notifications/index.js";
import { forMonitors } from "lib/utils";

App.config({
	onConfigParsed: () =>
		Utils.execAsync(`python3 ${App.configDir}/services/bluetooth.py`),
	windows: [
		...MenuWindows,
		Notifications(),
		SettingsDialog(),
		...forMonitors(Bar),
	],
	closeWindowDelay: {
		sideright: 350,
		launcher: 350,
		bar0: 350,
	},
});
