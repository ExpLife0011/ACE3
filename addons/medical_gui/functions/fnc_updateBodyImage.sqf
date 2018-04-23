/*
 * Author: Glowbal
 * Update the body image on the menu
 *
 * Arguments:
 * 0: selection bloodloss <ARRAY>
 * 1: selection damage <ARRAY>
 * 2: selection torniquet <ARRAY>
 * 3: display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0.3, some_display] call ace_medical_menu_fnc_updateBodyImage
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_selectionBloodLoss", "_selectionDamage", "_selectionTourniquet", "_display"];

// Handle the body image coloring
private _availableSelections = [50, 51, 52, 53, 54, 55];
{
    private _colorSelection = [1, 1, 1, 1]; // RGBA

    // private _torniquet = _selectionTourniquet select _forEachIndex;

    private _bloodLoss = _selectionBloodLoss select _forEachIndex;
    if (_bloodLoss > 0) then {
        _colorSelection = [_bloodLoss] call EFUNC(medical_ui,bloodLossToRGBA);
    } else {
        private _damage = _selectionDamage select _forEachIndex;

        _colorSelection = [_damage] call EFUNC(medical_ui,damageToRGBA);
    };

    (_display displayCtrl _x) ctrlSetTextColor _colorSelection;
} forEach _availableSelections;
