import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;


class utvv_watch_face_v2App extends Application.AppBase {

    //! Constructor
    public function initialize() {
        AppBase.initialize();
    }

    //! Handle app startup
    //! @param state Startup arguments
    public function onStart(state as Dictionary?) as Void {
    }

    //! Handle app shutdown
    //! @param state Shutdown arguments
    public function onStop(state as Dictionary?) as Void {
    }

    //! Return the initial view for the app
    //! @return Array Pair [View, Delegate] or Array [View]
    public function getInitialView() as Array<Views or InputDelegates>? {
        return [new $.utvv_watch_face_v2View(), new $.AnalogDelegate() ];
    }

    function getSettingsView() { // as [Views] or [Views, InputDelegates] {
        return [new $.AnalogSettingsViewTest(), new $.Menu2TestMenu2Delegate()];  // as Array[InputDelegate];
    }
}

