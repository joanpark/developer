/**
 * Created with JetBrains WebStorm.
 * User: 정현
 * Date: 14. 2. 26
 * Time: 오전 2:20
 * To change this template use File | Settings | File Templates.
 */


var GLOBAL = {
    inputWidth: 150,
    inputHeight: 20,
    clouldInputOffsetX : 15,
    maxInputText: 25,
    cloudTurnOn: true,
    language: "KOR"     // KOR, ENG, CHN, JPN, ...
};

var LOCALE_CAPTION_TABLE = [

    {
        caption_id: "cap_view_count",
        kor: "조회수",
        eng: "view"
    },
    {
        caption_id: "cap_author",
        kor: "작성자",
        eng: "author"
    },
];

// Get caption string
function g_GetCaption(captionId){
    var tempCaption = {};

    for(var i=0; i<LOCALE_CAPTION_TABLE.length; i++){
        tempCaption = LOCALE_CAPTION_TABLE[i];

        if( tempCaption.caption_id == captionId ){
            if( GLOBAL.language == "KOR")
                return tempCaption.kor;
            else if( GLOBAL.language == "ENG" )
                return tempCaption.eng;
        }
    }

    return "";
}