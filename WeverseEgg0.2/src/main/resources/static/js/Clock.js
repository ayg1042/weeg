/**
 * 
 */


// 되는 코드
/*function updateClock() {
    var now = new Date();
    var hours = now.getHours().toString().padStart(2, '0');
    var minutes = now.getMinutes().toString().padStart(2, '0');
    var seconds = now.getSeconds().toString().padStart(2, '0');

    var timeString = `${hours}:${minutes}:${seconds}`;
    document.getElementById('clock').textContent = timeString;
}

// 매 초마다 시계 업데이트
setInterval(updateClock, 1000);

// 페이지 로드 시에도 시계 업데이트
updateClock();*/


// 스탑워치
/*const dateNow = document.querySelector('#date-now > span');
const timeNow = document.querySelector('#time-now > span');
const timer = document.querySelector('#timer');
const startBtn = document.getElementById('startTimer');
const stopBtn = document.getElementById('stopTimer');
const clearBtn = document.getElementById('clearTimer');
const timerStatus = { RUNNING: true, STOP: false };
let nowStatus = timerStatus.STOP;
let timerID = "";

setInterval(date_setting, 200);

startBtn.onclick = () => {
    nowStatus = timerStatus.RUNNING;
    if(timerID === ""){
        timerID = setInterval(timer_setting, 1000);
    }
};

stopBtn.onclick = () => {
    nowStatus = timerStatus.STOP;
};

clearBtn.onclick = () => {
    if(timerID !== ""){
        clearInterval(timerID);
        timerID = "";
        timer.textContent = "00:00:00";
    }    
};

function date_setting(){
    const date = new Date();
    const dateString = `${date.getFullYear()}-${format_setting(date.getMonth() + 1)}-${format_setting(date.getDate())}`;
    dateNow.textContent = dateString;
    const timeString = `${format_setting(date.getHours())}:${format_setting(date.getMinutes())}:${format_setting(date.getSeconds())}`;
    timeNow.textContent = timeString;
}

function timer_setting(){
    if(nowStatus === timerStatus.STOP){ return; }

    let timerNowString = timer.textContent;
    let times = timerNowString.split(':');
    let hour = +times[0];
    let min = +times[1];
    let sec = +times[2];
    sec++;
    if(sec >= 60){ min++; sec = 0; }
    if(min >= 60){ hour++; min = 0; }
    if(hour >= 24){ hour = 0; clearInterval(timerID); }
    
    const timerString = `${format_setting(hour)}:${format_setting(min)}:${format_setting(sec)}`;
    timer.textContent = timerString;
}

function format_setting(data){
    return data.toString().length < 2 ? '0' + data : data;
}*/



class DigitalClock {
  constructor(clockElement, timerElement) {
    this.clockElement = clockElement;
    this.timerElement = timerElement;
    this.timerInterval = null;
    this.remainingTime = 0;
    this.updateClock();
    setInterval(() => this.updateClock(), 1000);
  }

  updateClock() {
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    this.clockElement.textContent = `${hours}:${minutes}:${seconds}`;
  }

  startTimer(seconds) {
    this.remainingTime = seconds;
    this.updateTimerDisplay();
    if (this.timerInterval) clearInterval(this.timerInterval);
    this.timerInterval = setInterval(() => {
      this.updateTimerDisplay();
      if (this.remainingTime > 0) {
        this.remainingTime--;
      } else {
        clearInterval(this.timerInterval);
        this.timerElement.textContent = "00:00";
        alert("타이머 종료!");
      }
    }, 1000);
  }

  updateTimerDisplay() {
    const minutes = String(Math.floor(this.remainingTime / 60)).padStart(2, '0');
    const seconds = String(this.remainingTime % 60).padStart(2, '0');
    this.timerElement.textContent = `${minutes}:${seconds}`;
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const clockElement = document.getElementById("clock");
  const timerElement = document.getElementById("timer");
  const timerInput = document.getElementById("timerInput");
  const startTimerButton = document.getElementById("startTimer");
  
  const clock = new DigitalClock(clockElement, timerElement);
  
  startTimerButton.addEventListener("click", () => {
    const seconds = parseInt(timerInput.value, 10);
    if (!isNaN(seconds) && seconds > 0) {
      clock.startTimer(seconds);
    }
  });
});
