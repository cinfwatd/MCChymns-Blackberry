/*
 * AppSettings.cpp
 *
 *  Created on: Jul 21, 2015
 *      Author: probity
 */

#include "AppSettings.hpp"
#include <QCoreApplication>
#include <QDebug>
#include <QSettings>

//Setting default values.
const bool AppSettings::mDefaultStartFavorites(false);
const QString AppSettings::mDefaultFont("Lilac_malaria");
const int AppSettings::mDefaultFontSize(18);
const QString AppSettings::mDefaultFontColor("#62371A");
const QString AppSettings::mDefaultBackgroundColor("fff0d8a9");
const bool AppSettings::mDefaultUseBackgroundTexture(true);

//Settings keys.
const QString AppSettings::MCCHYMNS_START_FAVORITES_KEY("start_favorites");
const QString AppSettings::MCCHYMNS_FONT_KEY("font");
const QString AppSettings::MCCHYMNS_FONT_SIZE_KEY("font_size");
const QString AppSettings::MCCHYMNS_FONT_COLOR_KEY("font_color");
const QString AppSettings::MCCHYMNS_BACKGROUND_COLOR_KEY("background_color");
const QString AppSettings::MCCHYMNS_USE_BACKGROUND_TEXTURE_KEY("use_background_texture");

AppSettings::AppSettings(QObject* parent) : QObject(parent)
{
//    Set up the QSettings object for the application with organization adn application name
    QCoreApplication::setOrganizationName("Bitrient");
    QCoreApplication::setApplicationName("MCCHymns");

//    Load the values from QSettings or set as the default values if not yet set.
    mStartFavorites = QSettings().value(MCCHYMNS_START_FAVORITES_KEY, mDefaultStartFavorites).toBool();
    mFont = QSettings().value(MCCHYMNS_FONT_KEY, mDefaultFont).toString();
    mFontSize = QSettings().value(MCCHYMNS_FONT_SIZE_KEY, mDefaultFontSize).toInt();
    mFontColor = QSettings().value(MCCHYMNS_FONT_COLOR_KEY, mDefaultFontColor).toString();
    mBackgroundColor = QSettings().value(MCCHYMNS_BACKGROUND_COLOR_KEY, mDefaultBackgroundColor).toString();
    mUseBackgroundTexture = QSettings().value(MCCHYMNS_USE_BACKGROUND_TEXTURE_KEY, mDefaultUseBackgroundTexture).toBool();
}

AppSettings::~AppSettings() {

}

bool AppSettings::getStartFavorites() const
{
    return mStartFavorites;
}

QString AppSettings::getFont() const
{
    return mFont;
}

int AppSettings::getFontSize() const
{
    return mFontSize;
}

QString AppSettings::getFontColor() const
{
    return mFontColor;
}

QString AppSettings::getBackgroundColor() const
{
    return mBackgroundColor;
}

bool AppSettings::getUseBackgroundTexture() const
{
    return mUseBackgroundTexture;
}

void AppSettings::setStartFavorites(bool startFavorites)
{
    if (mStartFavorites != startFavorites) {
        QSettings().setValue(MCCHYMNS_START_FAVORITES_KEY, startFavorites);
        mStartFavorites = startFavorites;
        emit startFavoritesChanged(startFavorites);
    }
}

void AppSettings::setFont(QString font)
{
    if (mFont != font) {
        QSettings().setValue(MCCHYMNS_FONT_KEY, font);
        mFont = font;
        emit fontChanged(font);
    }
}

void AppSettings::setFontSize(int fontSize)
{
    if (mFontSize != fontSize) {
        QSettings().setValue(MCCHYMNS_FONT_SIZE_KEY, fontSize);
        mFontSize = fontSize;
        emit fontSizeChanged(fontSize);
    }
}

void AppSettings::setFontColor(QString fontColor)
{
    if (mFontColor != fontColor) {
        QSettings().setValue(MCCHYMNS_FONT_COLOR_KEY, fontColor);
        mFontColor = fontColor;
        emit fontColorChanged(fontColor);
    }
}

void AppSettings::setBackgroundColor(QString backgroundColor)
{
    if (mBackgroundColor != backgroundColor) {
        QSettings().setValue(MCCHYMNS_BACKGROUND_COLOR_KEY, backgroundColor);
        mBackgroundColor = backgroundColor;
        emit backgroundColorChanged(backgroundColor);
    }
}

void AppSettings::setUseBackgroundTexture(bool useBackgroundTexture)
{
    if (mUseBackgroundTexture != useBackgroundTexture) {
        QSettings().setValue(MCCHYMNS_USE_BACKGROUND_TEXTURE_KEY, useBackgroundTexture);
        mUseBackgroundTexture = useBackgroundTexture;
        emit useBackgroundTextureChanged(useBackgroundTexture);
    }
}




