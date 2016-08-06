/*
 * AppSettings.hpp
 *
 *  Created on: Jul 21, 2015
 *      Author: probity
 */

#ifndef APPSETTINGS_HPP_
#define APPSETTINGS_HPP_

#include <QObject>
#include <QVariantMap>
#include <QUrl>

/*
 * Handles application wide settings
 */
class AppSettings : public QObject
{
    Q_OBJECT

    Q_PROPERTY( bool startFavorites READ getStartFavorites WRITE setStartFavorites NOTIFY startFavoritesChanged FINAL )
    Q_PROPERTY( QString font READ getFont WRITE setFont NOTIFY fontChanged FINAL )
    Q_PROPERTY( int fontSize READ getFontSize WRITE setFontSize NOTIFY fontSizeChanged FINAL)
    Q_PROPERTY( QString fontColor READ getFontColor WRITE setFontColor NOTIFY fontColorChanged FINAL)
    Q_PROPERTY( QString backgroundColor READ getBackgroundColor WRITE setBackgroundColor NOTIFY backgroundColorChanged FINAL)
    Q_PROPERTY( bool useBackgroundTexture READ getUseBackgroundTexture WRITE setUseBackgroundTexture NOTIFY useBackgroundTextureChanged FINAL)

public:
    AppSettings(QObject *parent = 0);
    virtual ~AppSettings();

    bool getStartFavorites() const;
    QString getFont() const;
    int getFontSize() const;
    QString getFontColor() const;
    QString getBackgroundColor() const;
    bool getUseBackgroundTexture() const;

public slots:
    void setStartFavorites(bool startFavorites);
    void setFont(QString font);
    void setFontSize(int fontSize);
    void setFontColor(QString fontColor);
    void setBackgroundColor(QString backgroundColor);
    void setUseBackgroundTexture(bool useBackgroundTexture);

signals:
    void startFavoritesChanged(bool startFavorites);
    void fontChanged(QString font);
    void fontSizeChanged(int fontSize);
    void fontColorChanged(QString fontColor);
    void backgroundColorChanged(QString backgroundColor);
    void useBackgroundTextureChanged(bool useBackgroundTexture);

private:
//    Default values for properties.
    static const bool mDefaultStartFavorites;
    static const QString mDefaultFont;
    static const int mDefaultFontSize;
    static const QString mDefaultFontColor;
    static const QString mDefaultBackgroundColor;
    static const bool mDefaultUseBackgroundTexture;

//    Keys where the values are stored in the QSettings Object.
    static const QString MCCHYMNS_START_FAVORITES_KEY;
    static const QString MCCHYMNS_FONT_KEY;
    static const QString MCCHYMNS_FONT_SIZE_KEY;
    static const QString MCCHYMNS_FONT_COLOR_KEY;
    static const QString MCCHYMNS_BACKGROUND_COLOR_KEY;
    static const QString MCCHYMNS_USE_BACKGROUND_TEXTURE_KEY;

//    The property variables.
    bool mStartFavorites;
    QString mFont;
    int mFontSize;
    QString mFontColor;
    QString mBackgroundColor;
    bool mUseBackgroundTexture;
};
#endif /* APPSETTINGS_HPP_ */
