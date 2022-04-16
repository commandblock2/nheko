// SPDX-FileCopyrightText: 2021 Nheko Contributors
// SPDX-FileCopyrightText: 2022 Nheko Contributors
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.2
import im.nheko

Popup {
    property string errorString
    property var image

    modal: true

    background: Rectangle {
        border.color: timelineRoot.palette.windowText
        color: timelineRoot.palette.window
    }

    // only set the anchors on Qt 5.12 or higher
    // see https://doc.qt.io/qt-5/qml-qtquick-controls2-popup.html#anchors.centerIn-prop
    Component.onCompleted: {
        if (anchors)
            anchors.centerIn = parent;
    }

    RowLayout {
        Image {
            Layout.preferredHeight: 16
            Layout.preferredWidth: 16
            source: "image://colorimage/" + image + "?" + timelineRoot.palette.windowText
        }
        Label {
            color: timelineRoot.palette.windowText
            text: errorString
        }
    }
}
