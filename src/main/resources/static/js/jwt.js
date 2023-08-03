function login(email, password) {
  fetch('/login_proc', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ email, password }),
  })
  .then(response => {
    if (response.ok) {
      return response.json();
    } else {
      throw new Error('Error: ' + response.statusText);
    }
  })
  .then(responseJson => {
    // 서버에서 반환된 JWT를 저장합니다.
    localStorage.setItem('jwtToken', responseJson.token);
  })
  .catch(error => {
    console.error('Error:', error);
  });
}
