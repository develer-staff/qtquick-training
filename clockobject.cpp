#include "clockobject.h"

ClockObject::ClockObject(QObject* parent)
    : QAbstractListModel(parent)
{
    m_alarms.append({ QDateTime({ 2021, 10, 22 }, { 9, 00 }), false });
    m_alarms.append({ QDateTime({ 2021, 10, 24 }, { 18, 00 }), true });
}

int ClockObject::rowCount(const QModelIndex& parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    return (int)m_alarms.size();
}

QVariant ClockObject::data(const QModelIndex& index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (index.row() >= m_alarms.size())
        return QVariant();

    switch (role) {
    case DateTime:
        return m_alarms.at(index.row()).datetime;
    case Active:
        return m_alarms.at(index.row()).active;
    }

    return QVariant();
}

QHash<int, QByteArray> ClockObject::roleNames() const
{
    static QHash<int, QByteArray> roles = {
        { DateTime, "datetime" },
        { Active, "active" },
    };
    return roles;
}

void ClockObject::addAlarm(const QDateTime& alarm)
{
    beginInsertRows(QModelIndex(), m_alarms.size(), m_alarms.size());
    m_alarms.append({ alarm, true });
    endInsertRows();
}
