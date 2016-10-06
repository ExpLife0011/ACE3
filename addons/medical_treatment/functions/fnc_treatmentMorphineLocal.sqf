/*
 * Author: KoffeinFlummi
 * Local callback when the morphine treatment is complete
 *
 * Arguments:
 * 0: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

#define MORPHINEHEAL 0.4

params ["_target"];

// reduce pain, pain sensitivity
private _morphine = ((_target getVariable [QEGVAR(medical,morphine), 0]) + MORPHINEHEAL) min 1;
_target setVariable [QEGVAR(medical,morphine), _morphine, true];

private _pain = ((_target getVariable [QEGVAR(medical,pain), 0]) - MORPHINEHEAL) max 0;
_target setVariable [QEGVAR(medical,pain), _pain, true];

// @todo overdose