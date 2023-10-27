document.addEventListener("DOMContentLoaded", function () {
    const searchForm = document.getElementById("searchForm"); // ID 수정
    const recommendationsTable = document.getElementById("recommendationsList"); // ID 수정

    searchForm.addEventListener("submit", function (event) {
        event.preventDefault(); // 기본 제출 동작을 막습니다.

        const user_input = document.getElementById("anime_title").value; //

        // 입력 필드 초기화
        const animeTitleInput = document.getElementById("anime_title");
        animeTitleInput.value = "";

        // 추천 결과 초기화
        recommendationsTable.innerHTML = "";

        // AJAX를 사용하여 서버로부터 새로운 추천을 가져올 수 있습니다.
        fetch('/recommendations', {
            method: 'POST',
            body: new URLSearchParams({ anime_title: user_input }),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
        })
        .then(response => response.json())
        .then(data => {
            // 가져온 데이터를 사용하여 화면을 업데이트합니다.
            if (data.length > 0) {
                recommendationsTable.innerHTML = "<ul>";
                data.forEach(anime => {
                    recommendationsTable.innerHTML += `
                        <li>
                            <strong>Title:</strong> ${anime.Title}<br>
                            <strong>Genre:</strong> ${anime.Genre}<br>
                            <strong>User Rating:</strong> ${anime['User Rating']}<br>
                            <strong>Gross:</strong> $${anime.Gross}
                        </li>
                    `;
                });
                recommendationsTable.innerHTML += "</ul>";
            } else {
                recommendationsTable.innerHTML = "<p>No recommendations available.</p>";
            }
        });
    });
});