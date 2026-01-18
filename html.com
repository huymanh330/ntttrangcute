<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trò chơi tìm điểm khác biệt</title>
    <style>
        body { margin: 0; overflow: hidden; background: #000; font-family: sans-serif; cursor: pointer; }
        #content { color: white; text-align: center; margin-top: 20%; }
        #scare {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100vw; height: 100vh;
            background: url('https://raw.githubusercontent.com') no-repeat center center;
            background-size: cover;
            z-index: 999;
        }
    </style>
</head>
<body onclick="startScare()">

    <div id="content">
        <h1>Bạn có tìm được điểm khác biệt không?</h1>
        <p>Nhấp vào bất kỳ đâu để bắt đầu chơi...</p>
        <img src="https://picsum.photos" alt="Game" style="border: 5px solid white;">
    </div>

    <!-- Hình ảnh ma và âm thanh -->
    <div id="scare"></div>
    <audio id="scream" src="https://www.soundboard.com"></audio>

    <script>
        function startScare() {
            // Chờ 3 giây sau khi click rồi mới hù
            setTimeout(function() {
                document.getElementById('scare').style.display = 'block';
                document.getElementById('scream').play();
                
                // Yêu cầu toàn màn hình để tăng độ sợ hãi
                document.documentElement.requestFullscreen();
            }, 3000);
        }
    </script>
</body>
</html>
