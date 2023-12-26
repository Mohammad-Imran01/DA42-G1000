function quotient(value){
    return Math.floor(value/10);
}

function remainder(value){
    return value % 10;
}

function asd(value){
    var sf =(value+ 1)% 10;
    return sf === 0;
}
function degreesToRadians(degrees) {
    return degrees * (Math.PI / 180);
}

function paddingSting(value){
    return value.toString().padStart(3, "0") + "°";
}
