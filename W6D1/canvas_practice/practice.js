document.addEventListener("DOMContentLoaded", function(){
    const mycanvas = document.getElementById("mycanvas");
    mycanvas.width = 500;
    mycanvas.height = 500;

    const ctx = mycanvas.getContext("2d");
    ctx.fillStyle = "blue";
    ctx.fillRect(0,0,500,500);

    ctx.arc(100, 100, 20, 0, 2 * Math.PI, true);
    ctx.strokeStyle = "yellow";
    ctx.lineWidth = 10;
    ctx.stroke();
    ctx.fillStyle = "green";
    ctx.fill();
});

