#pragma once

#include <QAbstractListModel>
#include <QDateTime>
#include <QVector>

class ClockObject : public QAbstractListModel {
    Q_OBJECT

public:
    explicit ClockObject(QObject* parent = nullptr);
    enum Roles {
        DateTime = Qt::UserRole,
        Active,
    };

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    struct AlarmData {
        QDateTime datetime;
        bool active;
    };
    QVector<AlarmData> m_alarms;
};
