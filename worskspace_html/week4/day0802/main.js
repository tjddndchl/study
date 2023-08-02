function SetCookie(name, val, expireDate){
    let cookieStr = name + "=" + escape(val) +
        ((expireDate == null)?"" : ("; expires=" + expireDate.toUTCString()));
        document.cookie = cookieStr;
}
function GetCookie(name){
    let str = name + "=";
    // 쿠키는 속성별 구분을 : <-- 로함
    let pairs = document.cookie.split(";");
    for(let i=0; i<pairs.length; i++){
        let pair =pairs[i].trim();//공백제거
        //Key=value <--로 지정되어 있기 때문에 = <--로 분리
        let unit = pair.split("=");
        if(unit[0] == name){
            return unescape(unit[1]);
        }
    }
}