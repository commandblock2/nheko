// SPDX-FileCopyrightText: 2022 Nheko Contributors
//
// SPDX-License-Identifier: GPL-3.0-or-later

#pragma once

#include <QSortFilterProxyModel>
#include <QString>

#include <mtx/events/power_levels.hpp>

#include "TimelineModel.h"

class TimelineFilter : public QSortFilterProxyModel
{
    Q_OBJECT

    Q_PROPERTY(QString filterByThread READ filterByThread WRITE setThreadId NOTIFY threadIdChanged)
    Q_PROPERTY(QString filterByContent READ filterByContent WRITE setContentFilter NOTIFY
                 contentFilterChanged)
    Q_PROPERTY(TimelineModel *source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(int currentIndex READ currentIndex WRITE setCurrentIndex NOTIFY currentIndexChanged)

public:
    explicit TimelineFilter(QObject *parent = nullptr);

    QString filterByThread() const { return threadId; }
    QString filterByContent() const { return contentFilter; }
    TimelineModel *source() const;
    int currentIndex() const;

    void setThreadId(const QString &t);
    void setContentFilter(const QString &t);
    void setSource(TimelineModel *t);
    void setCurrentIndex(int idx);

    Q_INVOKABLE QVariant dataByIndex(int i, int role = Qt::DisplayRole) const
    {
        return data(index(i, 0), role);
    }

signals:
    void threadIdChanged();
    void contentFilterChanged();
    void sourceChanged();
    void currentIndexChanged();

protected:
    bool filterAcceptsRow(int source_row, const QModelIndex &source_parent) const override;

private:
    QString threadId, contentFilter;
};
