exports('N_0x46db71883ee9d5af', (uiContainer, weaponHash) => {
    return Citizen.invokeNative('0x46DB71883EE9D5AF', uiContainer, 'stats', GetWeaponStats(weaponHash), PlayerPedId())
});

exports('N_0x951847cef3d829ff', (uiEntry, weaponHash) => {
    return Citizen.invokeNative('0x951847CEF3D829FF', uiEntry, GetWeaponStats(weaponHash), PlayerPedId())
});

exports('EventsUiPeekMessage', (eventChannel) => {
    let retStruct = new DataView(new ArrayBuffer(64));

    Citizen.invokeNative('0x90237103F27F7937', eventChannel, retStruct);

    return {
        eventType: retStruct.getInt32(8 * 0, true),
        intParam: retStruct.getInt32(8 * 1, true),
        hashParam: retStruct.getInt32(8 * 2, true),
        datastoreParam: retStruct.getInt32(8 * 3, true)
    };
});

exports('UiFeedPostHelpText', (text, duration) => {
    const struct1 = new DataView(new ArrayBuffer(96));
    struct1.setInt32(0 * 8, duration, true);

    const struct2 = new DataView(new ArrayBuffer(64));
    struct2.setBigInt64(1 * 8, BigInt(CreateVarString(10, 'LITERAL_STRING', text)), true);

    Citizen.invokeNative('0x049D5C615BD38BAD', struct1, struct2, 1);
});

exports('_InventorySetInventoryItemInspectionEnabled', (weaponHash, inspectionEnabled) => {
    const emptyStruct = new DataView(new ArrayBuffer(256));
    const slotId = GetHashKey('SLOTID_WEAPON_0');

    const charStruct = new DataView(new ArrayBuffer(256));
    if (!Citizen.invokeNative("0x886DFD3E185C8A89", 1, emptyStruct, GetHashKey('CHARACTER'), -1591664384, charStruct))
        return;

    const unkStruct = new DataView(new ArrayBuffer(256));
    if (!Citizen.invokeNative("0x886DFD3E185C8A89", 1, charStruct, 923904168, -740156546, unkStruct))
        return;

    const weaponStruct = new DataView(new ArrayBuffer(256));
    unkStruct.setBigUint64(4 * 8, BigInt(slotId), true);
    if (!Citizen.invokeNative("0x886DFD3E185C8A89", 1, unkStruct, weaponHash, slotId, weaponStruct))
        return;

    return Citizen.invokeNative('0x227522FD59DDB7E8', 1, weaponStruct, inspectionEnabled);
});

function GetWeaponStats(weaponHash) {
    const emptyStruct = new DataView(new ArrayBuffer(256));

    const charStruct = new DataView(new ArrayBuffer(256));
    Citizen.invokeNative('0x886DFD3E185C8A89', 1, emptyStruct, GetHashKey('CHARACTER'), -1591664384, charStruct);

    const unkStruct = new DataView(new ArrayBuffer(256));
    Citizen.invokeNative('0x886DFD3E185C8A89', 1, charStruct, 923904168, -740156546, unkStruct);

    const statsStruct = new DataView(new ArrayBuffer(256));
    Citizen.invokeNative('0x886DFD3E185C8A89', 1, unkStruct, weaponHash, -1591664384, statsStruct);

    return statsStruct;
}