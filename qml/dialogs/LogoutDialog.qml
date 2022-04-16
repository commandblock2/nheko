// SPDX-FileCopyrightText: 2021 Nheko Contributors
// SPDX-FileCopyrightText: 2022 Nheko Contributors
// SPDX-License-Identifier: GPL-3.0-or-later
import Qt.labs.platform 1.1 as P
import QtQuick 2.15
import QtQuick.Controls 2.15
import im.nheko

P.MessageDialog {
    id: logoutRoot
    buttons: P.MessageDialog.Ok | P.MessageDialog.Cancel
    flags: Qt.Tool | Qt.WindowStaysOnTopHint | Qt.WindowCloseButtonHint | Qt.WindowTitleHint
    modality: Qt.WindowModal
    text: CallManager.isOnCall ? qsTr("A call is in progress. Log out?") : qsTr("Are you sure you want to log out?")
    title: qsTr("Log out")

    onAccepted: Nheko.logout()
}
