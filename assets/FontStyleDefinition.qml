import bb.cascades 1.4

TextStyleDefinition {
    base: SystemDefaults.TextStyles.BodyText
    color: Color.create(appSettings.fontColor)
    fontSize: appSettings.fontSize
    textAlign: TextAlign.Center
    
    rules: [
        FontFaceRule {
            source: "asset:///fonts/lilac_malaria/lilac_malaria.ttf"
            fontFamily: "Lilac-malaria"
        },
        FontFaceRule {
            source: "asset:///fonts/calligraffiti/Calligraffiti.ttf"
            fontFamily: "Calligraffiti"
        },
        FontFaceRule {
            source: "asset:///fonts/andada/Andada-Regular.otf"
            fontFamily: "Andada"
        },
        FontFaceRule {
            source: "asset:///fonts/my_underwood/MyUnderwood.ttf"
            fontFamily: "Underwood"
        }
    ]
    fontFamily: appSettings.font + ", sans-serif"
}
