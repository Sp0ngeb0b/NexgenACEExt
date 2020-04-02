class NexgenACEExtClientConfig extends NexgenPanel;

var NexgenACEExtClient xClient;
var IACEConfigFile ACEConfig;

var UWindowCheckbox perfModeInp;
var UWindowCheckbox soundFixInp;
var UWindowComboControl timingModeList;
var NexgenEditControl timingModeEdit;

var bool bSetValuesCalled;

/***************************************************************************************************
 *
 *  $DESCRIPTION  Creates the contents of the panel.
 *  $OVERRIDE
 *
 **************************************************************************************************/
function setContent() {
  local int region;

	// Retrieve client controller interface.
	xClient = NexgenACEExtClient(client.getController(class'NexgenACEExtClient'.default.ctrlID));
  ACEConfig = xClient.ACEConfig;
  
	// Create layout & add components.
  setAcceptsFocus();
	createPanelRootRegion();
	splitRegionH(12);
	addLabel("ACE Settings", true, TA_Center);
	splitRegionH(1, defaultComponentDist);
	addComponent(class'NexgenDummyComponent');
  
  splitRegionH(20, defaultComponentDist);
  soundFixInp = addCheckBox(TA_Left, "Activate Sound Fix", true);
  splitRegionH(20, defaultComponentDist);
  perfModeInp = addCheckBox(TA_Left, "Activate High Performance Mode (framerate stabilization, only for high end pcs)", true);
  splitRegionH(20, defaultComponentDist);
  splitRegionV(256, defaultComponentDist);
  region = currRegion++;
  addLabel("Timing Mode", true, TA_Left);
  splitRegionV(128, defaultComponentDist);
  timingModeList = addListCombo();
  timingModeEdit = addEditBox();
  
  selectRegion(region);
  selectRegion(splitRegionH(20, defaultComponentDist));
  splitRegionV(128, defaultComponentDist);
  region = currRegion++;
  addLabel("Crosshair Scale", true, TA_Left);
  
	// Configure components.
	perfModeInp.register(self);
	soundFixInp.register(self);
  timingModeList.register(self);
  timingModeList.addItem("Default Mode", "0");
  timingModeList.addItem("Compatibility Mode", "1");
  timingModeList.addItem("Custom Mode", "2");
  timingModeEdit.register(self);
  timingModeEdit.setMaxLength(1);
  timingModeEdit.setNumericOnly(true);

  setValues();
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Notifies the dialog of an event (caused by user interaction with the interface).
 *  $PARAM        control    The control object where the event was triggered.
 *  $PARAM        eventType  Identifier for the type of event that has occurred.
 *  $REQUIRE      control != none
 *  $OVERRIDE
 *
 **************************************************************************************************/
function notify(UWindowDialogControl control, byte eventType) {
  local int index, timingMode;

	super.notify(control, eventType);
  
  if (eventType == DE_Click && control == perfModeInp) {
    ACEConfig.SetConfigVariable("bForceHighPerf", CVAR_BOOL, string(perfModeInp.bChecked));
    ACEConfig.WriteConfig(".");
    client.showMsg("<C07>Changes will take effect after a reconnect.");
  } else if (eventType == DE_Click && control == soundFixInp) {
    client.player.consoleCommand("mutate ACE SFToggle");
  } else if(control == timingModeList && eventType == DE_Change && !bSetValuesCalled) {
    index = timingModeList.getSelectedIndex();
    
    if(index < 2) {
      if(index == 1 ) timingMode = 5;
      ACEConfig.SetConfigVariable("TimingMode", CVAR_Int, string(timingMode));
      ACEConfig.WriteConfig(".");
      setValues();
      client.showMsg("<C07>Changes will take effect after a reconnect.");     
    } else {
      timingModeEdit.setDisabled(false);
    }
  } else if(control == timingModeEdit && eventType == DE_EnterPressed) {
    ACEConfig.SetConfigVariable("TimingMode", CVAR_Int, timingModeEdit.getValue());
    ACEConfig.WriteConfig(".");
    setValues();
    client.showMsg("<C07>Changes will take effect after a reconnect.");      
  }
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Sets the values of all input components.
 *
 **************************************************************************************************/
function setValues() {
  local int timingMode;

  bSetValuesCalled = true;
	perfModeInp.bChecked = bool(ACEConfig.QueryConfigVariable("bForceHighPerf", ACEConfig.ConfigVariableType.CVAR_BOOL, false));
  soundFixInp.bChecked = !bool(ACEConfig.QueryConfigVariable("bDisableSoundFix", ACEConfig.ConfigVariableType.CVAR_BOOL, false));
  
  timingMode = int(ACEConfig.QueryConfigVariable("TimingMode", ACEConfig.ConfigVariableType.CVAR_INT, false));
  timingModeEdit.setValue(string(timingMode));
  switch timingMode {
    case 0:
      timingModeList.setSelectedIndex(0);
      timingModeEdit.setValue("0");
      timingModeEdit.setDisabled(true);
      break;
    case 5:
      timingModeList.setSelectedIndex(1);
      timingModeEdit.setValue("1");
      timingModeEdit.setDisabled(true);
      break;
    default:
      timingModeList.setSelectedIndex(2);
      timingModeEdit.setDisabled(false);
      break;
  }
  bSetValuesCalled = false;
}

/***************************************************************************************************
 *
 *  $DESCRIPTION  Default properties block.
 *
 **************************************************************************************************/

defaultproperties
{
     panelIdentifier="NexgenACEExtClientConfig"
     PanelHeight=128.000000
}