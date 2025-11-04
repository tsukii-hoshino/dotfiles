import app from "ags/gtk4/app";
import { execAsync } from "ags/process";
import { Astal, Gtk } from "ags/gtk4";
import scss from "./style.scss";
import Gdk from "gi://Gdk?version=4.0";

/* Power menu */
function PowerMenu(monitor = 0) {
  return (
    <Astal.Window
      visible={false}
      class="powermenu"
      name="PowerMenu"
      namespace="powermenu"
      monitor={monitor}
      layer={Astal.Layer.OVERLAY}
      application={app}
      keymode={Astal.Keymode.EXCLUSIVE}
      exclusivity={Astal.Exclusivity.IGNORE}
    >
      <Gtk.EventControllerKey
        onKeyPressed={({ widget }, keyval: number) => {
          if (keyval === Gdk.KEY_Escape) {
            widget.hide();
          }
        }}
      />
      <Gtk.Box orientation={Gtk.Orientation.HORIZONTAL} spacing={30}>
        <PM_Button label="logout" icon="" exec="loginctl terminate-session" />
        <PM_Button label="shutdown" icon="" exec="systemctl poweroff" />
        <PM_Button label="suspend" icon="" exec="systemctl suspend" />
        <PM_Button label="reboot" icon="" exec="systemctl reboot" />
      </Gtk.Box>
    </Astal.Window>
  );
}

function PM_Button({ label = " ", icon = "", exec = "" }) {
  return (
    <Gtk.Button
      onClicked={() => {
        const widget = app.get_window("PowerMenu");
        execAsync(exec);
        widget?.hide();
      }}
      class="button"
    >
      <Gtk.Box
        orientation={Gtk.Orientation.VERTICAL}
        spacing={12}
        halign={Gtk.Align.CENTER}
      >
        <Gtk.Label label={icon} class="button-icon" />
        <Gtk.Label label={label} class="button-label" />
        <Gtk.Box class="underline" halign={Gtk.Align.CENTER} />
      </Gtk.Box>
    </Gtk.Button>
  );
}

/* Bar */
function Bar(monitor = 0) {
  const widgetSpacing = 4;
  return (
    <Astal.Window
      visible={true}
      namespace="bar"
      name="Bar"
      class="bar"
      monitor={monitor}
      layer={Astal.Layer.TOP}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      heightRequest={46}
      canFocus={false}
    >
      <Gtk.Box class="bar-container">
        <Gtk.CenterBox class="bar-centerbox" hexpand>
          <Gtk.Box
            halign={Gtk.Align.START}
            class="widgets-left"
            spacing={widgetSpacing}
            homogeneous={false}
            $type="start"
          >
            <Gtk.Label label="homaofaoprejwoirwjerajwefmawemfk" />
          </Gtk.Box>

          <Gtk.Box
            halign={Gtk.Align.CENTER}
            class="widgets-center"
            spacing={widgetSpacing}
            homogeneous={false}
            $type="center"
          >
            <Gtk.Label label="peam center" />
          </Gtk.Box>

          <Gtk.Box
            halign={Gtk.Align.END}
            class="widgets-right"
            spacing={widgetSpacing}
            homogeneous={false}
            $type="end"
          >
            <Gtk.Label label="peam right" />
          </Gtk.Box>
        </Gtk.CenterBox>
      </Gtk.Box>
    </Astal.Window>
  );
}

app.start({
  instanceName: "ags",
  css: scss,
  main() {
    PowerMenu();
  },
});
