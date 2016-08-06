/****************************************************************************
** Meta object code from reading C++ file 'AppSettings.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/AppSettings.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'AppSettings.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AppSettings[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       6,   74, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: signature, parameters, type, tag, flags
      28,   13,   12,   12, 0x05,
      61,   56,   12,   12, 0x05,
      91,   82,   12,   12, 0x05,
     122,  112,   12,   12, 0x05,
     164,  148,   12,   12, 0x05,
     217,  196,   12,   12, 0x05,

 // slots: signature, parameters, type, tag, flags
     251,   13,   12,   12, 0x0a,
     275,   56,   12,   12, 0x0a,
     292,   82,   12,   12, 0x0a,
     309,  112,   12,   12, 0x0a,
     331,  148,   12,   12, 0x0a,
     359,  196,   12,   12, 0x0a,

 // properties: name, type, flags
      13,  389, 0x01495903,
      56,  394, 0x0a495903,
      82,  402, 0x02495903,
     112,  394, 0x0a495903,
     148,  394, 0x0a495903,
     196,  389, 0x01495903,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,

       0        // eod
};

static const char qt_meta_stringdata_AppSettings[] = {
    "AppSettings\0\0startFavorites\0"
    "startFavoritesChanged(bool)\0font\0"
    "fontChanged(QString)\0fontSize\0"
    "fontSizeChanged(int)\0fontColor\0"
    "fontColorChanged(QString)\0backgroundColor\0"
    "backgroundColorChanged(QString)\0"
    "useBackgroundTexture\0"
    "useBackgroundTextureChanged(bool)\0"
    "setStartFavorites(bool)\0setFont(QString)\0"
    "setFontSize(int)\0setFontColor(QString)\0"
    "setBackgroundColor(QString)\0"
    "setUseBackgroundTexture(bool)\0bool\0"
    "QString\0int\0"
};

void AppSettings::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        AppSettings *_t = static_cast<AppSettings *>(_o);
        switch (_id) {
        case 0: _t->startFavoritesChanged((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: _t->fontChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->fontSizeChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->fontColorChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->backgroundColorChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->useBackgroundTextureChanged((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 6: _t->setStartFavorites((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 7: _t->setFont((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: _t->setFontSize((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 9: _t->setFontColor((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 10: _t->setBackgroundColor((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 11: _t->setUseBackgroundTexture((*reinterpret_cast< bool(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData AppSettings::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject AppSettings::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AppSettings,
      qt_meta_data_AppSettings, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AppSettings::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *AppSettings::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *AppSettings::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AppSettings))
        return static_cast<void*>(const_cast< AppSettings*>(this));
    return QObject::qt_metacast(_clname);
}

int AppSettings::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = getStartFavorites(); break;
        case 1: *reinterpret_cast< QString*>(_v) = getFont(); break;
        case 2: *reinterpret_cast< int*>(_v) = getFontSize(); break;
        case 3: *reinterpret_cast< QString*>(_v) = getFontColor(); break;
        case 4: *reinterpret_cast< QString*>(_v) = getBackgroundColor(); break;
        case 5: *reinterpret_cast< bool*>(_v) = getUseBackgroundTexture(); break;
        }
        _id -= 6;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setStartFavorites(*reinterpret_cast< bool*>(_v)); break;
        case 1: setFont(*reinterpret_cast< QString*>(_v)); break;
        case 2: setFontSize(*reinterpret_cast< int*>(_v)); break;
        case 3: setFontColor(*reinterpret_cast< QString*>(_v)); break;
        case 4: setBackgroundColor(*reinterpret_cast< QString*>(_v)); break;
        case 5: setUseBackgroundTexture(*reinterpret_cast< bool*>(_v)); break;
        }
        _id -= 6;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void AppSettings::startFavoritesChanged(bool _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void AppSettings::fontChanged(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void AppSettings::fontSizeChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void AppSettings::fontColorChanged(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void AppSettings::backgroundColorChanged(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void AppSettings::useBackgroundTextureChanged(bool _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}
QT_END_MOC_NAMESPACE
