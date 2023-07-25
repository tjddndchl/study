let score = 0;//게임점수
let time = 30;//게임시간
let gameInterval;//interval id

let mole = document.getElementById("mole");// 두더지
let scoreSpan = document.getElementById("score");//점수
let timeSpan = document.getElementById("time");//시간

function randomPosition(){
    let x = Math.floor(Math.random()*500);//500px이내 x위치
    let y = Math.floor(Math.random()*500);//500px이내 y위치
    mole.style.left = x + "px";
    // javascript 템플릿 리터럴 ()
    mole.style.top = `${y}px`;//작은따옴표아닌 숫1왼쪽에있는
}
//두더지가 나타나는 함수
function showMole(){
    randomPosition();
    mole.style.display = 'block';
    setTimeout(hideMole, 1000);//1초뒤에 사라지도록
}
function hideMole(){
    mole.style.display = 'none';
}

mole.addEventListener('click', function(){
    score ++;
    scoreSpan.innerText = score;
    hideMole();
});


gameInterval = setInterval(showMole, 2000); //게임시작 2초마다 나타나도록!

//시간 감소
let timeInterval = setInterval(function(){
    time--;
    timeSpan.innerText = time;
    if(time < 0){
        clearInterval(gameInterval);//두더지 나타남 중지
        clearInterval(timeInterval);//시간 감소 중지
        alert(`게임 오버!! 당신의 점수는 ${score}  점 입니다.`);
    }
},1000);//1초마다 감소되도록