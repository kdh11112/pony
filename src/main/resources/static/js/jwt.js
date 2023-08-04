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
      // 서버에서 반환된 토큰을 응답 헤더에서 가져옵니다.
      const token = response.headers.get('Authorization');
      if (token) {
        // 토큰을 로컬 스토리지에 저장합니다.
        localStorage.setItem('jwtToken', token);
      } else {
        throw new Error('Error: Token not found in response headers');
      }
      return response.json();
    } else {
      throw new Error('Error: ' + response.statusText);
    }
  })
  .then(responseJson => {
    // 서버에서 반환된 데이터를 처리합니다.
    // 예: 로그인 성공 후 화면 이동 등
  })
  .catch(error => {
    console.error('Error:', error);
  });
}
