const questions = [
    {
        question: "which is larget animal in the world? ",
        answers: [
            {text: "shark", correct: false},
            {text: "blue whale", correct: false},
            {text: "elephant", correct: true},
            {text: "giraffe", correct: false},
        ]
    },
    {
        question: "which is larget animal in the world? ",
        answers: [
            {text: "shark", correct: false},
            {text: "blue whale", correct: false},
            {text: "elephant", correct: true},
            {text: "giraffe", correct: false},
        ]
    },
    {
        question: "which is larget animal in the world? ",
        answers: [
            {text: "shark", correct: false},
            {text: "blue whale", correct: false},
            {text: "elephant", correct: false},
            {text: "giraffe", correct: true},
        ]
    },
    {
        question: "which is larget animal in the world? ",
        answers: [
            {text: "shark", correct: false},
            {text: "blue whale", correct: true},
            {text: "elephant", correct: false},
            {text: "giraffe", correct: false},
        ]
    }
];

const questionElement = document.getElementById("question");
const answerButtons = document.getElementById("answer-buttons");
const nextButton = document.getElementById("next-btn");

let currentQusertionIndex= 0;
let score = 0;

function startQuiz(){
    currentQusertionIndex = 0;
    score = 0;
    nextButton.innerHTML = "다음";
    showQuestion();
}

function showQuestion(){
    resetState();
    let currentQuestion = questions[currentQusertionIndex];
    let questionNo = currentQusertionIndex + 1;
    questionElement.innerHTML = questionNo + "." + currentQuestion.question;

    currentQuestion.answers.forEach(answer => {
        const button = document.createElement("button");
        button.innerHTML = answer.text;
        button.classList.add("btn");
        answerButtons.appendChild(button);
        if(answer.correct){
            button.dataset.correct = answer.correct;
        }
        button.addEventListener("click", selectAnswer);
    });
}

function resetState(){
    nextButton.style.display = "none";
    while(answerButtons.firstChild){
        answerButtons.removeChild(answerButtons.firstChild);
    }
}

function selectAnswer(e){
    const selectedBtn = e.target;
    const isCorrect = selectedBtn.dataset.correct === "true";
    if(isCorrect){
        selectedBtn.classList.add("correct");
        score++;
    }else{
        selectedBtn.classList.add("incorrect");
    }
    Array.from(answerButtons.children).forEach(button => {
        if(button.dataset.correct === "true"){
            button.classList.add("correct");
        }
        button.disabled = true;
    });
    nextButton.style.display = "block";
}

function showScore(){
    resetState();
    questionElement.innerHTML = `You scored ${score} out of ${questions.length}!`;
    nextButton.innerHTML = "play again";
    nextButton.style.display = "block";
}

function handleNextButton(){
    currentQusertionIndex++;
    if(currentQusertionIndex < questions.length){
        showQuestion();
    }else{
        showScore();
    }
}


nextButton.addEventListener("click", ()=>{
    if(currentQusertionIndex < questions.length){
        handleNextButton();
    }else{
        startQuiz();
    }
})

startQuiz();